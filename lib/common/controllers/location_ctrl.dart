import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/location_service.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

final isBusyLocationProvider = StateProvider<bool>((ref) => false);
final latLongProvider = StateProvider<LatLong?>((ref) => null);
final placemarkProvider = StateProvider<Placemark?>((ref) => null);
final locationProvider = StateProvider<String>((ref) => '');

class LocationCtrl {
  Ref ref;
  LocationCtrl(this.ref);

  static const locationKey = 'LOCATION_KEY';
  static const placemarkKey = 'PLACEMARK_KEY';

  Future<void> initialize() async {
    log('Initialize GPS Location !');
    await checkGpsEnabled();
    await checkGpsPermission();
    loadCurrPosition();
    loadCurrPlacemark();

    // LISTEN GPS Status
    ref.listen(isGpsEnableProvider, (previous, next) async {
      if (next) {
        if (ref.read(allowGpsProvider)) {
          await getPosition();
        }
      }
    });

    // LISTEN GPS Permission
    ref.listen(allowGpsProvider, (previous, next) async {
      if (next) {
        if (ref.read(isGpsEnableProvider)) {
          await getPosition();
        }
      }
    });

    // LISTEN Position
    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        await getPlacemark();
      }
    });
  }

  /// Used for open App Setting, and granted permission manually
  // Future<void> openAppSettings() async => await ref.read(permissionServiceProvider).openAppSettingz();

  /// Used for open GPS/Location Setting
  // Future<void> openLocationSettings() async => await ref.read(permissionServiceProvider).openLocationSettings();

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

  Future<void> getPosition() async {
    final latLng = await ref.read(locationServiceProvider).fetchCurrentCoordinate();
    log('getPosition | $latLng', name: 'LOCATION-CTRL');
    saveCurrPosition(latLng);
  }

  void saveCurrPosition(LatLong? latLong) {
    if (latLong == null) {
      ref.read(latLongProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(locationKey);
    } else {
      ref.read(latLongProvider.notifier).state = latLong;
      ref.read(sharedPrefProvider).setString(locationKey, jsonEncode(latLong.toJson()));
    }
  }

  void loadCurrPosition() {
    final data = ref.read(sharedPrefProvider).getString(locationKey);
    log('loadCurrPosition | $data', name: 'LOCATION-CTRL');
    LatLong? latLong = data == null ? null : LatLong.fromJson(jsonDecode(data));
    ref.read(latLongProvider.notifier).state = latLong;
  }

  Future<void> getPlacemark() async {
    LatLong? latLong = ref.read(latLongProvider);
    if (latLong == null) {
      ref.read(placemarkProvider.notifier).state = null;
    } else {
      ref.read(isBusyLocationProvider.notifier).state = true;

      Placemark? placemark = await ref.read(locationServiceProvider).fetchPlacemark(latLong);
      saveCurrPlacemark(placemark);

      ref.read(isBusyLocationProvider.notifier).state = false;
    }
  }

  void saveCurrPlacemark(Placemark? placemark) {
    if (placemark == null) {
      ref.read(sharedPrefProvider).remove(placemarkKey);
      ref.read(locationProvider.notifier).state = '';
    } else {
      ref.read(sharedPrefProvider).setString(placemarkKey, jsonEncode(placemark.toJson()));
      ref.read(locationProvider.notifier).state = [
        placemark.subAdministrativeArea,
        placemark.administrativeArea,
        placemark.country,
      ].join(', ');
    }
    ref.read(placemarkProvider.notifier).state = placemark;
  }

  void loadCurrPlacemark() {
    final data = ref.read(sharedPrefProvider).getString(placemarkKey);
    log('loadCurrPlacemark | $data', name: 'LOCATION-CTRL');
    Placemark? placemark = data == null ? null : Placemark.fromMap(jsonDecode(data));
    if (placemark == null) {
      ref.read(locationProvider.notifier).state = '';
    } else {
      ref.read(locationProvider.notifier).state = [
        placemark.subAdministrativeArea,
        placemark.administrativeArea,
        placemark.country,
      ].join(', ');
    }
    ref.read(placemarkProvider.notifier).state = placemark;
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
      await getPosition();
      await getPlacemark();
    }

    ref.read(isGpsEnableProvider.notifier).state = isGpsEnable;
    ref.read(allowGpsProvider.notifier).state = isGpsAllowed;
  }
}

final locationCtrlProvider = Provider(LocationCtrl.new);