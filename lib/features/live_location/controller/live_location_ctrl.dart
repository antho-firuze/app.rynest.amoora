import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/user/controller/user_setting_ctrl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = 'LIVE_LOCATION-CTRL';

final selfLocationProvider = StateProvider<LatLong?>((ref) => null);

// For User to update their location (only in Arab)
final userLocationStreamProvider = StreamProvider.family<void, bool>((ref, showLog) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 30));

    if (ref.read(authUserProvider) == null) {
      if (showLog) log('userLocationStreamProvider : user not logged', name: _kLogName);
      continue;
    }
    if (!ref.read(isGpsEnableProvider)) {
      if (showLog) log('userLocationStreamProvider : GPS status disabled', name: _kLogName);
      continue;
    }
    if (!ref.read(allowGpsProvider)) {
      if (showLog) log('userLocationStreamProvider : GPS permission not allowed', name: _kLogName);
      continue;
    }

    final latLong = await ref.read(locationCtrlProvider).fetchPosition();
    final placemark = await ref.read(locationCtrlProvider).fetchPlacemark(latLong);

    switch (ref.read(trackingLocationProvider)) {
      case TrackingMyLocation.notAllowed:
        if (showLog) log('userLocationStreamProvider : tracking not allowed', name: _kLogName);
        continue;
      case TrackingMyLocation.allowed:
        if (showLog) log('userLocationStreamProvider : tracking allowed', name: _kLogName);
        break;
      case TrackingMyLocation.onlyInSaudiArabia:
        // log('Your placemark: ${placemark?.isoCountryCode}', name: _kLogName);
        if (!['AE', 'SA'].contains(placemark?.isoCountryCode)) {
          if (showLog) log('userLocationStreamProvider : not in Saudi Arabia', name: _kLogName);
          continue;
        }
        if (showLog) log('userLocationStreamProvider : tracking only in Saudi Arabia', name: _kLogName);
    }

    // For logged user only
    // For Enable GPS & Allow GPS permission
    // and for Allow Tracking or Only Tracking in Saudi Arabia
    final reqs = Reqs(
      path: '/api/v1/maps/save_location',
      data: {
        "lat": latLong.lat,
        "lng": latLong.lng,
      },
    );
    await AsyncValue.guard(
        () async => await ref.read(apiServiceProvider).call(reqs: reqs, showBusy: false, showError: false));
  }
});

// For listen user online (live location)
final userOnlineCountProvider = StreamProvider<int>((ref) async* {
});

// For listen user online by type (jamaah, muthowwif, anonymous, all)
final userOnlineByTypeProvider = StreamProvider<int>((ref) async* {

});

class LiveLocationCtrl {
  Ref ref;
  LiveLocationCtrl(this.ref);

  void initialize() async {
    log('Initialize Live Location !');
    // await checkIsBatteryOptimizationDisabled();
    // await checkIsAutoStartEnabled();

    ref.read(userLocationStreamProvider(false));

    // PUSH STREAM for jamaah
    // send gps position for muthowwif monitoring
    // ref.read(coordinateStreamProvider).pushCoordinate();

    // FETCH STREAM for muthowwif
    // monitor the position of the jamaah
    // RoleId = 2 (muthowwif)
    // ref.read(coordinateStreamProvider).fetchMyCoordinate();
    // await ref.read(coordinateStreamProvider).monitoringMember();

    // ref.listen(authUserProvider, (previous, next) async {
    //   ref.read(coordinateStreamProvider).fetchMyCoordinate();
    //   ref.read(coordinateStreamProvider).pushCoordinate();
    //   await ref.read(coordinateStreamProvider).monitoringMember();
    // });

    // ref.listen(isGpsEnableProvider, (previous, next) {
    //   if (next) {
    //     ref.read(coordinateStreamProvider).fetchMyCoordinate();
    //     ref.read(coordinateStreamProvider).pushCoordinate();
    //   }
    // });

    // ref.listen(allowGpsProvider, (previous, next) {
    //   if (next) {
    //     ref.read(coordinateStreamProvider).fetchMyCoordinate();
    //     ref.read(coordinateStreamProvider).pushCoordinate();
    //   }
    // });
  }
}

final liveLocationCtrlProvider = Provider(LiveLocationCtrl.new);
