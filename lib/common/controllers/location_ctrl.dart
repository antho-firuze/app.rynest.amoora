import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/location_service.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

final latLongProvider = StateProvider<LatLong?>((ref) => null);
final locationProvider = StateProvider<String>((ref) => '');
final placemarkProvider = StateProvider<Placemark?>((ref) => null);

final fetchLocationProvider = FutureProvider<LatLong?>((ref) async {
  final latLng = await ref.read(locationCtrlProvider).fetchPosition();
  
  await ref.read(locationCtrlProvider).fetchPlacemark();

  return latLng;
});

class LocationCtrl {
  Ref ref;
  LocationCtrl(this.ref);

  static const locationKey = 'LOCATION_KEY';
  static const placemarkKey = 'PLACEMARK_KEY';

  Future<void> initialize() async {
    log('Initialize GPS Location !');
    await checkGpsEnabled();
    await checkGpsPermission();

    if (ref.read(isGpsEnableProvider) && ref.read(allowGpsProvider)) {
      await fetchPosition();
      await fetchPlacemark();
    }

    // LISTEN GPS Status
    ref.listen(isGpsEnableProvider, (previous, next) async {
      if (next) {
        if (ref.read(allowGpsProvider)) {
          await fetchPosition();
        }
      }
    });

    // LISTEN GPS Permission
    ref.listen(allowGpsProvider, (previous, next) async {
      if (next) {
        if (ref.read(isGpsEnableProvider)) {
          await fetchPosition();
        }
      }
    });

    // LISTEN Position
    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        await fetchPlacemark();
      }
    });
  }

  Future<void> checkGpsEnabled() async =>
      ref.read(isGpsEnableProvider.notifier).state = await ref.read(permissionServiceProvider).checkGpsEnabled();

  Future<void> checkGpsPermission() async =>
      ref.read(allowGpsProvider.notifier).state = await ref.read(permissionServiceProvider).checkGpsPermission();

  Future<void> requestGpsPermission() async {
    final result = await ref.read(permissionServiceProvider).requestGpsPermission();
    if (result == true) {
      ref.read(allowGpsProvider.notifier).state = true;
    }
  }

  Future<LatLong> fetchPosition() async {
    final latLng = await ref.read(locationServiceProvider).fetchCurrentCoordinate();

    ref.read(latLongProvider.notifier).state = latLng;

    return latLng;
  }

  Future<Placemark?> fetchPlacemark() async {
    LatLong? latLong = ref.read(latLongProvider);
    Placemark? placemark;
    if (latLong != null) {
      placemark = await ref.read(locationServiceProvider).fetchPlacemark(latLong);

      ref.read(placemarkProvider.notifier).state = placemark;
      ref.read(locationProvider.notifier).state = [
        placemark?.subAdministrativeArea,
        placemark?.administrativeArea,
        placemark?.country,
      ].join(', ');
    }
    return placemark;
  }

  Future<void> refresh() async {
    bool isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
    bool isGpsAllowed = await ref.read(permissionServiceProvider).checkGpsPermission();

    if (!isGpsEnable) {
      log('refresh => checkGpsEnabled', name: 'LOCATION-CTRL');
      await AlertService.confirm(
        title: 'Informasi',
        body: 'GPS pada perangkat anda tidak aktif !',
        showOk: true,
        okCaption: 'Buka Settings',
        onOk: () async {
          isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
          if (!isGpsEnable) {
            await ref.read(permissionServiceProvider).openLocationSettings();
          }
        },
        showYes: false,
        yesCaption: 'Buka Peta',
        onYes: () => SnackBarService.show(message: 'Peta belum di fungsikan !'),
        noCaption: 'Tutup',
      );
    }

    if (isGpsEnable && !isGpsAllowed) {
      await requestGpsPermission();
    }

    if (isGpsEnable && isGpsAllowed) {
      await fetchPosition();
      await fetchPlacemark();
    }

    ref.read(isGpsEnableProvider.notifier).state = isGpsEnable;
    ref.read(allowGpsProvider.notifier).state = isGpsAllowed;
  }
}

final locationCtrlProvider = Provider(LocationCtrl.new);
