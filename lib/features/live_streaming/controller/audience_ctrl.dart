import 'dart:async';
import 'dart:developer';

import 'package:amoora/common/services/snackbar_service.dart';
import 'package:amoora/features/live_streaming/controller/broadcast_ctrl.dart';
import 'package:amoora/features/live_streaming/model/presenter.dart';
import 'package:amoora/features/live_streaming/controller/signaling_ctrl.dart';
import 'package:amoora/utils/duration_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final liveTimeHostProvider = StreamProvider.autoDispose.family<String, DateTime>((ref, liveTime) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final running = liveTime.difference(DateTime.now());
    yield running.custom();
  }
});

class AudienceCtrl {
  Ref ref;
  AudienceCtrl(this.ref);

  Future refresh() async {
    await ref.read(broadcastCtrlProvider).checkMicrophonePermission();
  }

  Future joinMeeting(Presenter presenter) async {
    try {
      log('joinMeeting', name: 'AUDIENCE-CTRL');

      if (ref.read(isConnectedProvider)) return;

      if (ref.read(selectedPresenterProvider)?.id == presenter.id) {
        return SnackBarService.show(message: 'Anda sedang mendengarkan ini !');
      }

      ref.read(signalingCtrlProvider).connectionTimeout = ref.read(timeoutProvider);
      ref.read(signalingCtrlProvider).onTimeout = () {
        SnackBarService.show(message: 'Connection timeout !');
      };
      ref.read(signalingCtrlProvider).onDisconnected = () {
        SnackBarService.show(message: 'This session has been ended !');
      };
      ref.read(signalingCtrlProvider).onFailed = () {
        SnackBarService.show(message: 'The connection could not be establised !');
      };

      await ref.read(signalingCtrlProvider).joinMeeting(presenter);
    } catch (e) {
      log('joinMeeting | error', error: e, name: 'AUDIENCE-CTRL');
    }
  }

  Future leaveMeeting() async {
    try {
      log('leaveMeeting', name: 'AUDIENCE-CTRL');

      if (!ref.read(isConnectedProvider)) return;

      await ref.read(signalingCtrlProvider).leaveMeeting(ref.read(audienceProvider)?.id);
    } catch (e) {
      log('leaveMeeting | error', error: e, name: 'AUDIENCE-CTRL');
    }
  }
}

final audienceCtrlProvider = Provider(AudienceCtrl.new);
