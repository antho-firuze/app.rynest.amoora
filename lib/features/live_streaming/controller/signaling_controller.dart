import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/features/auth/controller/auth_controller.dart';
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

  // COMMON SECTION
  void initialize() async {
    log('Initialize Signaling !', name: 'signaling');
    if (ref.read(authUserProvider)?.roleId == 1) {
      log('listenForOnlineHost | listen', name: 'signaling');
      await _onlineHostListener();
    }

    ref.listen(authUserProvider, (previous, next) async {
      if (next == null) {
        log('listenForOnlineHost | close', name: 'signaling');
        _onlineHostSubs?.close();
        _onlineHostSubs = null;
        // ref.read(onlineHostProvider.notifier).state = [];
        ref.read(selectedPresenterProvider.notifier).state = null;
      } else {
        if (next.roleId == 1 || next.roleId == 99) {
          log('listenForOnlineHost | listen', name: 'signaling');
          await _onlineHostListener();
        }
      }
    });
  }

  Future _fetchConfiguration() async {
    try {
      log('fetchConfiguration :', name: 'signaling');

      _configuration = await ref.read(signalingSvcProvider).fetchConfiguration(ref.read(serverProvider));

      log('$_configuration', name: 'signaling');
    } catch (e) {
      if (onServerConnectionFailed != null) onServerConnectionFailed!(serverName[ref.read(serverProvider)]!);
    }
  }

  // PRESENTER SECTION
  Future _openUserMedia() async {
    log('openUserMedia', name: 'signaling');
    ref.read(localRendererProvider.notifier).state = RTCVideoRenderer();
    ref.read(localRendererProvider.notifier).state.initialize();
    // LOCAL STREAM
    _localStream = await navigator.mediaDevices.getUserMedia({'audio': true, 'video': false});
    ref.read(localRendererProvider.notifier).state.srcObject = _localStream;

    // REFRESH MEDIA
    ref.read(refreshMediaProvider.notifier).state = true;
  }

  Future _closeUserMedia() async {
    log('closeUserMedia', name: 'signaling');
    await _localStream?.dispose();
    _localStream = null;
    ref.read(localRendererProvider.notifier).state.srcObject = null;
    await ref.read(localRendererProvider.notifier).state.dispose();

    // REFRESH MEDIA
    ref.read(refreshMediaProvider.notifier).state = false;
  }

  Future<int?> _createRoom(Map<String, dynamic> data) async {
    try {
      log('Create Room', name: 'signaling');
      data['state'] = 'active';
      log("$data", name: 'signaling');
      final state = await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).createPresenter(data));

      final presenter = Presenter.fromJson(state.value);
      ref.read(presenterProvider.notifier).state = presenter;

      return presenter.id;
    } catch (e) {
      log('Create Room | error', error: e, name: 'signaling');
      throw Exception(e.toString());
    }
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
        log('total online participant : $jsonList', name: 'signaling');
        ref.read(participantProvider.notifier).state = [];
      } else {
        List<Audience> datas = jsonList.map((json) {
          if (json['offer'] != null) json['offer'] = jsonDecode(json['offer']);
          if (json['answer'] != null) json['answer'] = jsonDecode(json['answer']);
          return Audience.fromJson(json);
        }).toList();
        for (var audience in datas) {
          // LOG STATE CHANGED
          log('peer${audience.id} : audience state changed : ${audience.state}', name: 'signaling');

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
        log('total online participant : ${datas.length}', name: 'signaling');
        ref.read(participantProvider.notifier).state = datas;
      }
    });
  }

  Future _createInstancePeerConnection(int audienceId) async {
    try {
      log('peer$audienceId : Create Peer Connection : $_configuration', name: 'signaling');
      _peers[audienceId] = await createPeerConnection(_configuration);

      _registerPeersConnectionListener(audienceId);

      // CANDIDATES
      _peers[audienceId]?.onIceCandidate = (RTCIceCandidate candidate) async {
        _offers[audienceId] = (await _peers[audienceId]?.getLocalDescription())?.toMap();
      };

      // ADD TRACK FROM LOCAL STREAM
      log('peer$audienceId : addTrack from local Stream', name: 'signaling');
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
      log('peer$audienceId : Create Offer', name: 'signaling');
      final offer = await _peers[audienceId]?.createOffer();

      // SET LOCAL DESCRIPTION
      log('peer$audienceId : setLocalDescription', name: 'signaling');
      await _peers[audienceId]?.setLocalDescription(offer!);
      _offers[audienceId] = offer!.toMap();
    } catch (e) {
      log('peer$audienceId : createInstancePeerConnection | error', error: e, name: 'signaling');
    }
  }

  void _registerPeersConnectionListener(int audienceId) {
    _peers[audienceId]?.onIceConnectionState = (RTCIceConnectionState state) {
      log('peer$audienceId : ICE connection state change: $state', name: 'signaling');
    };

    _peers[audienceId]?.onIceGatheringState = (RTCIceGatheringState state) async {
      log('peer$audienceId : ICE gathering state changed: $state', name: 'signaling');

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        var data = {
          "id": audienceId,
          "offer": _offers[audienceId],
          "state": "offer",
        };
        log('peer$audienceId : Got Local ICE Candidate', name: 'signaling');
        await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).updateAudience(data));
      }
    };

    _peers[audienceId]?.onConnectionState = (RTCPeerConnectionState state) async {
      log('peer$audienceId : Connection state change: $state', name: 'signaling');

      if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        var data = {
          "id": audienceId,
          "offer": null,
          "answer": null,
          "state": "connected",
        };
        log('peer$audienceId : Set connection state | connected', name: 'signaling');
        await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).updateAudience(data));
      }
    };

    _peers[audienceId]?.onSignalingState = (RTCSignalingState state) {
      log('peer$audienceId : Signaling state change: $state', name: 'signaling');
    };
  }

  Future _closeInstancePeerConnection(int audienceId) async {
    try {
      log('peer$audienceId : closeInstancePeerConnection', name: 'signaling');

      await _peers[audienceId]?.close();
      _peers.remove(audienceId);

      await ref.read(signalingSvcProvider).removeAudience({"id": audienceId});
    } catch (e) {
      log('peer$audienceId : closeInstancePeerConnection | error', error: e, name: 'signaling');
    }
  }

  void _heartbeatPresenter(int presenterId) async {
    log('presenterId$presenterId : heartbeat presenter | start (every $heartbeat seconds)', name: 'signaling');
    await Future.doWhile(() async {
      await Future.delayed(Duration(seconds: heartbeat));

      final data = {"id": presenterId, "heartbeat": DateTime.now().dbDateTime()};
      await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).updatePresenter(data));

      if (ref.read(presenterProvider) == null) {
        log('presenterId$presenterId : heartbeat presenter | stop', name: 'signaling');
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
      log('start | error', error: e, name: 'signaling');
      ref.read(isOnlineProvider.notifier).state = false;
      await closeMeeting();
      throw Exception(e.toString());
    }
  }

  Future closeMeeting([int? presenterId]) async {
    try {
      log('closeAllPeerConnection', name: 'signaling');

      ref.read(isOnlineProvider.notifier).state = false;
      ref.read(presenterProvider.notifier).state = null;

      if (presenterId != null) {
        for (var peer in _peers.entries) {
          await peer.value?.close();
        }

        await ref.read(signalingSvcProvider).removeAudienceByPresenterId({"presenter_id": presenterId});
        await ref.read(signalingSvcProvider).removePresenter({"id": presenterId});
      }

      log('Closing Subscription', name: 'signaling');
      _onlineParticipantSubs?.close();

      await _closeUserMedia();
    } catch (e) {
      log('closeAllPeerConnection | error', error: e, name: 'signaling');
      throw Exception(e.toString());
    }
  }

  // AUDIENCE/PARTICIPANT SECTION
  Future _onlineHostListener() async {
    _onlineHostSubs = ref.listen(onlineHostStreamProvider, (previous, next) async {
      SseMessage event = next.value;
      // log("Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}");

      if (event.data.isEmpty) {
        log('total online presenter : Empty', name: 'signaling');
        ref.read(onlineHostProvider.notifier).state = [];
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isEmpty) {
        log('total online presenter : $jsonList', name: 'signaling');
        ref.read(onlineHostProvider.notifier).state = [];
      } else {
        List<Presenter> datas = jsonList.map((json) => Presenter.fromJson(json)).toList();
        log('total online presenter : ${datas.length}', name: 'signaling');
        ref.read(onlineHostProvider.notifier).state = datas;
      }
    });
  }

  Future<Audience> _addAudience(Presenter presenter) async {
    try {
      log('Add Audience', name: 'signaling');
      final data = {
        "presenter_id": presenter.id,
        "state": "join",
      };
      final state = await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).createAudience(data));

      final audience = Audience.fromJson(state.value);
      ref.read(audienceProvider.notifier).state = audience;

      return audience;
    } catch (e) {
      log('Add Audience | error', error: e, name: 'signaling');
      throw Exception(e.toString());
    }
  }

  Future _setRemoteMedia() async {
    log('Init remote media', name: 'signaling');
    ref.read(remoteRendererProvider.notifier).state = RTCVideoRenderer();
    ref.read(remoteRendererProvider.notifier).state.initialize();
  }

  void _setConnectionTimeout(Audience audience) async {
    // Set Timeout connection to peerConnection
    log('timeout | set connectionTimeout : $connectionTimeout', name: 'signaling');
    _timeoutTimer = Timer.periodic(Duration(seconds: connectionTimeout), (timer) async {
      if (await _peer?.getConnectionState() == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
        log('timeout | Timeout Cancelled !', name: 'signaling');
        timer.cancel();
      } else {
        log('timeout | Timeout has occured !', name: 'signaling');
        if (onTimeout != null) onTimeout!();
        timer.cancel();
        await leaveMeeting(audience.id);
      }
    });
  }

  Future _createPeerConnection(Audience audience) async {
    log('createPeerConnection | $_configuration', name: 'signaling');
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
      log('Add remote stream', name: 'signaling');
      ref.read(remoteRendererProvider.notifier).state.srcObject = stream;
    };

    // ADD TRACK FROM REMOTE STREAM
    _peer?.onTrack = (RTCTrackEvent event) {
      // log('Got remote track: ${event.streams[0]}', name: 'signaling');
      if (event.streams.isEmpty) return;
      
      event.streams[0].getTracks().forEach((track) async {
        log('Add a track from remote stream $track', name: 'signaling');
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
          log('setRemoteDescription', name: 'signaling');
          final offer = RTCSessionDescription(audience.offer!['sdp'], audience.offer!['type']);
          await _peer?.setRemoteDescription(offer);

          log('Create Answer', name: 'signaling');
          final createdAnswer = await _peer?.createAnswer();
          _answer = createdAnswer!.toMap();

          log('setLocalDescription', name: 'signaling');
          await _peer?.setLocalDescription(createdAnswer);
        }
      }
    });
  }

  void _registerPeerConnectionListener(int audienceId) {
    _peer?.onIceConnectionState = (RTCIceConnectionState state) {
      log('ICE connection state change: $state', name: 'signaling');
    };

    _peer?.onIceGatheringState = (RTCIceGatheringState state) async {
      log('ICE gathering state changed: $state', name: 'signaling');

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        var data = {
          "id": audienceId,
          "answer": _answer,
          "state": "answer",
        };
        log('Got Local ICE Candidate', name: 'signaling');
        await ref.read(signalingSvcProvider).updateAudience(data);
      }
    };

    _peer?.onConnectionState = (RTCPeerConnectionState state) async {
      log('Connection state change: $state', name: 'signaling');
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
      log('Signaling state change: $state', name: 'signaling');
    };
  }

  void _heartbeatAudience(int audienceId) async {
    log('audienceId$audienceId : heartbeat audience | start (every $heartbeat seconds)', name: 'signaling');
    await Future.doWhile(() async {
      await Future.delayed(Duration(seconds: heartbeat));

      final data = {"id": audienceId, "heartbeat": DateTime.now().dbDateTime()};
      await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).updateAudience(data));

      if (ref.read(selectedPresenterProvider) == null) {
        log('audienceId$audienceId : heartbeat audience | stop', name: 'signaling');
        return false;
      }
      // log(':: heartbeat => $time');
      return true;
    });
  }

  Future joinMeeting(Presenter presenter) async {
    try {
      log('Join Meeting', name: 'signaling');

      ref.read(isConnectedProvider.notifier).state = true;
      await _fetchConfiguration();
      await _setRemoteMedia();

      final audience = await _addAudience(presenter);

      _setConnectionTimeout(audience);
      await _createPeerConnection(audience);

      _heartbeatAudience(audience.id);

      ref.read(selectedPresenterProvider.notifier).state = presenter;
    } catch (e) {
      log('Join Meeting | error', error: e, name: 'signaling');
      throw Exception(e.toString());
    }
  }

  Future leaveMeeting([int? audienceId]) async {
    try {
      log('Leave Meeting', name: 'signaling');

      ref.read(isConnectedProvider.notifier).state = false;
      ref.read(selectedPresenterProvider.notifier).state = null;
      ref.read(remoteRendererProvider.notifier).state.srcObject = null;
      ref.read(remoteRendererProvider.notifier).state.dispose();

      _timeoutTimer?.cancel();

      await _peer?.close();
      _peer = null;

      if (audienceId != null) {
        var data = {
          "id": audienceId,
          "state": "leave",
        };
        await AsyncValue.guard(() async => await ref.read(signalingSvcProvider).updateAudience(data));
      }

      log('Closing Subscription', name: 'signaling');
      _audienceSubs?.close();
    } catch (e) {
      log('Leave Meeting | error', error: e, name: 'signaling');
    }
  }
}

final signalingCtrlProvider = Provider(SignalingCtrl.new);
