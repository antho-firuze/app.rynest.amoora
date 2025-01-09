import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/services/maps_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_location/model/member.dart';
import 'package:amoora/features/live_location/views/widgets/body_page.dart';
import 'package:amoora/utils/distance_utils.dart';
import 'package:amoora/utils/duration_utils.dart';
import 'package:amoora/utils/maps_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';

PanelController panelController = PanelController();

final onlineMemberProvider = StateProvider<List<Member>>((ref) => []);
final refreshMapsProvider = StateProvider<String>((ref) => '');
final myPositionProvider = StateProvider<LatLong?>((ref) => null);

class LiveMapsCtrl {
  Ref ref;
  LiveMapsCtrl(this.ref);

  LatLong? _myPos;
  final double _defaultZoomLevel = 17;
  double _defaultSelfRadiusCircle = 100;
  final double _defaultMemberRadiusCircle = 10;
  final Color _defaultSelfFillColorCircle = Colors.blue.shade100.withValues(alpha: .5);
  final Color _defaultSelfStrokeColorCircle = Colors.blue.shade100.withValues(alpha: .1);
  final Color _defaultMemberFillColorCircle = Colors.purple.shade100.withValues(alpha: .5);
  final Color _defaultMemberStrokeColorCircle = Colors.purple.shade100.withValues(alpha: .1);

  List<Member> _onlineMember = [];

  static const _zoomLevelKey = 'ZOOM_LEVEL_KEY';
  static const _radiusCircleKey = 'RADIUS_CIRCLE_KEY';

  void initialize() {
    setOnlineMember(ref.read(onlineMemberProvider));
  }

  void setMyPosition(LatLong pos) => _myPos = pos;

  LatLong get getMyPosition => _myPos!;

  void setZoomLevel(double value) {
    ref.read(sharedPrefProvider).setDouble(_zoomLevelKey, value);
    ref.read(refreshMapsProvider.notifier).state = const Uuid().v4();
  }

  void setRadiusCircle(double value) {
    _defaultSelfRadiusCircle = value;
    ref.read(sharedPrefProvider).setDouble(_radiusCircleKey, value);
    ref.read(refreshMapsProvider.notifier).state = const Uuid().v4();
  }

  void myLocation() async {
    log(':: myLocation', name: 'LIVEMAPS-CTRL');
    final latLng = LatLng(_myPos!.lat, _myPos!.lng);
    await mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, getZoomLevel));
  }

  void setDarkMode(bool state) {
    log(':: setDarkMode', name: 'LIVEMAPS-CTRL');
    mapController.setMapStyle(state ? jsonEncode(darkMapStyle) : null);
  }

  void changeFocusPosition(List<double> latLng, String markerId) async {
    log(':: changeFocusPosition', name: 'LIVEMAPS-CTRL');
    await mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(latLng[0], latLng[1]), getZoomLevel));
    await mapController.showMarkerInfoWindow(MarkerId(markerId));
  }

  double get getZoomLevel => ref.read(sharedPrefProvider).getDouble(_zoomLevelKey) ?? _defaultZoomLevel;

  double get getRadiusCircle => ref.read(sharedPrefProvider).getDouble(_radiusCircleKey) ?? _defaultSelfRadiusCircle;

  List<Member> getOnlineMember() => _onlineMember;

  void setOnlineMember(List<Member> members) => _onlineMember = _calculateDistance(members);

  List<Member> _calculateDistance(List<Member> members) {
    final myPos = LatLng(_myPos!.lat, _myPos!.lng);
    for (var i = 0; i < members.length; i++) {
      Member member = members[i];
      final distance = calculateDistane([myPos, LatLng(member.lat, member.lng)]);
      final isOutOfRange = distance > getRadiusCircle;
      members[i] = member.copyWith(distance: distance, isOutOfRange: isOutOfRange);
    }
    // log(":: _calculateDistance: $members");
    return members;
  }

  CameraPosition setCameraPosition() {
    log('Set Camera Position !', name: 'LIVEMAPS-CTRL');
    return CameraPosition(target: LatLng(_myPos!.lat, _myPos!.lng), zoom: getZoomLevel);
  }

  Map<CircleId, Circle> setCircle() {
    log('Set circle position !', name: 'LIVEMAPS-CTRL');
    var circles = <CircleId, Circle>{};

    // SELF CIRCLE
    final myPos = LatLng(_myPos!.lat, _myPos!.lng);
    final id = ref.read(authUserProvider)!.id;
    final circleId = CircleId('circleId_$id');
    circles[circleId] = Circle(
      circleId: circleId,
      center: myPos,
      radius: _defaultSelfRadiusCircle,
      fillColor: _defaultSelfFillColorCircle,
      strokeColor: _defaultSelfStrokeColorCircle,
      strokeWidth: 1,
    );

    // MEMBER CIRCLE
    final members = _onlineMember;
    for (final member in members) {
      final latLng = LatLng(member.lat, member.lng);
      final id = member.userId;
      final circleId = CircleId('circleId_$id');
      circles[circleId] = Circle(
        circleId: circleId,
        center: latLng,
        radius: _defaultMemberRadiusCircle,
        fillColor: _defaultMemberFillColorCircle,
        strokeColor: _defaultMemberStrokeColorCircle,
        strokeWidth: 1,
      );
    }

    return circles;
  }

  Map<MarkerId, Marker> setMarker() {
    log('Set Marker for users !', name: 'LIVEMAPS-CTRL');
    var markers = <MarkerId, Marker>{};

    final members = _onlineMember;
    for (final member in members) {
      final title = member.profile!.fullName;
      final position = LatLng(member.lat, member.lng);
      final distance = member.distance;
      final icon = member.isOutOfRange
          ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
          : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      final userTime = member.heartbeat;
      final lastOnline = userTime!.difference(DateTime.now());
      final snippet = '${distance.toApproximately()} | ${lastOnline.timeAgo()}';

      final markerId = MarkerId('markerId_${member.userId}');
      markers[markerId] = Marker(
        markerId: markerId,
        position: position,
        icon: icon,
        infoWindow: InfoWindow(title: title, snippet: snippet),
      );
    }
    return markers;
  }

  // void setCustomMapPin() async {
  //   pinLocationIcon = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(devicePixelRatio: 2.5),
  //       'assets/images/pin.png');
  // }
}

final liveMapsCtrlProvider = Provider(LiveMapsCtrl.new);
