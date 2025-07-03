import 'dart:developer';

import 'package:amoora/common/services/snackbar_service.dart';
import 'package:amoora/utils/talker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:pusher_webman/pusher_webman.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _kLogName = 'AUDIO-STREAM-SIGNALING';

// enum SignalingState {
//   connectionOpen,
//   connectionClosed,
//   connectionError,
// }

// enum CallState {
//   callStateNew,
//   callStateRinging,
//   callStateInvite,
//   callStateConnected,
//   callStateBye,
// }

enum EventType {
  start,
  stop,
  join,
  offer,
  answer,
  accept,
  iceCandidate,
  exit,
  failed,
  cancel,
}

class AudioStreamSignaling {
  final Map<String, dynamic>? config;
  final String uuid;
  final Pusher pusher;
  final Talker talker;

  AudioStreamSignaling({
    this.config,
    required this.uuid,
    required this.pusher,
    required this.talker,
  }) {
    initialize();
  }

  final _prefixSignalingChannel = 'private-signaling';
  late Pusher _pusher;
  String? _selfSignalingChannel;
  String? _streamerChannel;
  String? _listenerChannel;

  late Map<String, dynamic> _configuration;

  MediaStream? _localStream;
  MediaStream? _remoteStream;

  Function(MediaStream stream)? onAddRemoteStream;
  Function(EventType state)? onEventStateChange;

  RTCPeerConnection? _peer;
  Map<String, RTCPeerConnection?> _peers = {};
  late Map<String, dynamic> _offer;
  late Map<String, dynamic> _answer;

  initialize() async {
    log('Initialize Audio Stream Signaling !');
    try {
      _pusher = pusher;
      _selfSignalingChannel = "$_prefixSignalingChannel-$uuid";
    } catch (e) {
      talker.errx("Error: initialize", exception: e, name: _kLogName);
    }
  }

  String? get getSignalingChannel => _selfSignalingChannel;

  void setConfig(Map<String, dynamic> config) => _configuration = config;

  void muteMic() {
    if (_localStream != null) {
      bool enabled = _localStream!.getAudioTracks()[0].enabled;
      _localStream!.getAudioTracks()[0].enabled = !enabled;
    }
  }

  Future openUserMedia(RTCVideoRenderer local, RTCVideoRenderer remote) async {
    // LOCAL STREAM
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': false,
    };
    var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);

    local.srcObject = stream;
    _localStream = stream;

    remote.srcObject = await createLocalMediaStream('key');
  }

  Future _closeUserMedia() async {
    await _localStream?.dispose();
    await _remoteStream?.dispose();
  }

  Future startStreaming({bool showLog = true}) async {
    try {
      _peers = {};
      _offer = {};

      // Subscribe/Register to Self Signaling Channel
      _selfSignalingChannel = "$_prefixSignalingChannel-$uuid";
      await _signalingChannelHandle(channelName: _selfSignalingChannel!);

      onEventStateChange?.call(EventType.start);
    } catch (e) {
      rethrow;
    }
  }

  Future stopStreaming({bool showLog = true}) async {
    try {
      for (var peer in _peers.entries) {
        await _closePeerConnection(peer.value);
      }

      await _closeUserMedia();

      if (_selfSignalingChannel != null) {
        if (showLog) talker.logx("Unsubscribe Channel : $_selfSignalingChannel", name: _kLogName);
        _pusher.unsubscribe(_selfSignalingChannel!);
      }

      onEventStateChange?.call(EventType.stop);
    } catch (e) {
      rethrow;
    }
  }

  Future joinListening(String signalingChannel, {bool showLog = true}) async {
    try {
      onEventStateChange?.call(EventType.join);

      // Subscribe/Register to Self Signaling Channel
      _selfSignalingChannel = "$_prefixSignalingChannel-$uuid";
      await _signalingChannelHandle(channelName: _selfSignalingChannel!);

      // Before communicate to streamer channel, must be subscribe first
      // Subscribe/Register to Streamer Signaling Channel
      _streamerChannel = signalingChannel;
      _pusher.subscribe(_streamerChannel!);

      // Waiting subcribed to be finished before pushSend func call,
      // adjust this for low network latency
      await Future.delayed(Duration(seconds: 3));

      // Step #1 : Send join request to the streamer through pusher
      final data = {"listenerChannel": _selfSignalingChannel};
      pushSend(channel: _streamerChannel!, eventType: EventType.join, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future cancelListening({bool showLog = true}) async {
    try {
      if (_peer?.connectionState != null) await _closePeerConnection(_peer);

      await _closeUserMedia();

      if (_streamerChannel != null) {
        if (showLog) talker.logx("Unsubscribe Channel : $_streamerChannel", name: _kLogName);
        _pusher.unsubscribe(_streamerChannel!);
        _streamerChannel = null;
      }

      if (_selfSignalingChannel != null) {
        if (showLog) talker.logx("Unsubscribe Channel : $_selfSignalingChannel", name: _kLogName);
        _pusher.unsubscribe(_selfSignalingChannel!);
      }

      onEventStateChange?.call(EventType.failed);

      // Send cancel connection to the streamer through pusher
      final data = {"listenerChannel": _selfSignalingChannel};
      pushSend(channel: _streamerChannel!, eventType: EventType.cancel, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future exitListening({bool showLog = true}) async {
    try {
      if (_peer?.connectionState != null) await _closePeerConnection(_peer);

      await _closeUserMedia();

      if (_streamerChannel != null) {
        if (showLog) talker.logx("Unsubscribe Channel : $_streamerChannel", name: _kLogName);
        _pusher.unsubscribe(_streamerChannel!);
        _streamerChannel = null;
      }

      if (_selfSignalingChannel != null) {
        if (showLog) talker.logx("Unsubscribe Channel : $_selfSignalingChannel", name: _kLogName);
        _pusher.unsubscribe(_selfSignalingChannel!);
        _selfSignalingChannel = null;
      }

      onEventStateChange?.call(EventType.exit);

      // Send exit connection to the streamer through pusher
      final data = {"listenerChannel": _selfSignalingChannel};
      pushSend(channel: _streamerChannel!, eventType: EventType.exit, data: data);
    } catch (e) {
      rethrow;
    }
  }

  // Create signaling channel for communicate between host and client when requesting/sending an join/offer/answer/ice-candidate
  Future<void> _signalingChannelHandle({required String channelName, bool showLog = true}) async {
    try {
      if (showLog) talker.logx("Subscribe to Channel : $channelName", name: _kLogName);
      final channel = _pusher.subscribe(channelName);

      // [Streamer] received join from listener
      channel.bind('client-join', _joinHandler);

      // [Listener] received offer from streamer
      channel.bind('client-offer', _offerHandler);

      // [Streamer] received answer from listener
      channel.bind('client-answer', _answerHandler);

      // [Listener] received status connection from streamer
      channel.bind('client-accept', _acceptHandler);

      // [Streamer/Listener] received ice candidate
      channel.bind('client-ice_candidate', _iceCandidateHandler);

      // [Listener] received connection failed from streamer
      channel.bind('client-failed', _failedHandler);

      // [Listener] received connection finish from streamer
      channel.bind('client-stop', _stopHandler);

      // [Streamer] received connection cancel from listener
      channel.bind('client-cancel', _cancelHandler);

      // [Streamer] received connection exit from listener
      channel.bind('client-exit', _exitHandler);
    } catch (e) {
      talker.errx("Error: _signalingChannelHandle", exception: e, name: _kLogName);
      rethrow;
    }
  }

  // Execute when Streamer received join from listener
  void _joinHandler(dynamic event) async {
    try {
      log("message [join] : $event", name: _kLogName);
      _listenerChannel = event['listenerChannel'];

      // Before communicate to listener channel, must be subscribe first
      // Subscribe/Register to Listener Signaling Channel
      _pusher.subscribe(_listenerChannel!);

      // Waiting subcribed to be finished before pushSend func call,
      // adjust this for low network latency
      await Future.delayed(Duration(seconds: 3));

      onEventStateChange?.call(EventType.join);

      // Create peer connection
      _peers[_listenerChannel!] = await _createPeerConnection(isStreamer: true);

      // Add track from local stream media, only for streamer (listener don't send media)
      _localStream?.getTracks().forEach((track) async {
        await _peers[_listenerChannel]?.addTrack(track, _localStream!);
      });

      // Register ice candidate listener
      _peers[_listenerChannel]?.onIceCandidate = (RTCIceCandidate? candidate) async {
        // if (candidate == null) return;

        log("Got candidate : \n${candidate?.toMap()}", name: _kLogName);

        // Send Ice Candidate to listener
        final data = {
          "from": "streamer",
          "ice": candidate?.toMap(),
        };
        pushSend(channel: _listenerChannel!, eventType: EventType.iceCandidate, data: data);
      };

      await _peers[_listenerChannel]?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendOnly),
      );

      await _peers[_listenerChannel]?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.SendOnly),
      );

      // Create Offer
      final offer = await _peers[_listenerChannel]?.createOffer();
      _offer = offer?.toMap();
      log("offer : \n$_offer", name: _kLogName);

      // Set Local Description
      await _peers[_listenerChannel]?.setLocalDescription(offer!);

      // Add track
      await _onTrackListener(_peers[_listenerChannel]);
      // _peers[_listenerChannel]?.onTrack = (event) {
      //   log('Got remote track: ${event.streams[0]}');
      //   // log("Add track from remote stream media :::", name: _kLogName);
      //   // log("event.track.kind : ${event.track.kind}", name: _kLogName);
      //   // log("event.streams.length : ${event.streams.length}", name: _kLogName);
      //   event.streams[0].getTracks().forEach((track) {
      //     log('Add a track to remote stream : $track');
      //     _remoteStream?.addTrack(track);
      //   });
      // };

      // Send Offer to Listener (Requester)
      final data = {"offer": _offer};
      pushSend(channel: _listenerChannel!, eventType: EventType.offer, data: data);
    } catch (e) {
      final data = {"error": "$e"};
      pushSend(channel: _listenerChannel!, eventType: EventType.failed, data: data);
    }
  }

  // Execute when Listener received offer from streamer
  void _offerHandler(dynamic event) async {
    try {
      log("message [offer] : $event", name: _kLogName);
      // final streamingChannel = event['channel'];
      final offer = event['offer'];
      final error = event['error'];
      if (error != null) throw Exception(error);

      onEventStateChange?.call(EventType.offer);

      // Create peer connection, and automatically send an offer
      _peer = await _createPeerConnection(isStreamer: false);

      // Add track from local stream media, only for streamer (listener don't send media)
      // _localStream?.getTracks().forEach((track) async {
      //   await _peer?.addTrack(track, _localStream!);
      // });

      // Register ice candidate listener
      _peer?.onIceCandidate = (RTCIceCandidate? candidate) async {
        if (candidate == null) return;

        log("onIceCandidate : \n${candidate.toMap()}", name: _kLogName);

        // Send Ice Candidate to streamer
        final data = {
          "listenerChannel": _selfSignalingChannel,
          "from": "listener",
          "ice": candidate.toMap(),
        };
        pushSend(channel: _streamerChannel!, eventType: EventType.iceCandidate, data: data);
      };

      // Add track
      await _onTrackListener(_peer);
      // _peers[_listenerChannel]?.onTrack = (event) {
      //   log('Got remote track: ${event.streams[0]}');
      //   // log("Add track from remote stream media :::", name: _kLogName);
      //   // log("event.track.kind : ${event.track.kind}", name: _kLogName);
      //   // log("event.streams.length : ${event.streams.length}", name: _kLogName);
      //   event.streams[0].getTracks().forEach((track) {
      //     log('Add a track to remote stream : $track');
      //     _remoteStream?.addTrack(track);
      //   });
      // };

      await _peer?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly),
      );

      await _peer?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly),
      );

      // Receive Offer from Streamer & set description
      final offerSession = RTCSessionDescription(offer['sdp'], offer['type']);
      await _peer?.setRemoteDescription(offerSession);

      // Create an Answer & set description
      final answer = await _peer?.createAnswer();
      _answer = answer?.toMap();
      log("answer : \n$_answer", name: _kLogName);

      await _peer?.setLocalDescription(answer!);

      // Send Answer to streamer
      final data = {
        "listenerChannel": _selfSignalingChannel,
        "answer": _answer,
      };
      pushSend(channel: _streamerChannel!, eventType: EventType.answer, data: data);
    } catch (e) {
      onEventStateChange?.call(EventType.failed);
      SnackBarService(message: Text("$e")).shown();
    }
  }

  // Execute when Streamer received answer from listener
  void _answerHandler(dynamic event) async {
    try {
      _listenerChannel = event['listenerChannel'];
      final answer = event['answer'];
      log("message [answer] : \n$answer", name: _kLogName);

      onEventStateChange?.call(EventType.answer);

      // Receive Answer from listener & set description
      if (_peers[_listenerChannel]?.getRemoteDescription() != null && answer != null) {
        final answerSession = RTCSessionDescription(answer['sdp'], answer['type']);
        await _peers[_listenerChannel]?.setRemoteDescription(answerSession);
      }

      // final data = {"channel": _selfSignalingChannel, "message": "Ok"};
      // pushSend(channel: _listenerChannel!, eventType: EventType.accept, data: data);
    } catch (e) {
      final data = {"channel": _selfSignalingChannel, "error": e};
      pushSend(channel: _listenerChannel!, eventType: EventType.failed, data: data);
    }
  }

  // Execute when Listener received status connection from streamer
  void _acceptHandler(dynamic event) async {
    try {
      log("message [accept] : $event", name: _kLogName);
      final error = event['error'];
      if (error != null) throw Exception(error);

      onEventStateChange?.call(EventType.accept);
    } catch (e) {
      SnackBarService(message: Text("$e")).shown();
    }
  }

  // Execute when Streamer/Listener received ice candidate
  void _iceCandidateHandler(dynamic event) async {
    try {
      // talker.logx("message [ice candidate] : $event", name: _kLogName);
      _listenerChannel = event['listenerChannel'];
      final from = event['from'];
      final ice = event['ice'];
      log("message [remote ice candidate] : \n$ice", name: _kLogName);

      onEventStateChange?.call(EventType.iceCandidate);

      // Add ice candidate to peer
      final candidate = RTCIceCandidate(ice['candidate'], ice['sdpMid'], ice['sdpMLineIndex']);
      if (from == "streamer") {
        _peer?.addCandidate(candidate);
      }

      if (from == "listener") {
        _peers[_listenerChannel]?.addCandidate(candidate);
      }
    } catch (e) {
      talker.errx("Error: _iceCandidateHandler", exception: e, name: _kLogName);
    }
  }

  // Execute when Listener received failed connection from streamer
  void _failedHandler(dynamic event) async {
    try {
      log("message [failed] : $event", name: _kLogName);
      final error = event['error'];

      onEventStateChange?.call(EventType.failed);

      if (_streamerChannel != null) {
        _pusher.unsubscribe(_streamerChannel!);
      }

      await _closePeerConnection(_peer);
      SnackBarService(message: Text("$error")).shown();
    } catch (e) {
      talker.errx("Error: _failedHandler", exception: e, name: _kLogName);
    }
  }

  // Execute when Listener received stop connection from streamer
  void _stopHandler(dynamic event) async {
    try {
      log("message [stop] : $event", name: _kLogName);
      var message = event['message'];

      onEventStateChange?.call(EventType.stop);

      if (_streamerChannel != null) {
        _pusher.unsubscribe(_streamerChannel!);
      }

      await _closePeerConnection(_peer);

      message ??= "Siaran telah selesai !";
      SnackBarService(message: Text(message)).shown();
    } catch (e) {
      talker.errx("Error: _stopHandler", exception: e, name: _kLogName);
    }
  }

  // Execute when Streamer received cancelation connection from listener
  void _cancelHandler(dynamic event) async {
    try {
      log("message [cancel] : $event", name: _kLogName);
      _listenerChannel = event['listenerChannel'];

      if (_listenerChannel != null) {
        _pusher.unsubscribe(_listenerChannel!);
      }

      onEventStateChange?.call(EventType.cancel);

      await _closePeerConnection(_peers[_listenerChannel]);
    } catch (e) {
      talker.errx("Error: _cancelHandler", exception: e, name: _kLogName);
    }
  }

  // Execute when Streamer received exit connection from listener
  void _exitHandler(dynamic event) async {
    try {
      log("message [exit] : $event", name: _kLogName);
      _listenerChannel = event['listenerChannel'];

      if (_listenerChannel != null) {
        _pusher.unsubscribe(_listenerChannel!);
      }

      onEventStateChange?.call(EventType.exit);

      await _closePeerConnection(_peers[_listenerChannel]);
    } catch (e) {
      talker.errx("Error: _exitHandler", exception: e, name: _kLogName);
    }
  }

  void _fetchConfiguration() {
    Map<String, dynamic> defaultConfig = {
      "iceServers": [
        {
          "url": "stun:202.73.24.36:3478",
          "urls": "stun:202.73.24.36:3478",
        },
        {
          "url": "turn:202.73.24.36:3478",
          "urls": "turn:202.73.24.36:3478",
          "username": "username1",
          "credential": "password1",
        },
        {
          "url": "turn:202.73.24.36:3478?transport=udp",
          "urls": "turn:202.73.24.36:3478?transport=udp",
          "username": "username1",
          "credential": "password1",
        },
      ],
      "iceTransportPolicy": "all",
      // "bundlePolicy": "balanced",
      // "rtcpMuxPolicy": "require",
      // "iceCandidatePoolSize": 0,
      "sdpSemantics": "unified-plan",
    };

    _configuration = config ?? defaultConfig;
    log("_configuration : \n$_configuration", name: _kLogName);
  }

  Future<RTCPeerConnection> _createPeerConnection({required bool isStreamer, bool showLog = true}) async {
    try {
      // Fetch configuration
      _fetchConfiguration();

      // final constraints = <String, dynamic>{
      //   'mandatory': {},
      //   'optional': [
      //     {'DtlsSrtpKeyAgreement': false},
      //   ],
      // };

      RTCPeerConnection peer = await createPeerConnection(_configuration);

      peer.onIceConnectionState = (state) {
        if (showLog) log('onIceConnectionState : $state', name: _kLogName);
        // switch (state) {
        //   case RTCIceConnectionState.RTCIceConnectionStateFailed:
        //   case RTCIceConnectionState.RTCIceConnectionStateDisconnected:
        //     if (showLog) log('onIceConnectionState : restartIce', name: _kLogName);
        //     peer.restartIce();
        //     break;
        //   case RTCIceConnectionState.RTCIceConnectionStateNew:
        //   case RTCIceConnectionState.RTCIceConnectionStateChecking:
        //   case RTCIceConnectionState.RTCIceConnectionStateCompleted:
        //   case RTCIceConnectionState.RTCIceConnectionStateConnected:
        //   case RTCIceConnectionState.RTCIceConnectionStateCount:
        //   case RTCIceConnectionState.RTCIceConnectionStateClosed:
        // }
      };
      peer.onIceGatheringState = (state) {
        if (showLog) log('onIceGatheringState : $state', name: _kLogName);
      };
      peer.onConnectionState = (state) async {
        if (showLog) log('onConnectionState : $state', name: _kLogName);

        if (isStreamer == true) {
          if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
            if (_listenerChannel != null) {
              final data = {"channel": _selfSignalingChannel, "message": "Ok"};
              pushSend(channel: _listenerChannel!, eventType: EventType.accept, data: data);
            }
          }
        }

        if (state == RTCPeerConnectionState.RTCPeerConnectionStateDisconnected) {
          await _closePeerConnection(peer);
          if (!isStreamer) {
            SnackBarService(message: Text("Koneksi terputus atau siaran dihentikan !")).shown(bottom: 50);

            await _closeUserMedia();

            if (_streamerChannel != null) {
              if (showLog) talker.logx("Unsubscribe Channel : $_streamerChannel", name: _kLogName);
              _pusher.unsubscribe(_streamerChannel!);
              _streamerChannel = null;
            }

            if (_selfSignalingChannel != null) {
              if (showLog) talker.logx("Unsubscribe Channel : $_selfSignalingChannel", name: _kLogName);
              _pusher.unsubscribe(_selfSignalingChannel!);
              _selfSignalingChannel = null;
            }

            onEventStateChange?.call(EventType.stop);
          }
        }

        // if (isStreamer) {
        //   if (state == RTCPeerConnectionState.RTCPeerConnectionStateFailed) {
        //     await _closePeerConnection(peer);

        //     if (_listenerChannel != null) {
        //       final data = {"channel": _selfSignalingChannel, "error": "Koneksi gagal, silahkan coba kembali !"};
        //       pushSend(channel: _listenerChannel!, eventType: EventType.failed, data: data);

        //       _pusher.unsubscribe(_listenerChannel!);
        //     }
        //   }
        // }
      };
      peer.onSignalingState = (state) async {
        if (showLog) log('onSignalingState : $state', name: _kLogName);
      };

      // Add stream from remote stream media,
      peer.onAddStream = (stream) {
        onAddRemoteStream?.call(stream);
        _remoteStream = stream;
      };

      return peer;
    } catch (e) {
      rethrow;
    }
  }

  Future _onTrackListener(RTCPeerConnection? peer) async {
    peer?.onTrack = (event) async {
      log('Got remote track: ${event.streams[0]}');
      // log("Add track from remote stream media :::", name: _kLogName);
      // log("event.track.kind : ${event.track.kind}", name: _kLogName);
      // log("event.streams.length : ${event.streams.length}", name: _kLogName);
      event.streams[0].getTracks().forEach((track) async {
        log('Add a track to remote stream : $track');
        await _remoteStream?.addTrack(track);
      });
    };
  }

  Future<void> _closePeerConnection(RTCPeerConnection? peer) async {
    try {
      await peer?.close();
      await _peer?.dispose();
      _peer == null;
    } catch (e) {
      rethrow;
    }
  }

  void pushSend({
    required String channel,
    required EventType eventType,
    required Map<String, dynamic> data,
    bool showLog = true,
  }) {
    final event = switch (eventType) {
      EventType.start => throw UnimplementedError(),
      EventType.join => 'join',
      EventType.offer => 'offer',
      EventType.answer => 'answer',
      EventType.accept => 'accept',
      EventType.iceCandidate => 'ice_candidate',
      EventType.failed => 'failed',
      EventType.stop => 'stop',
      EventType.cancel => 'cancel',
      EventType.exit => 'exit',
    };

    _pusher.trigger(channelName: channel, eventName: event, data: data);
  }
}
