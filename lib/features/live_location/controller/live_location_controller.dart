import 'dart:async';
import 'dart:developer';

import 'package:amoora/common/controllers/location_controller.dart';
import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/location_service.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/features/live_location/controller/live_maps_controller.dart';
import 'package:amoora/features/live_location/service/live_location_service.dart';
import 'package:amoora/features/user/controller/user_setting_controller.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final liveLocationStreamProvider = StreamProvider.autoDispose<void>((ref) async* {
  log(':: liveLocationStream => start', name: 'live-location');
  if (!ref.read(isGpsEnableProvider) || !ref.read(allowGpsProvider)) {
    return;
  }

  if (!ref.read(allowMonitorLocationProvider)) {
    return;
  }

  if (ref.read(allowMonitorInArabOnlyProvider)) {
    var placemark = ref.read(placemarkProvider);
    log(':: liveLocationStream => placemark: ${placemark?.isoCountryCode}', name: 'live-location');
    if (!['AE', 'SA'].contains(placemark?.isoCountryCode)) {
      log(':: liveLocationStream => Only in Arab Saudi !', name: 'live-location');
      return;
    }
  }

  LatLong? lastPosition;
  while (ref.read(authUserProvider) != null) {
    Position pos = await ref.read(locationServiceProvider).getCurrentPosition();

    ref.read(liveMapsCtrlProvider).setMyPosition(LatLong(pos.latitude, pos.longitude));

    final currPosition = LatLong(pos.latitude, pos.longitude);
    log(':: liveLocationStream => currPosition | $currPosition !', name: 'live-location');
    if (currPosition == lastPosition) {
      await Future.delayed(const Duration(seconds: 5));
      continue;
    }

    if (ref.read(authUserProvider)!.roleId == 99) {
      log(':: liveLocationStream => Role 99 !', name: 'live-location');
      lastPosition = currPosition;
      await Future.delayed(const Duration(seconds: 5));
      continue;
    }

    final data = {
      "lat": currPosition.lat,
      "lng": currPosition.lng,
      "label": '',
      "heartbeat": DateTime.now().dbDateTime(),
    };
    log(':: LiveLocationStream => data : $data', name: 'live-location');
    await AsyncValue.guard(() async => await ref.read(liveLocationServiceProvider).saveLocation(data: data));
    lastPosition = currPosition;

    await Future.delayed(const Duration(seconds: 5));
  }
  log(':: liveLocationStream => close', name: 'live-location');
});

class LiveLocationCtrl {
  Ref ref;
  LiveLocationCtrl(this.ref);

  void initialize() async {
    log('Initialize Live Location !', name: 'live-location');
    await checkIsBatteryOptimizationDisabled();
    await checkIsAutoStartEnabled();

    ref.read(liveLocationStreamProvider.future);

    ref.listen(authUserProvider, (previous, next) async {
      if (next != null) {
        ref.read(liveLocationStreamProvider.future);
      }
    });

    ref.listen(isGpsEnableProvider, (previous, next) async {
      if (next) {
        ref.read(liveLocationStreamProvider.future);
      }
    });
  }

  Future checkIsBatteryOptimizationDisabled() async {
    final result = await ref.read(permissionServiceProvider).checkIsBatteryOptimizationDisabled();
    log(':: isBatteryOptzDisabled => $result', name: 'live-location');
    ref.read(isBatteryOptzDisabledProvider.notifier).state = result;
  }

  Future checkIsAutoStartEnabled() async {
    final result = await ref.read(permissionServiceProvider).checkIsAutoStartEnabled();
    log(':: checkIsAutoStartEnabled => $result', name: 'live-location');
    ref.read(isAutoStartEnabledProvider.notifier).state = result;
  }

  Future showBatterySettings() async => await ref.read(permissionServiceProvider).showBatterySetting();

  Future showAutoStart() async => await ref.read(permissionServiceProvider).showAutoStart();

  // Future<void> onResumed() async {
  //   // bool isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
  //   // bool isGpsAllowed = await ref.read(permissionServiceProvider).checkGpsPermission();

  //   // if (isGpsEnable && isGpsAllowed) {
  //   //   await ref.read(locationCtrlProvider).getPosition();
  //   //   await ref.read(locationCtrlProvider).getPlacemark();
  //   //   ref.read(liveLocationStreamProvider.future);
  //   // }
  //   // await checkIsBatteryOptimizationDisabled();
  //   // await checkIsAutoStartEnabled();

  //   // ref.read(isGpsEnableProvider.notifier).state = isGpsEnable;
  //   // ref.read(allowGpsProvider.notifier).state = isGpsAllowed;
  // }
}

final liveLocationCtrlProvider = Provider(LiveLocationCtrl.new);
