import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/widgets/button/more_button.dart';
import 'package:amoora/common/widgets/custom_appbar.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/jelajah/controller/jelajah_ctrl.dart';
import 'package:amoora/features/jelajah/views/widgets/body_page.dart';
import 'package:amoora/features/jelajah/views/widgets/panel_page.dart';
import 'package:amoora/common/widgets/bottom_sheet/pill_stripe.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:super_icons/super_icons.dart';

class JelajahView extends ConsumerStatefulWidget {
  const JelajahView({super.key});

  @override
  ConsumerState<JelajahView> createState() => _JelajahViewState();
}

class _JelajahViewState extends ConsumerState<JelajahView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(jelajahCtrlProvider).initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Jelajah'.hardcoded)),
          body: ListView(
            children: [
              WarningException(
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
          appBar: AppBar(title: Text('Jelajah'.hardcoded)),
          body: ListView(
            children: [
              WarningException(
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

    Future.delayed(
      const Duration(seconds: 2),
      context.isLandscape() ? null : () => panelController.animatePanelToSnapPoint(),
    );

    double height = MediaQuery.of(context).size.height;

    double panelHeightOpen = context.isLandscape() ? height * .77 : height * .87;

    log('build | JelajahView', name: 'jelajah');
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
      child: MyUI(
        enabledSafeArea: false,
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
                    log('onTap | ${panelController.panelPosition}', name: 'jelajah');
                    if (panelController.panelPosition > .8) {
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
                    title: const Text('Jelajah'),
                    decoration: BoxDecoration(
                      color: primaryLight.withOpacity(.7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    actions: [
                      // const DarkModeButton(),
                      MoreButton(
                        onPressed: () async => showModalBottomSheet(
                          context: context,
                          useSafeArea: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                          ),
                          builder: (context) => Consumer(
                            builder: (context, ref, child) {
                              ref.watch(radiusCircleProvider);
                              final radius = ref.read(jelajahCtrlProvider).getRadiusCircle;
                              return MyUI(
                                isTransparent: true,
                                child: ListView(
                                  shrinkWrap: true,
                                  // mainAxisSize: MainAxisSize.min,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: CloseButton(onPressed: () => context.pop()),
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                                            child: Text('Pengaturan Peta Jelajah'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    divider(),
                                    ListTile(
                                      leading: const Icon(SuperIcons.is_radar_1_outline),
                                      title: Text('Radius lingkaran => ${radius.round()}meter').bold(),
                                      subtitle: const Text('Area lingkaran yang berwarna biru'
                                              '\n\nDefault: 100m')
                                          .tsLabelL(),
                                      onTap: () async {
                                        bool? result = await showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                                          ),
                                          builder: (context) => MyUI(
                                            isTransparent: true,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: CloseButton(onPressed: () => context.pop()),
                                                    ),
                                                    const Align(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                        padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                                                        child: Text('Pilih jarak radius jangkauan'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                10.height,
                                                ListTile(
                                                  title: const Text('100m (default)').bold(),
                                                  onTap: () {
                                                    ref.read(jelajahCtrlProvider).setRadiusCircle(100);
                                                    context.pop(true);
                                                  },
                                                ),
                                                ListTile(
                                                  title: const Text('200m').bold(),
                                                  onTap: () {
                                                    ref.read(jelajahCtrlProvider).setRadiusCircle(200);
                                                    context.pop(true);
                                                  },
                                                ),
                                                ListTile(
                                                  title: const Text('300m').bold(),
                                                  onTap: () {
                                                    ref.read(jelajahCtrlProvider).setRadiusCircle(300);
                                                    context.pop(true);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );

                                        if (result == true) {
                                          if (context.mounted) Navigator.of(context).pop();
                                        }
                                      },
                                    ),
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
              onPressed: ref.read(jelajahCtrlProvider).gotoMyLocation,
              child: const Icon(SuperIcons.bx_current_location),
            ),
          ),
        ),
      ),
    );
  }
}
