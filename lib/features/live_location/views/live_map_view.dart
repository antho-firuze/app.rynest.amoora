import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/warning_layout.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/widgets/button/more_button.dart';
import 'package:amoora/common/widgets/custom_appbar.dart';
import 'package:amoora/common/widgets/bottom_sheet/pill_stripe.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/live_location/controller/live_location_ctrl.dart';
import 'package:amoora/features/live_location/controller/live_maps_ctrl.dart';
import 'package:amoora/features/live_location/views/widgets/body_page.dart';
import 'package:amoora/features/live_location/views/widgets/panel_page.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:super_icons/super_icons.dart';

const borderRadius = BorderRadius.only(
  topLeft: Radius.circular(25),
  topRight: Radius.circular(25),
);

class LiveMapView extends ConsumerStatefulWidget {
  const LiveMapView({
    super.key,
  });

  @override
  ConsumerState<LiveMapView> createState() => _LiveMapViewState();
}

class _LiveMapViewState extends ConsumerState<LiveMapView> with WidgetsBindingObserver {
  @override
  void initState() {
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
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // Check Permission Location
        // await ref.read(liveLocationCtrlProvider).onResumed();
        await ref.read(liveLocationCtrlProvider).checkIsBatteryOptimizationDisabled();
        await ref.read(liveLocationCtrlProvider).checkIsAutoStartEnabled();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pantau Rombongan'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsDeviceTitle,
                subTitle: PermissionString2.gpsDeviceSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(permissionServiceProvider).openLocationSettings(),
                  child: Text('Aktifkan GPS'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(allowGpsProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pantau Rombongan'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsPermissionTitle,
                subTitle: PermissionString2.gpsPermissionSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(locationCtrlProvider).requestGpsPermission(),
                  child: Text('Izinkan Akses'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(isBatteryOptzDisabledProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pantau Rombongan'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: 'Izinkan Aplikasi untuk berjalan di background !',
                child: ElevatedButton(
                  onPressed: () async => await ref.read(liveLocationCtrlProvider).showBatterySettings(),
                  child: Text('Izinkan'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(isAutoStartEnabledProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pantau Rombongan'.hardcoded)),
          body: ListView(
            children: [
              WarningLayout(
                title: 'Mohon aktifkan Auto Start !',
                child: ElevatedButton(
                  onPressed: () async => await ref.read(liveLocationCtrlProvider).showAutoStart(),
                  child: Text('Buka Settings'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Future.delayed(
      const Duration(seconds: 2),
      context.isLandscape() ? null : () => panelController.animatePanelToSnapPoint(),
    );
    double height = MediaQuery.of(context).size.height;

    double panelHeightOpen = context.isLandscape() ? height * .77 : height * .87;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (panelController.panelPosition > .8) {
          panelController.animatePanelToSnapPoint();
        } else if (panelController.panelPosition < .8 && panelController.panelPosition > .1) {
          panelController.close();
        } else {
          context.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              controller: panelController,
              maxHeight: panelHeightOpen,
              minHeight: 37,
              parallaxEnabled: true,
              parallaxOffset: .5,
              snapPoint: .5,
              header: PillStripe(
                onTap: () {
                  if (panelController.panelPosition > 0.8) {
                    panelController.animatePanelToSnapPoint();
                  } else if (panelController.panelPosition < 0.8 && panelController.panelPosition > 0.1) {
                    panelController.close();
                  } else if (panelController.panelPosition < 0.1) {
                    panelController.animatePanelToSnapPoint();
                  }
                },
              ),
              body: const BodyPage(),
              panelBuilder: (sc) => PanelPage(sc: sc),
              borderRadius: borderRadius,
            ),
            SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomAppBar(
                  title: const Text('Pantau Rombongan'),
                  decoration: BoxDecoration(
                    color: primaryLight.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  actions: [
                    // const DarkModeButton(),
                    MoreButton(
                      onPressed: () async => showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        shape: const BeveledRectangleBorder(),
                        builder: (context) => Consumer(
                          builder: (context, ref, child) {
                            ref.watch(refreshMapsProvider);
                            final radius = ref.read(liveMapsCtrlProvider).getRadiusCircle;
                            return MyUI(
                              // isTransparent: true,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.height,
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text("Pengaturan Peta Pantau"),
                                  ),
                                  10.height,
                                  divider(),
                                  10.height,
                                  ListTile(
                                    leading: const Icon(SuperIcons.is_radar_1_outline),
                                    title: Text('Radius area pemantauan => ${radius.round()}meter').bold(),
                                    subtitle: const Text(
                                        'Area lingkaran yang berwarna biru, digunakan untuk memantau jangkauan para jamaah.'
                                        '\n\nDefault: 100m'),
                                    onTap: () async {
                                      bool result = await showModalBottomSheet(
                                        context: context,
                                        shape: const BeveledRectangleBorder(),
                                        builder: (context) => MyUI(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                10.height,
                                                const Text('Pilih jarak radius jangkauan'),
                                                10.height,
                                                ListTile(
                                                  title: const Text('100m (default)'),
                                                  onTap: () {
                                                    ref.read(liveMapsCtrlProvider).setRadiusCircle(100);
                                                    context.pop(true);
                                                  },
                                                ),
                                                ListTile(
                                                  title: const Text('200m'),
                                                  onTap: () {
                                                    ref.read(liveMapsCtrlProvider).setRadiusCircle(200);
                                                    context.pop(true);
                                                  },
                                                ),
                                                ListTile(
                                                  title: const Text('300m'),
                                                  onTap: () {
                                                    ref.read(liveMapsCtrlProvider).setRadiusCircle(300);
                                                    context.pop(true);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );

                                      if (result == true) {
                                        if (context.mounted) context.pop();
                                      }
                                    },
                                  ),
                                  20.height,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // FeedbackButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            onPressed: ref.read(liveMapsCtrlProvider).myLocation,
            child: const Icon(SuperIcons.bx_current_location),
          ),
        ),
      ),
    );
  }
}
