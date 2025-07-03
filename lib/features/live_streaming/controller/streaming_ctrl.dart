import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/controllers/pusher_ctrl.dart';
import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/common/services/device_service.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/sse_service2.dart';
import 'package:amoora/common/services/talker_service.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/live_streaming/controller/audio_stream_signaling.dart';
import 'package:amoora/features/live_streaming/model/streamer.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/duration_utils.dart';
import 'package:amoora/utils/talker_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:uuid/uuid.dart';

final _kLogName = 'STREAMING-CTRL';

enum IceServers { google, rynest }

final streamerCountProvider = StateProvider<int>((ref) => 0);
final selfStreamerProvider = StateProvider<Streamer?>((ref) => null);
final selectedStreamerProvider = StateProvider<Streamer?>((ref) => null);
final labelStreamingProvider = StateProvider<String>((ref) => "");
final iceServersProvider = StateProvider<IceServers>((ref) => IceServers.rynest);
final eventTypeProvider = StateProvider<EventType?>((ref) => null);

// Use to calculate length of time streamer has been online
final liveTimeProvider = StreamProvider.autoDispose.family<String, DateTime>((ref, liveTime) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final running = liveTime.difference(DateTime.now());
    yield running.custom();
  }
});

// For getting online streamer count
final streamerCountListenerProvider = StreamProvider<int>((ref) async* {
  final url = Uri.parse(AppBase.sseUrl).replace(path: "/sse/online_streamer", queryParameters: {});
  final sse = SSEService2(url: "$url");

  await sse.connect();

  final stream = sse.getStream;
  final data = stream.transform(_streamerListTransformer);
  data.listen((event) {
    // if (showLog) log("streamerCountListener : ${event?.length ?? 0}", name: _kLogName);
    if (event == null || event.isEmpty) {
      ref.read(streamerCountProvider.notifier).state = 0;
    } else {
      ref.read(streamerCountProvider.notifier).state = event.length;
    }
  });
});

// SSE for fetching online streamer list
final fetchStreamersProvider = StreamProvider.autoDispose<List<Streamer>?>((ref) async* {
  final url = Uri.parse(AppBase.sseUrl).replace(path: "/sse/online_streamer", queryParameters: {});
  final sse = SSEService2(url: "$url");

  await sse.connect(reconnecting: false);

  final stream = sse.getStream;
  final data = stream.transform(_streamerListTransformer);
  yield* data;
});

// SSE for fetching viewers count
final fetchViewersCountProvider = StreamProvider.autoDispose.family<Streamer?, String>((ref, channel) async* {
  final url = Uri.parse(AppBase.sseUrl).replace(path: "/sse/get_viewers_count", queryParameters: {
    "channel": channel,
  });
  final sse = SSEService2(url: "$url");

  await sse.connect(reconnecting: false);

  final stream = sse.getStream;
  final data = stream.transform(_streamerTransformer);
  yield* data;
});

// SSE for fetching streamer status
final fetchStreamerStatusProvider = StreamProvider.autoDispose.family<Streamer?, int>((ref, id) async* {
  final url = Uri.parse(AppBase.sseUrl).replace(path: "/sse/get_streamer_status", queryParameters: {
    "id": "$id",
  });
  final sse = SSEService2(url: "$url");

  await sse.connect(reconnecting: false);

  final stream = sse.getStream;
  final data = stream.transform(_streamerTransformer);
  yield* data;
});

// Transform SseMessage to Streamer List
StreamTransformer<SseMessage, List<Streamer>?> _streamerListTransformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    try {
      // log("jsonList : $jsonList", name: _kLogName);
      if (data.data.isEmpty) {
        sink.add(null);
      } else if (data.data == "[]") {
        sink.add([]);
      } else {
        List<dynamic> jsonList = jsonDecode(data.data.isEmpty ? "[]" : data.data);
        final result = jsonList.map((e) => Streamer.fromJson(e)).toList();
        sink.add(result);
      }
    } catch (e, st) {
      log('Error', error: e, stackTrace: st, name: _kLogName);
    }
  },
);

// Transform SseMessage to Streamer
StreamTransformer<SseMessage, Streamer?> _streamerTransformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    try {
      if (data.data.isEmpty || data.data == "[]") {
        sink.add(null);
      } else {
        final json = jsonDecode(data.data);
        final result = Streamer.fromJson(json);
        sink.add(result);
      }
    } catch (e, st) {
      log('Error', error: e, stackTrace: st, name: _kLogName);
    }
  },
);

// Fetching streamer detail
final fetchStreamerByIdProvider = FutureProvider.family<Streamer?, int>((ref, id) async {
  final reqs = Reqs(path: '/api/v1/streamer/byid', data: {"id": id});
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.value == null) return null;

  try {
    final result = Streamer.fromJson(state.value);
    return result;
  } catch (e, st) {
    log('Error', error: e, stackTrace: st, name: _kLogName);
    return null;
  }
});

class StreamingCtrl {
  Ref ref;
  StreamingCtrl(this.ref) {
    _uuid = Uuid().v4();
  }

  late String _uuid;
  late AudioStreamSignaling _signaling;
  // Conpensation for waiting subscribe between streamer and listener
  final _heartbeatDuration = Duration(seconds: 10); // Max: 10 seconds
  var _localRenderer = RTCVideoRenderer();
  var _remoteRenderer = RTCVideoRenderer();
  Streamer? _streamer;

  initialize() async {
    log('Initialize Streaming !');

    ref.read(streamerCountListenerProvider);

    await checkMicrophonePermission();
  }

  Future<void> checkMicrophonePermission() async {
    log('checkMicrophonePermission', name: _kLogName);
    final result = await ref.read(permissionServiceProvider).checkMicrophonePermission();
    log('checkMicrophonePermission => isMicrophoneAllow : $result', name: _kLogName);
    ref.read(allowMicrophoneProvider.notifier).state = result;
  }

  Future<void> requestMicrophonePermission() async {
    log('requestMicrophonePermission', name: _kLogName);
    final result = await ref.read(permissionServiceProvider).requestMicrophonePermission();
    log('requestMicrophonePermission => isMicrophoneAllowProvider : $result', name: _kLogName);
    ref.read(allowMicrophoneProvider.notifier).state = result;
  }

  Future<Map<String, dynamic>> fetchConfiguration({String? server, bool showLog = true}) async {
    server = server ?? "rynest";
    final reqs = Reqs(path: '/api/v1/streamer/ice_server_config', data: {"server": server});
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    return state.value;
  }

  Future<void> openUserMedia() async {
    if (!ref.read(allowMicrophoneProvider)) return;

    log("openUserMedia", name: _kLogName);

    // Init streaming signal
    _signaling = AudioStreamSignaling(
      uuid: _uuid,
      pusher: ref.read(pusherCtrlProvider).getPusher,
      talker: ref.read(talkerProvider),
    );
    _signaling.onEventStateChange = (state) async {
      log("eventState : ${state.name}", name: _kLogName);
      ref.read(eventTypeProvider.notifier).state = state;

      switch (state) {
        case EventType.accept:
          await _joinAcceptedHandle();
        case EventType.failed:
        case EventType.stop:
        case EventType.cancel:
        case EventType.exit:
          await closedUserMedia();
        case EventType.start:
        case EventType.join:
        case EventType.offer:
        case EventType.answer:
        case EventType.iceCandidate:
      }
    };

    await _localRenderer.initialize();
    await _remoteRenderer.initialize();

    await _signaling.openUserMedia(_localRenderer, _remoteRenderer);
  }

  Future<void> closedUserMedia() async {
    try {
      if (_localRenderer.srcObject != null) {
        await _localRenderer.dispose();
        _localRenderer = RTCVideoRenderer();
      }
      if (_remoteRenderer.srcObject != null) {
        await _remoteRenderer.dispose();
        _remoteRenderer = RTCVideoRenderer();
      }
    } catch (e, s) {
      log("Error [closedUserMedia]", error: e, stackTrace: s, name: _kLogName);
    } finally {
      _localRenderer = RTCVideoRenderer();
      _remoteRenderer = RTCVideoRenderer();
    }
  }

  // Start streaming for host
  Future<bool> startStreaming({required String title, bool showLog = true}) async {
    try {
      // Open user media
      await openUserMedia();

      // Set Ice Servers Configuration
      _signaling.setConfig(await fetchConfiguration(server: ref.read(iceServersProvider).name));

      // Start Sreaming Signal
      await _signaling.startStreaming();

      final reqs = Reqs(path: '/api/v1/streamer/start', data: {
        "title": title,
        "device": "${ref.read(deviceIdProvider)} - ${ref.read(deviceNameProvider)}",
        "location": ref.read(locationProvider),
        "ip_address": ref.read(wifiIPv4Provider),
        "signaling_channel": _signaling.getSignalingChannel,
      });
      final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      final result = Streamer.fromJson(state.value);

      // Set selfStreamerProvider
      ref.read(selfStreamerProvider.notifier).state = result;

      // Running heartbeat
      _heartbeat();

      return true;
    } catch (e, st) {
      // Sreaming Channel : unsubscribe
      _signaling.stopStreaming();

      // Closed user media
      await closedUserMedia();

      ref.read(talkerProvider).errx("Error: start", exception: e, stackTrace: st, name: _kLogName);
      return false;
    }
  }

  // Stop streaming for host
  Future<void> stopStreaming({required int streamerId, bool showLog = true}) async {
    try {
      final result = await AlertService.confirm(body: 'Apakah anda ingin mengakhiri live streaming?');
      if (result != true) return;

      // Stop Sreaming Signal
      await _signaling.stopStreaming();

      final reqs = Reqs(path: '/api/v1/streamer/stop', data: {"id": streamerId});
      final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      if (state.hasError) return;

      // Set selfStreamerProvider
      ref.read(selfStreamerProvider.notifier).state = null;
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: stop", exception: e, stackTrace: s, name: _kLogName);
    }
  }

  // Join selected streamer
  Future<void> joinListening({required Streamer streamer, bool showLog = true}) async {
    try {
      // Open user media
      await openUserMedia();

      // Set Ice Servers Configuration
      _signaling.setConfig(await fetchConfiguration(server: ref.read(iceServersProvider).name));

      _streamer = streamer;

      // Join Sreaming Signal
      await _signaling.joinListening(_streamer!.signalingChannel);
    } catch (e, st) {
      // Closed user media
      await closedUserMedia();

      // Set selectedStreamerProvider
      ref.read(selectedStreamerProvider.notifier).state = null;

      ref.read(talkerProvider).errx("Error: join", exception: e, stackTrace: st, name: _kLogName);
    }
  }

  Future<void> _joinAcceptedHandle() async {
    try {
      assert(_streamer != null);

      // Set selectedStreamerProvider
      ref.read(selectedStreamerProvider.notifier).state = _streamer;

      final reqs = Reqs(path: '/api/v1/streamer/join', data: {"id": _streamer?.id});
      final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

      if (state.hasError) return;
    } catch (e, st) {
      // Set selectedStreamerProvider
      ref.read(selectedStreamerProvider.notifier).state = null;

      ref.read(talkerProvider).errx("Error: _joinAcceptedHandle", exception: e, stackTrace: st, name: _kLogName);
    }
  }

  // Exit selected streamer
  Future<void> exitListening({bool showLog = false}) async {
    try {
      final result = await AlertService.confirm(body: 'Apakah anda ingin selesai mendengarkan live streaming ini?');
      if (result != true) return;

      // Exit Sreaming Signal
      await _signaling.exitListening();

      // Set selectedStreamerProvider
      ref.read(selectedStreamerProvider.notifier).state = null;
    } catch (e, st) {
      ref.read(talkerProvider).errx("Error: exit", exception: e, stackTrace: st, name: _kLogName);
    }
  }

  Future<void> cancelListening() async {
    try {
      await _signaling.cancelListening();

      // Set selectedStreamerProvider
      ref.read(selectedStreamerProvider.notifier).state = null;
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: cancel", exception: e, stackTrace: s, name: _kLogName);
    }
  }

  Future<void> _heartbeat({bool showLog = false}) async {
    await Future.doWhile(() async {
      await Future.delayed(_heartbeatDuration);

      if (ref.read(selfStreamerProvider) == null) {
        if (showLog) log("heartbeat (stop) : selfStreamerProvider = null", name: _kLogName);
        return false;
      }

      if (showLog) log("heartbeat (update) : ${DateTime.now().dbDateTime()}", name: _kLogName);
      final reqs = Reqs(path: '/api/v1/streamer/heartbeat', data: {
        "id": "${ref.read(selfStreamerProvider)?.id}",
      });
      final state = await AsyncValue.guard(
          () async => await ref.read(apiServiceProvider).call(reqs: reqs, showBusy: false, showLog: showLog));

      if (state.hasError) {
        if (showLog) log("heartbeat (stop) : state.hasError", name: _kLogName);
        return false;
      }

      final affected = state.value?['affected'] ?? 0;
      if (affected < 1) {
        if (showLog) log("heartbeat (stop) : affected = $affected", name: _kLogName);
        return false;
      }

      // await Future.delayed(_heartbeatDuration);

      return true;
    });
  }

  String calcLiveTimeLength(DateTime started, DateTime finished) {
    final result = started.difference(finished);
    return result.custom();
  }
}

final streamingCtrlProvider = Provider(StreamingCtrl.new);
