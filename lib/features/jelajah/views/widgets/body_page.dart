import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/features/jelajah/controller/jelajah_ctrl.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController? mapController;

class BodyPage extends ConsumerStatefulWidget {
  const BodyPage({
    super.key,
  });

  @override
  ConsumerState<BodyPage> createState() => _JelajahMapState();
}

class _JelajahMapState extends ConsumerState<BodyPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(jelajahCtrlProvider).initMarkers();
      ref.read(jelajahCtrlProvider).initCircles();
    });
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
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(seconds: 1), () async {
          // ref.read(jelajahCtrlProvider).setMarkers();
          // await ref.read(locationCtrlProvider).checkGpsEnabled();
          // await ref.read(locationCtrlProvider).checkGpsPermission();
          ref.read(jelajahCtrlProvider).initMarkers();
          ref.read(jelajahCtrlProvider).initCircles();
          if (mapController != null) {
            ref.read(jelajahCtrlProvider).setDarkMode(context.isDarkMode);
          }
        });
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(latLongProvider) == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            15.height,
            const Text('Waiting GPS Location !').tsCaption().thin,
          ],
        ),
      );
    }

    if (ref.watch(markersProvider) == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            15.height,
            const Text('Loading Places !').tsCaption().thin,
          ],
        ),
      );
    }

    if (ref.watch(circlesProvider) == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            15.height,
            const Text('Loading Places Circle !').tsCaption().thin,
          ],
        ),
      );
    }

    log('build | Jelajah Map', name: 'jelajah');
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
        ref.read(jelajahCtrlProvider).setDarkMode(context.isDarkMode);
      },
      mapType: MapType.normal,
      initialCameraPosition: ref.read(jelajahCtrlProvider).initCameraPosition(),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(ref.read(markersProvider)!.values),
      circles: Set<Circle>.of(ref.read(circlesProvider)!.values),
      onCameraIdle: () async {
        final oldZoomLevel = ref.read(jelajahCtrlProvider).getZoomLevel;
        if (oldZoomLevel != await mapController!.getZoomLevel()) {
          log('GoogleMap | onCameraIdle | zoom: ${await mapController!.getZoomLevel()}', name: 'jelajah');
          ref.read(jelajahCtrlProvider).setZoomLevel(await mapController!.getZoomLevel());
        }
      },
    );
  }
}
