import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/widgets/custom_appbar.dart';
import 'package:amoora/common/widgets/bottom_sheet/pill_stripe.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/prayer_times/views/widgets/body_page.dart';
import 'package:amoora/features/prayer_times/views/widgets/panel_page.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const borderRadius = BorderRadius.only(
  topLeft: Radius.circular(25),
  topRight: Radius.circular(25),
);

class PrayerTimesView extends ConsumerWidget {
  const PrayerTimesView({
    super.key,
  });

  static const routeName = '/prayer_times';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Jadwal Waktu Sholat'.hardcoded)),
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
          appBar: AppBar(title: Text('Jadwal Waktu Sholat'.hardcoded)),
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
      const Duration(milliseconds: 500),
      () => context.isLandscape()
          ? context.isBigScreen
              ? panelController.animatePanelToSnapPoint()
              : null
          : panelController.animatePanelToSnapPoint(),
    );
    double height = MediaQuery.of(context).size.height;

    double panelHeightOpen = context.isLandscape() ? height * .77 : height * .87;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // debugPrint('${panelController.panelPosition}');
        if (panelController.panelPosition > .3) {
          panelController.animatePanelToSnapPoint();
        } else {
          context.pop();
        }
      },
      child: MyUI(
        child: Scaffold(
          body: Stack(
            children: [
              SlidingUpPanel(
                controller: panelController,
                maxHeight: panelHeightOpen,
                minHeight: 37,
                parallaxEnabled: true,
                parallaxOffset: .1,
                snapPoint: .3,
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
                panelBuilder: (sc) => const PanelPage(),
                borderRadius: borderRadius,
              ),
              SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomAppBar(
                    title: Text('Jadwal Waktu Sholat'.hardcoded),
                    decoration: BoxDecoration(
                      color: oWhite70.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    actions: const [
                      // DarkModeButton(),
                      // FeedbackButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
