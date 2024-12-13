import 'dart:async';
import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_location/controller/coordinate_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveLocationCtrl {
  Ref ref;
  LiveLocationCtrl(this.ref);

  void initialize() async {
    log('Initialize Live Location !');
    await checkIsBatteryOptimizationDisabled();
    await checkIsAutoStartEnabled();

    // PUSH STREAM for jamaah
    // send gps position for muthowwif monitoring
    ref.read(coordinateStreamProvider).pushCoordinate();

    // FETCH STREAM for muthowwif
    // monitor the position of the jamaah
    // RoleId = 2 (muthowwif)
    ref.read(coordinateStreamProvider).fetchMyCoordinate();
    await ref.read(coordinateStreamProvider).monitoringMember();

    ref.listen(authUserProvider, (previous, next) async {
      ref.read(coordinateStreamProvider).fetchMyCoordinate();
      ref.read(coordinateStreamProvider).pushCoordinate();
      await ref.read(coordinateStreamProvider).monitoringMember();
    });

    ref.listen(isGpsEnableProvider, (previous, next) {
      if (next) {
        ref.read(coordinateStreamProvider).fetchMyCoordinate();
        ref.read(coordinateStreamProvider).pushCoordinate();
      }
    });

    ref.listen(allowGpsProvider, (previous, next) {
      if (next) {
        ref.read(coordinateStreamProvider).fetchMyCoordinate();
        ref.read(coordinateStreamProvider).pushCoordinate();
      }
    });
  }

  Future checkIsBatteryOptimizationDisabled() async {
    final result = await ref.read(permissionServiceProvider).checkIsBatteryOptimizationDisabled();
    log('checkIsBatteryOptimizationDisabled => $result', name: 'LIVELOCATION-CTRL');
    ref.read(isBatteryOptzDisabledProvider.notifier).state = result;
  }

  Future checkIsAutoStartEnabled() async {
    final result = await ref.read(permissionServiceProvider).checkIsAutoStartEnabled();
    log('checkIsAutoStartEnabled => $result', name: 'LIVELOCATION-CTRL');
    ref.read(isAutoStartEnabledProvider.notifier).state = result;
  }

  Future showBatterySettings() async => await ref.read(permissionServiceProvider).showBatterySetting();

  Future showAutoStart() async => await ref.read(permissionServiceProvider).showAutoStart();
}

final liveLocationCtrlProvider = Provider(LiveLocationCtrl.new);
