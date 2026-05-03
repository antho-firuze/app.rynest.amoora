import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

// AndroidMapRenderer mapRenderer = AndroidMapRenderer.platformDefault;

Future<void> initializeMapImplementation() async {
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;

  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    await initializeMapRenderer();
  }
}

Future<void> initializeMapRenderer() async {
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;

  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
    // mapRenderer = await mapsImplementation.initializeWithRenderer(AndroidMapRenderer.latest);
  }
}

double calculateDistane(List<LatLng> polyline) {
  double totalDistance = 0;
  for (int i = 0; i < polyline.length; i++) {
    if (i < polyline.length - 1) {
      // skip the last index
      totalDistance += getStraightLineDistance(
          polyline[i + 1].latitude, polyline[i + 1].longitude, polyline[i].latitude, polyline[i].longitude);
    }
  }
  return totalDistance;
}

double getStraightLineDistance(lat1, lon1, lat2, lon2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2 - lat1);
  var dLon = deg2rad(lon2 - lon1);
  var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(deg2rad(lat1)) * math.cos(deg2rad(lat2)) * math.sin(dLon / 2) * math.sin(dLon / 2);
  var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  var d = R * c; // Distance in km
  return d * 1000; //in m
}

dynamic deg2rad(deg) {
  return deg * (math.pi / 180);
}
