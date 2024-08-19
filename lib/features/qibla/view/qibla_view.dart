import 'package:amoora/common/controllers/location_controller.dart';
import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/qibla/controller/qibla_controller.dart';
import 'package:amoora/features/qibla/view/widgets/loading_indicator.dart';
import 'package:amoora/features/qibla/view/widgets/qiblah_compass.dart';
import 'package:amoora/features/qibla/view/widgets/qiblah_maps.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QiblaView extends ConsumerWidget {
  const QiblaView({super.key});

  static const routeName = '/qibla';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Qiblat'.hardcoded)),
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
          appBar: AppBar(title: Text('Qiblat'.hardcoded)),
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

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Qiblat')),
        body: ref.watch(isDeviceSensorSupportProvider).when(
              data: (data) => data ? const QiblahCompass() : const QiblahMaps(),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const LoadingIndicator(),
            ),
      ),
    );
  }
}
