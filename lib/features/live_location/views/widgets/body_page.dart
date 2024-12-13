import 'dart:developer';

import 'package:amoora/features/live_location/controller/live_maps_ctrl.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late GoogleMapController mapController;

class BodyPage extends ConsumerStatefulWidget {
  const BodyPage({
    super.key,
  });

  @override
  ConsumerState<BodyPage> createState() => _BroadcasterMapState();
}

class _BroadcasterMapState extends ConsumerState<BodyPage> with WidgetsBindingObserver {
  @override
  void initState() {
    ref.read(liveMapsCtrlProvider).initialize();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ref.read(liveMapsCtrlProvider).setDarkMode(context.isDarkMode);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(refreshMapsProvider);

    ref.listen(onlineMemberProvider, (previous, next) {
      ref.read(liveMapsCtrlProvider).setOnlineMember(next);
    });

    log('Build Body Maps', name: 'live-maps');
    return GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
          ref.read(liveMapsCtrlProvider).setDarkMode(context.isDarkMode);
        },
        mapType: MapType.normal,
        initialCameraPosition: ref.read(liveMapsCtrlProvider).setCameraPosition(),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(ref.read(liveMapsCtrlProvider).setMarker().values),
        circles: Set<Circle>.of(ref.read(liveMapsCtrlProvider).setCircle().values),
        // onCameraMove: (position) => log('onCameraMove | zoom: ${position.zoom}'),
        // onCameraMoveStarted: () => log('onCameraMoveStarted'),
        onCameraIdle: () async {
          final oldZoomLevel = ref.read(liveMapsCtrlProvider).getZoomLevel;
          if (oldZoomLevel != await mapController.getZoomLevel()) {
            log('onCameraIdle | zoom: ${await mapController.getZoomLevel()}');
            ref.read(liveMapsCtrlProvider).setZoomLevel(await mapController.getZoomLevel());
          }
        },
    );
  }
}
