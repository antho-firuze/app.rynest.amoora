import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_streaming/model/audience.dart';
import 'package:amoora/features/live_streaming/model/presenter.dart';
import 'package:amoora/features/live_streaming/service/signaling_service.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

// COMMON SECTION
final timeoutProvider = StateProvider<int>((ref) => 30);
final serverProvider = StateProvider<Server>((ref) => Server.google);
final onlineHostProvider = StateProvider<List<Presenter>>((ref) => []);
final participantProvider = StateProvider<List<Audience>>((ref) => []);

// PRESENTER SECTION
final localRendererProvider = StateProvider<RTCVideoRenderer>((ref) => RTCVideoRenderer());
final isOnlineProvider = StateProvider<bool>((ref) => false);
final presenterProvider = StateProvider<Presenter?>((ref) => null);
final refreshMediaProvider = StateProvider<bool>((ref) => false);

// AUDIENCE SECTION
final remoteRendererProvider = StateProvider<RTCVideoRenderer>((ref) => RTCVideoRenderer());
final isConnectedProvider = StateProvider<bool>((ref) => false);
final selectedPresenterProvider = StateProvider<Presenter?>((ref) => null);
final audienceProvider = StateProvider<Audience?>((ref) => null);

class SignalingCtrl {
  Ref ref;
  SignalingCtrl(this.ref);

  // COMMON SECTION VARIABLE
  Map<String, dynamic> _configuration = {};
  int heartbeat = 10; // in seconds
  Timer? _timeoutTimer;
  int connectionTimeout = 30; // in seconds
  void Function()? onTimeout;

  // PRESENTER SECTION VARIABLE
  Map<int, RTCPeerConnection?> _peers = {};
  Map<int, Map<String, dynamic>> _offers = {};
  MediaStream? _localStream;
  ProviderSubscription? _onlineHostSubs;
  ProviderSubscription? _onlineParticipantSubs;
  // STATE : active | inactive

  // AUDIENCE SECTION VARIABLE
  RTCPeerConnection? _peer;
  Map<String, dynamic> _answer = {};
  MediaStream? _remoteStream;
  ProviderSubscription? _audienceSubs;
  void Function()? onDisconnected;
  void Function()? onFailed;
  void Function(String serverName)? onServerConnectionFailed;
  // STATE : join | offer | answer | connected | leave | inactive

  Future _fetchConfiguration() async {
    try {
      log('fetchConfiguration :', name: 'SIGNALING-CTRL');

      _configuration = await ref.read(signalingSvcProvider).fetchConfiguration(ref.read(serverProvider));

      log('$_configuration', name: 'SIGNALING-CTRL');
    } catch (e) {
      if (onServerConnectionFailed != null) onServerConnectionFailed!(serverName[ref.read(serverProvider)]!);
    }
  }

  // PRESENTER SECTION
  Future _openUserMedia() async {
    log('openUserMedia', name: 'SIGNALING-CTRL');
    ref.read(localRendererProvider.notifier).state = RTCVideoRenderer();
    ref.read(localRendererProvider.notifier).state.initialize();
    // LOCAL STREAM
    _localStream = await navigator.mediaDevices.getUserMedia({'audio': true, 'video': false});
    ref.read(localRendererProvider.notifier).state.srcObject = _localStream;

    // REFRESH MEDIA
    ref.read(refreshMediaProvider.notifier).state = true;
  }

  Future _closeUserMedia() async {
    log('closeUserMedia', name: 'SIGNALING-CTRL');
    await _localStream?.dispose();
    _localStream = null;
    ref.read(localRendererProvider.notifier).state.srcObject = null;
    await ref.read(localRendererProvider.notifier).state.dispose();

    // REFRESH MEDIA
    ref.read(refreshMediaProvider.notifier).state = false;
  }

  Future<int?> _createRoom(Map<String, dynamic> data) async {
    log('Create Room => start', name: 'SIGNALING-CTRL');
    data['state'] = 'active';
    log("$data", name: 'SIGNALING-CTRL');
    final reqs = Reqs(path: '/api/v1/signaling/createPresenter', data: data);
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) {
      log('Create Room => error', name: 'SIGNALING-CTRL');
      // throw Exception(state.error. .toString());
      return null;
    }

    final presenter = Presenter.fromJson(state.value);
    ref.read(presenterProvider.notifier).state = presenter;

    return presenter.id;
  }

  Future _waitingAudiences(int presenterId) async {
    _onlineParticipantSubs = ref.listen(onlineParticipantStreamProvider(presenterId), (previous, next) async {
      SseMessage event = next.value;
      // log("Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}");

      if (event.data.isEmpty) {
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isEmpty) {
        log('total online participant : $jsonList', name: 'SIGNALING-CTRL');
        ref.read(participantProvider.notifier).state = [];
      } else {
        List<Audience> datas = jsonList.map((json) {
          if (json['offer'] != null) json['offer'] = jsonDecode(json['offer']);
          if (json['answer'] != null) json['answer'] = jsonDecode(json['answer']);
          return Audience.fromJson(json);
        }).toList();
        for (var audience in datas) {
          // LOG STATE CHANGED
          log('peer${audience.id} : audience state changed : ${audience.state}', name: 'SIGNALING-CTRL');

          // CREATE NEW PEER CONNECTION
          if (audience.state == 'join') {
            if (_peers[audience.id] == null) {
              await _createInstancePeerConnection(audience.id);
            }
          }

          // SET REMOTE DESCRIPTION
          if (audience.state == 'answer') {
            if (await _peers[audience.id]?.getRemoteDescription() == null) {
              var answer = RTCSessionDescription(audience.answer!['sdp'], audience.answer!['type']);
              await _peers[audience.id]?.setRemoteDescription(answer);
            }
          }

          if (['leave', 'inactive'].contains(audience.state)) {
            await _closeInstancePeerConnection(audience.id);
          }
        }
        log('total online participant : ${datas.length}', name: 'SIGNALING-CTRL');
        ref.read(participantProvider.notifier).state = datas;
      }
    });
  }

  Future _createInstancePeerConnection(int audienceId) async {
    try {
      log('peer$audienceId : Create Peer Connection : $_configuration', name: 'SIGNALING-CTRL');
      _peers[audienceId] = await createPeerConnection(_configuration);

      _registerPeersConnectionListener(audienceId);

      // CANDIDATES
      _peers[audienceId]?.onIceCandidate = (RTCIceCandidate candidate) async {
        _offers[audienceId] = (await _peers[audienceId]?.getLocalDescription())?.toMap();
      };

      // ADD TRACK FROM LOCAL STREAM
      log('peer$audienceId : addTrack from local Stream', name: 'SIGNALING-CTRL');
      _localStream?.getTracks().forEach((track) async => await _peers[audienceId]?.addTrack(track, _localStream!));

      await _peers[audienceId]?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendOnly),
      );

      await _peers[audienceId]?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendOnly),
      );

      // CREATE OFFER
      log('peer$audienceId : Create Offer', name: 'SIGNALING-CTRL');
      final offer = await _peers[audienceId]?.createOffer();

      // SET LOCAL DESCRIPTION
      log('peer$audienceId : setLocalDescription', name: 'SIGNALING-CTRL');
      await _peers[audienceId]?.setLocalDescription(offer!);
      _offers[audienceId] = offer!.toMap();
    } catch (e) {
      log('peer$audienceId : createInstancePeerConnection | error', error: e, name: 'SIGNALING-CTRL');
    }
  }

  void _registerPeersConnectionListener(int audienceId) {
    _peers[audienceId]?.onIceConnectionState = (RTCIceConnectionState state) {
      log('peer$audienceId : ICE connection state change: $state', name: 'SIGNALING-CTRL');
    };

    _peers[audienceId]?.onIceGatheringState = (RTCIceGatheringState state) async {
      log('peer$audienceId : ICE gathering state changed: $state', name: 'SIGNALING-CTRL');

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        final reqs = Reqs(path: '/api/v1/signaling/updateAudience', data: {
          "id": audienceId,
          "offer": _offers[audienceId],
          "state": "offer",
        });
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
        log('peer$audienceId : Got Local ICE Candidate', name: 'SIGNALING-CTRL');
      }
    };

    _peers[audienceId]?.onConnectionState = (RTCPeerConnectionState state) async {
      log('peer$audienceId : Connection state change: $state', name: 'SIGNALING-CTRL');

      if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        final reqs = Reqs(path: '/api/v1/signaling/updateAudience', data: {
          "id": audienceId,
          "offer": null,
          "answer": null,
          "state": "connected",
        });
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
        log('peer$audienceId : Set connection state | connected', name: 'SIGNALING-CTRL');
      }
    };

    _peers[audienceId]?.onSignalingState = (RTCSignalingState state) {
      log('peer$audienceId : Signaling state change: $state', name: 'SIGNALING-CTRL');
    };
  }

  Future _closeInstancePeerConnection(int audienceId) async {
    try {
      log('peer$audienceId : closeInstancePeerConnection', name: 'SIGNALING-CTRL');

      await _peers[audienceId]?.close();
      _peers.remove(audienceId);

      final reqs = Reqs(path: '/api/v1/signaling/removeAudience', data: {"id": audienceId});
      await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
    } catch (e) {
      log('peer$audienceId : closeInstancePeerConnection | error', error: e, name: 'SIGNALING-CTRL');
    }
  }

  void _heartbeatPresenter(int presenterId) async {
    log('presenterId$presenterId : heartbeat presenter | start (every $heartbeat seconds)', name: 'SIGNALING-CTRL');
    await Future.doWhile(() async {
      await Future.delayed(Duration(seconds: heartbeat));

      final reqs = Reqs(path: '/api/v1/signaling/updatePresenter', data: {
        "id": presenterId,
        "heartbeat": DateTime.now().dbDateTime(),
      });
      await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      if (ref.read(presenterProvider) == null) {
        log('presenterId$presenterId : heartbeat presenter | stop', name: 'SIGNALING-CTRL');
        return false;
      }
      // log(':: heartbeat => $time');
      return true;
    });
  }

  Future startMeeting(Map<String, dynamic> data) async {
    try {
      ref.read(isOnlineProvider.notifier).state = true;

      _peers = {};
      _offers = {};

      await _openUserMedia();
      await _fetchConfiguration();

      final presenterId = await _createRoom(data);
      await _waitingAudiences(presenterId!);

      _heartbeatPresenter(presenterId);
    } catch (e) {
      log('start | error', error: e, name: 'SIGNALING-CTRL');
      ref.read(isOnlineProvider.notifier).state = false;
      await closeMeeting();
      throw Exception(e.toString());
    }
  }

  Future closeMeeting([int? presenterId]) async {
    try {
      log('closeAllPeerConnection', name: 'SIGNALING-CTRL');

      ref.read(isOnlineProvider.notifier).state = false;
      ref.read(presenterProvider.notifier).state = null;

      if (presenterId != null) {
        for (var peer in _peers.entries) {
          await peer.value?.close();
        }

        var reqs = Reqs(path: '/api/v1/signaling/removeAudienceByPresenterId', data: {"presenter_id": presenterId});
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        reqs = Reqs(path: '/api/v1/signaling/removePresenter', data: {"id": presenterId});
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
      }

      log('Closing Subscription', name: 'SIGNALING-CTRL');
      _onlineParticipantSubs?.close();

      await _closeUserMedia();
    } catch (e) {
      log('closeAllPeerConnection | error', error: e, name: 'SIGNALING-CTRL');
      throw Exception(e.toString());
    }
  }

  // AUDIENCE/PARTICIPANT SECTION
  Future onlineHostListener() async {
    if (_onlineHostSubs != null) {
      _closedOnlineHostListener();
    }

    // CHECK USER LOGIN
    if (ref.read(authUserProvider) == null) {
      return;
    }

    // CHECK USER ROLE
    if (![1, 99].contains(ref.read(authUserProvider)?.roleId)) {
      log('_onlineHostListener => Not active. This is for role = 1 (roleId = ${ref.read(authUserProvider)?.roleId})',
          name: 'SIGNALING-CTRL');
      return;
    }

    _onlineHostSubs = ref.listen(onlineHostStreamProvider, (previous, next) async {
      SseMessage event = next.value;
      // log("Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}");

      if (event.data.isEmpty) {
        log('total online presenter : Empty', name: 'SIGNALING-CTRL');
        ref.read(onlineHostProvider.notifier).state = [];
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isEmpty) {
        log('total online presenter : $jsonList', name: 'SIGNALING-CTRL');
        ref.read(onlineHostProvider.notifier).state = [];
      } else {
        List<Presenter> datas = jsonList.map((json) => Presenter.fromJson(json)).toList();
        log('total online presenter : ${datas.length}', name: 'SIGNALING-CTRL');
        ref.read(onlineHostProvider.notifier).state = datas;
      }
    });
  }

  void _closedOnlineHostListener() {
    _onlineHostSubs?.close();
    _onlineHostSubs = null;
    ref.read(selectedPresenterProvider.notifier).state = null;
    log('_onlineHostListener => stoped', name: 'SIGNALING-CTRL');
  }

  Future<Audience> _addAudience(Presenter presenter) async {
    log('Add Audience', name: 'SIGNALING-CTRL');

    final reqs = Reqs(path: '/api/v1/signaling/createAudience', data: {
      "presenter_id": presenter.id,
      "state": "join",
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) {
      log('Add Audience | error', name: 'SIGNALING-CTRL');
      // throw Exception(e.toString());
    }

    final audience = Audience.fromJson(state.value);
    ref.read(audienceProvider.notifier).state = audience;

    return audience;
  }

  Future _setRemoteMedia() async {
    log('Init remote media', name: 'SIGNALING-CTRL');
    ref.read(remoteRendererProvider.notifier).state = RTCVideoRenderer();
    ref.read(remoteRendererProvider.notifier).state.initialize();
  }

  void _setConnectionTimeout(Audience audience) async {
    // Set Timeout connection to peerConnection
    log('timeout | set connectionTimeout : $connectionTimeout', name: 'SIGNALING-CTRL');
    _timeoutTimer = Timer.periodic(Duration(seconds: connectionTimeout), (timer) async {
      if (await _peer?.getConnectionState() == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        log('timeout | Timeout Cancelled !', name: 'SIGNALING-CTRL');
        timer.cancel();
      } else {
        log('timeout | Timeout has occured !', name: 'SIGNALING-CTRL');
        if (onTimeout != null) onTimeout!();
        timer.cancel();
        await leaveMeeting(audience.id);
      }
    });
  }

  Future _createPeerConnection(Audience audience) async {
    log('createPeerConnection | $_configuration', name: 'SIGNALING-CTRL');
    _peer = await createPeerConnection(_configuration);

    _registerPeerConnectionListener(audience.id);

    // CANDIDATES
    _peer!.onIceCandidate = (RTCIceCandidate candidate) async {
      final local = await _peer?.getLocalDescription();
      if (local == null) return;

      _answer = local.toMap();
    };

    // ADD REMOTE STREAM
    _peer?.onAddStream = (stream) {
      log('Add remote stream', name: 'SIGNALING-CTRL');
      ref.read(remoteRendererProvider.notifier).state.srcObject = stream;
    };

    // ADD TRACK FROM REMOTE STREAM
    _peer?.onTrack = (RTCTrackEvent event) {
      // log('Got remote track: ${event.streams[0]}', name: 'SIGNALING-CTRL');
      if (event.streams.isEmpty) return;

      event.streams[0].getTracks().forEach((track) async {
        log('Add a track from remote stream $track', name: 'SIGNALING-CTRL');
        await _remoteStream?.addTrack(track);
      });
    };

    await _peer?.addTransceiver(
      kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
      init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly),
    );

    await _peer?.addTransceiver(
      kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
      init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly),
    );

    // WAITING OFFER RESPONSE
    _audienceSubs = ref.listen(audienceStreamProvider(audience.id), (previous, next) async {
      SseMessage event = next.value;
      // log("Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}");

      if (event.data.isEmpty) {
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isNotEmpty) {
        List<Audience> datas = jsonList.map((json) {
          if (json['offer'] != null) json['offer'] = jsonDecode(json['offer']);
          if (json['answer'] != null) json['answer'] = jsonDecode(json['answer']);
          return Audience.fromJson(json);
        }).toList();

        Audience audience = datas[0];
        if (audience.state == 'offer') {
          log('setRemoteDescription', name: 'SIGNALING-CTRL');
          final offer = RTCSessionDescription(audience.offer!['sdp'], audience.offer!['type']);
          await _peer?.setRemoteDescription(offer);

          log('Create Answer', name: 'SIGNALING-CTRL');
          final createdAnswer = await _peer?.createAnswer();
          _answer = createdAnswer!.toMap();

          log('setLocalDescription', name: 'SIGNALING-CTRL');
          await _peer?.setLocalDescription(createdAnswer);
        }
      }
    });
  }

  void _registerPeerConnectionListener(int audienceId) {
    _peer?.onIceConnectionState = (RTCIceConnectionState state) {
      log('ICE connection state change: $state', name: 'SIGNALING-CTRL');
    };

    _peer?.onIceGatheringState = (RTCIceGatheringState state) async {
      log('ICE gathering state changed: $state', name: 'SIGNALING-CTRL');

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        final reqs = Reqs(path: '/api/v1/signaling/updateAudience', data: {
          "id": audienceId,
          "answer": _answer,
          "state": "answer",
        });
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
        log('Got Local ICE Candidate', name: 'SIGNALING-CTRL');
      }
    };

    _peer?.onConnectionState = (RTCPeerConnectionState state) async {
      log('Connection state change: $state', name: 'SIGNALING-CTRL');
      if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        ref.read(isConnectedProvider.notifier).state = true;
      }

      if (state == RTCPeerConnectionState.RTCPeerConnectionStateFailed) {
        await leaveMeeting(audienceId);
        if (onFailed != null) onFailed!();
      }

      if (state == RTCPeerConnectionState.RTCPeerConnectionStateDisconnected) {
        await leaveMeeting(audienceId);
        if (onDisconnected != null) onDisconnected!();
      }
    };

    _peer?.onSignalingState = (RTCSignalingState state) {
      log('Signaling state change: $state', name: 'SIGNALING-CTRL');
    };
  }

  void _heartbeatAudience(int audienceId) async {
    log('audienceId$audienceId : heartbeat audience | start (every $heartbeat seconds)', name: 'SIGNALING-CTRL');
    await Future.doWhile(() async {
      await Future.delayed(Duration(seconds: heartbeat));

      final reqs = Reqs(path: '/api/v1/signaling/updateAudience', data: {
        "id": audienceId,
        "heartbeat": DateTime.now().dbDateTime(),
      });
      await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      if (ref.read(selectedPresenterProvider) == null) {
        log('audienceId$audienceId : heartbeat audience | stop', name: 'SIGNALING-CTRL');
        return false;
      }
      // log(':: heartbeat => $time');
      return true;
    });
  }

  Future joinMeeting(Presenter presenter) async {
    try {
      log('Join Meeting', name: 'SIGNALING-CTRL');

      ref.read(isConnectedProvider.notifier).state = true;
      await _fetchConfiguration();
      await _setRemoteMedia();

      final audience = await _addAudience(presenter);

      _setConnectionTimeout(audience);
      await _createPeerConnection(audience);

      _heartbeatAudience(audience.id);

      ref.read(selectedPresenterProvider.notifier).state = presenter;
    } catch (e) {
      log('Join Meeting | error', error: e, name: 'SIGNALING-CTRL');
      throw Exception(e.toString());
    }
  }

  Future leaveMeeting([int? audienceId]) async {
    try {
      log('Leave Meeting', name: 'SIGNALING-CTRL');

      ref.read(isConnectedProvider.notifier).state = false;
      ref.read(selectedPresenterProvider.notifier).state = null;
      ref.read(remoteRendererProvider.notifier).state.srcObject = null;
      ref.read(remoteRendererProvider.notifier).state.dispose();

      _timeoutTimer?.cancel();

      await _peer?.close();
      _peer = null;

      if (audienceId != null) {
        final reqs = Reqs(path: '/api/v1/signaling/updateAudience', data: {
          "id": audienceId,
          "state": "leave",
        });
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));
      }

      log('Closing Subscription', name: 'SIGNALING-CTRL');
      _audienceSubs?.close();
    } catch (e) {
      log('Leave Meeting | error', error: e, name: 'SIGNALING-CTRL');
    }
  }
}

final signalingCtrlProvider = Provider(SignalingCtrl.new);
