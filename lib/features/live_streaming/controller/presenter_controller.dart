import 'dart:developer';

import 'package:amoora/features/live_streaming/controller/broadcast_controller.dart';
import 'package:amoora/features/live_streaming/controller/signaling_controller.dart';
import 'package:amoora/utils/duration_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final labelStreamingProvider = StateProvider<String>((ref) => '');
final liveTimeProvider = StreamProvider.autoDispose.family<String, DateTime>((ref, liveTime) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final running = liveTime.difference(DateTime.now());
    yield running.custom();
  }
});

class PresenterCtrl {
  Ref ref;
  PresenterCtrl(this.ref);

  Future refresh() async {
    await ref.read(broadcastCtrlProvider).checkMicrophonePermission();
  }

  Future startMeeting() async {
    try {
      log('startMeeting', name: 'signaling');

      if (ref.read(isOnlineProvider)) return;

      final data = {
        "label": ref.read(labelStreamingProvider),
      };
      await ref.read(signalingCtrlProvider).startMeeting(data);
    } catch (e) {
      log('startMeeting | error', error: e, name: 'signaling');
    }
  }

  Future closeMeeting() async {
    try {
      log('closeMeeting', name: 'signaling');

      if (!ref.read(isOnlineProvider)) return;

      await ref.read(signalingCtrlProvider).closeMeeting(ref.read(presenterProvider)?.id);
    } catch (e) {
      log('closeMeeting | error', error: e, name: 'signaling');
    }
  }
}

final presenterCtrlProvider = Provider(PresenterCtrl.new);
