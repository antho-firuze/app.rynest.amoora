import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/maps_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/features/jelajah/model/place.dart';
import 'package:amoora/features/jelajah/service/jelajah_service.dart';
import 'package:amoora/features/jelajah/views/widgets/body_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

PanelController panelController = PanelController();

final radiusCircleProvider = StateProvider.autoDispose<double>((ref) => 100);
final markersProvider = StateProvider<Map<MarkerId, Marker>?>((ref) => null);
final circlesProvider = StateProvider<Map<CircleId, Circle>?>((ref) => null);

final fetchPlacesProvider =
    FutureProvider<List<Place>>((ref) async => await ref.read(jelajahServiceProvider).fetchPlaces());

final getImageJelajahProvider = FutureProvider.family<String, String>(
    (ref, filename) async => await ref.read(jelajahServiceProvider).downloadAndSafeByFilename(filename));

class JelajahCtrl {
  Ref ref;
  JelajahCtrl(this.ref);

  LatLong? _myPos;
  final double _defaultZoomLevel = 17;
  double _defaultSelfRadiusCircle = 100;
  final double _defaultPlaceRadiusCircle = 10;
  final Color _defaultSelfFillColorCircle = Colors.blue.shade100.withValues(alpha: .5);
  final Color _defaultSelfStrokeColorCircle = Colors.blue.shade100.withValues(alpha: .1);
  final Color _defaultPlaceFillColorCircle = Colors.purple.shade100.withValues(alpha: .5);
  final Color _defaultPlaceStrokeColorCircle = Colors.purple.shade100.withValues(alpha: .1);

  List<Place> _places = [];

  static const _zoomLevelKey = 'JELAJAH_ZOOM_LEVEL_KEY';
  static const _radiusCircleKey = 'JELAJAH_RADIUS_CIRCLE_KEY';

  Future initialize() async {
    await initPlaces();

    ref.listen(latLongProvider, (previous, next) {
      if (_myPos == null) {
        _myPos = next;
        setCircles();
      }
    });
  }

  Future initMyPos() async {
    _myPos = ref.read(latLongProvider);
  }

  Future initPlaces() async {
    _places = await ref.read(jelajahServiceProvider).fetchPlaces();
  }

  CameraPosition initCameraPosition() {
    initMyPos();

    log('initCameraPosition | $_myPos', name: 'JELAJAH-CTRL');
    return CameraPosition(target: LatLng(_myPos!.lat, _myPos!.lng), zoom: getZoomLevel);
  }

  void gotoMyLocation() async {
    await ref.read(locationCtrlProvider).fetchPosition();
    _myPos = ref.read(latLongProvider);
    await mapController!.animateCamera(CameraUpdate.newLatLngZoom(LatLng(_myPos!.lat, _myPos!.lng), 17));
  }

  void setDarkMode(bool state) => mapController!.setMapStyle(state ? jsonEncode(darkMapStyle) : null);

  void setZoomLevel(double value) => ref.read(sharedPrefProvider).setDouble(_zoomLevelKey, value);

  void setRadiusCircle(double value) {
    _defaultSelfRadiusCircle = value;
    ref.read(radiusCircleProvider.notifier).state = value;
    setCircles();
    ref.read(sharedPrefProvider).setDouble(_radiusCircleKey, value);
  }

  void changeFocusPosition(List<double> latLng, String markerId) async {
    log('changeFocusPosition | $latLng | $markerId', name: 'JELAJAH-CTRL');
    await mapController!.animateCamera(CameraUpdate.newLatLngZoom(LatLng(latLng[0], latLng[1]), getZoomLevel));
    await mapController!.showMarkerInfoWindow(MarkerId(markerId));
  }

  double get getZoomLevel => ref.read(sharedPrefProvider).getDouble(_zoomLevelKey) ?? _defaultZoomLevel;

  double get getRadiusCircle => ref.read(sharedPrefProvider).getDouble(_radiusCircleKey) ?? _defaultSelfRadiusCircle;

  List<Place> getPlaces() => _places;

  void initMarkers() {
    log('initMarkers | ${_places.length}', name: 'JELAJAH-CTRL');
    setMarkers();
  }

  void setMarkers() {
    var markers = <MarkerId, Marker>{};

    for (final place in _places) {
      final markerId = MarkerId('markerId_${place.id}');
      markers[markerId] = Marker(
        markerId: markerId,
        position: LatLng(place.lat, place.lng),
        infoWindow: InfoWindow(title: place.name, snippet: '*'),
      );
    }

    ref.read(markersProvider.notifier).state = markers;
  }

  void initCircles() {
    log('initCircle', name: 'JELAJAH-CTRL');
    initMyPos();
    setCircles();
  }

  void setCircles() {
    var circles = <CircleId, Circle>{};

    if (_myPos == null) return;

    // SELF CIRCLE
    const circleId = CircleId('circleId_0');
    circles[circleId] = Circle(
      circleId: circleId,
      center: LatLng(_myPos!.lat, _myPos!.lng),
      radius: _defaultSelfRadiusCircle,
      fillColor: _defaultSelfFillColorCircle,
      strokeColor: _defaultSelfStrokeColorCircle,
      strokeWidth: 1,
    );

    // PLACES CIRCLE
    final places = _places;
    for (final place in places) {
      final id = place.id;
      final latLng = LatLng(place.lat, place.lng);
      final circleId = CircleId('circleId_$id');
      circles[circleId] = Circle(
        circleId: circleId,
        center: latLng,
        radius: _defaultPlaceRadiusCircle,
        fillColor: _defaultPlaceFillColorCircle,
        strokeColor: _defaultPlaceStrokeColorCircle,
        strokeWidth: 1,
      );
    }

    log('setCircles', name: 'JELAJAH-CTRL');
    ref.read(circlesProvider.notifier).state = circles;
  }
}

final jelajahCtrlProvider = Provider(JelajahCtrl.new);
