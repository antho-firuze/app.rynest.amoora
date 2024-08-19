import 'dart:developer';

import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isBusyBroadcastProvider = StateProvider<bool>((ref) => false);

class BroadcastCtrl {
  Ref ref;
  BroadcastCtrl(this.ref);

  Future<void> initialize() async {
    log('Initialize Broadcast !');
    await checkMicrophonePermission();
  }

  Future<void> checkMicrophonePermission() async {
    final result = await ref.read(permissionServiceProvider).checkMicrophonePermission();
    log(':: isMicrophoneAllow => $result');
    ref.read(allowMicrophoneProvider.notifier).state = result;
  }

  Future<void> requestMicrophonePermission() async {
    final result = await ref.read(permissionServiceProvider).requestMicrophonePermission();
    log(':: requestMicrophonePermission => isMicrophoneAllowProvider: $result');
    ref.read(allowMicrophoneProvider.notifier).state = result;
  }
}

final broadcastCtrlProvider = Provider(BroadcastCtrl.new);
