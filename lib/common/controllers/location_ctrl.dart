import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/location_service.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

final latLongProvider = StateProvider<LatLong?>((ref) => null);
final placemarkProvider = StateProvider<Placemark?>((ref) => null);
// Depok, Jawa Barat, Indonesia
final locationProvider = StateProvider<String>((ref) => '');

// Future Provider, using for animate loading effect
final fetchPlacemarkProvider = FutureProvider<Placemark?>((ref) async {
  if (!ref.read(isGpsEnableProvider)) throw 'GPS tidak aktif !';
  if (!ref.read(allowGpsProvider)) throw 'Akses lokasi/GPS gagal !';

  final latLong = ref.read(latLongProvider);
  if (latLong == null) throw 'Lokasi tidak dikenal !';

  final placemark = await ref.read(locationCtrlProvider).fetchPlacemark(latLong);
  return placemark;
});

// Future Provider, using for animate loading effect
// Depok, Jawa Barat, Indonesia
final fetchLocationProvider = FutureProvider<String>((ref) async {
  if (!ref.read(isGpsEnableProvider)) throw 'GPS tidak aktif !';
  if (!ref.read(allowGpsProvider)) throw 'Akses lokasi/GPS gagal !';

  final latLong = ref.read(latLongProvider);
  if (latLong == null) throw 'Lokasi tidak dikenal !';

  final placemark = await ref.read(locationCtrlProvider).fetchPlacemark(latLong);
  final placemarkStr = [
    placemark?.subAdministrativeArea,
    placemark?.administrativeArea,
    placemark?.country,
  ].join(', ');

  ref.read(locationProvider.notifier).state = placemarkStr;

  return placemarkStr;
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
      ref.read(latLongProvider.notifier).state = await fetchPosition();
    }

    // LISTEN GPS Status
    ref.listen(isGpsEnableProvider, (previous, next) async {
      if (next) {
        if (ref.read(allowGpsProvider)) {
          ref.read(latLongProvider.notifier).state = await fetchPosition();
        }
      }
    });

    // LISTEN GPS Permission
    ref.listen(allowGpsProvider, (previous, next) async {
      if (next) {
        if (ref.read(isGpsEnableProvider)) {
          ref.read(latLongProvider.notifier).state = await fetchPosition();
        }
      }
    });

    // LISTEN Position
    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        ref.read(placemarkProvider.notifier).state = await fetchPlacemark(next);
        ref.refresh(fetchPlacemarkProvider);
        ref.refresh(fetchLocationProvider);
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

  Future<LatLong> fetchPosition() async => await ref.read(locationServiceProvider).fetchCurrentCoordinate();

  Future<Placemark?> fetchPlacemark(LatLong latLong) async =>
      await ref.read(locationServiceProvider).fetchPlacemark(latLong);

  Future<void> refresh() async {
    bool isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
    bool isGpsAllowed = await ref.read(permissionServiceProvider).checkGpsPermission();

    if (!isGpsEnable) {
      log('refresh => checkGpsEnabled', name: 'LOCATION-CTRL');
      await AlertService.confirm(
        title: 'Informasi',
        body: 'GPS pada perangkat anda tidak aktif !',
        yesCaption: 'Buka Settings',
        onYes: () async {
          isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
          if (!isGpsEnable) {
            await ref.read(permissionServiceProvider).openLocationSettings();
          }
        },
        noCaption: 'Tutup',
      );
    }

    if (isGpsEnable && !isGpsAllowed) {
      await requestGpsPermission();
    }

    if (isGpsEnable && isGpsAllowed) {
      ref.read(latLongProvider.notifier).state = await fetchPosition();
    }

    ref.read(isGpsEnableProvider.notifier).state = isGpsEnable;
    ref.read(allowGpsProvider.notifier).state = isGpsAllowed;
  }
}

final locationCtrlProvider = Provider(LocationCtrl.new);
