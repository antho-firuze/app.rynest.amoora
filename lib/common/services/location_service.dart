import 'dart:async';

import 'package:amoora/common/models/latlong.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final Ref ref;
  LocationService(this.ref);

  Stream<Position> get gpsStream => Geolocator.getPositionStream(locationSettings: _getLocationSettings);

  LocationSettings? get _getLocationSettings {
    late LocationSettings locationSettings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          // distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        // distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    return locationSettings;
  }

  Future<LatLong> fetchCurrentCoordinate() async {
    Position? position = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: false);

    position ??= await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: false,
      timeLimit: const Duration(seconds: 10),
    );

    return LatLong(position.latitude, position.longitude);
  }

  Stream<LatLong> streamCurrentCoordinate() async* {
    LatLong latLong = LatLong(0, 0);
    Geolocator.getPositionStream(locationSettings: _getLocationSettings).listen((position) {
      latLong = LatLong(position.latitude, position.longitude);
    });

    yield latLong;
  }

  Future<Placemark?> fetchPlacemark(LatLong latLong) async {
    final result = await placemarkFromCoordinates(latLong.lat, latLong.lng);
    return result[0];
  }
}

final locationServiceProvider = Provider(LocationService.new);
