import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/widgets/forms/group_list.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_string.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_location/controller/live_location_ctrl.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DeviceCheckView extends ConsumerStatefulWidget {
  const DeviceCheckView({
    super.key,
  });

  @override
  ConsumerState<DeviceCheckView> createState() => _DeviceCheckViewState();
}

class _DeviceCheckViewState extends ConsumerState<DeviceCheckView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    checkServiceAndPermission();
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
      log('=>=> :: DeviceCheckView => Resumed');
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        checkServiceAndPermission();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  void checkServiceAndPermission() async {
    // ref.read(liveLocationCtrlProvider).checkIsBatteryOptimizationDisabled();
    ref.read(allowAlertProvider.notifier).state =
        await ref.read(permissionServiceProvider).checkNotificationPermission();

    ref.read(allowCameraAndStorageProvider.notifier).state =
        await ref.read(permissionServiceProvider).checkCameraAndMediaPermission();

    ref.read(allowMicrophoneProvider.notifier).state =
        await ref.read(permissionServiceProvider).checkMicrophonePermission();
  }

  @override
  Widget build(BuildContext context) {
    final loc = ref.watch(isGpsEnableProvider);
    final batt = ref.watch(isBatteryOptzDisabledProvider);
    final locPerm = ref.watch(allowGpsProvider);
    final cam = ref.watch(allowCameraAndStorageProvider);
    final mic = ref.watch(allowMicrophoneProvider);
    final not = ref.watch(allowAlertProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Device Check')),
        body: ListView(
          shrinkWrap: true,
          children: [
            GroupList(
              title: ListTile(title: const Text("Services").bold()),
              children: [
                ListTile(
                  leading: const Icon(SuperIcons.mg_location_2_line),
                  title: const Text('Location Services').bold(),
                  subtitle: Text(loc ? PermissionString.gpsEnabled : PermissionString.gpsDisabled),
                  trailing: Icon(loc ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: loc ? oGreen : oRed),
                  onTap: loc ? null : () async => await ref.read(permissionServiceProvider).openLocationSettings(),
                ),
                // ListTile(
                //   leading: const Icon(SuperIcons.cl_battery_outline_alerted),
                //   title: const Text('Battery Optimization').bold(),
                //   subtitle: Text(batt ? PermissionString.batteryOptzExclude : PermissionString.batteryOptzInclude),
                //   trailing: Icon(batt ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: batt ? oGreen : oRed),
                //   onTap: () async => await ref.read(liveLocationCtrlProvider).showBatterySettings(),
                // ),
              ],
            ),
            GroupList(
              title: ListTile(title: const Text("Permissions").bold()),
              children: [
                ListTile(
                  leading: const Icon(SuperIcons.mg_location_2_line),
                  title: const Text('Location').bold(),
                  subtitle: Text(locPerm ? PermissionString.locationAllowed : PermissionString.locationDisallowed),
                  trailing:
                      Icon(locPerm ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: locPerm ? oGreen : oRed),
                  onTap: locPerm ? null : () async => await ref.read(locationCtrlProvider).requestGpsPermission(),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.ev_camera_outline),
                  title: const Text('Camera & Media').bold(),
                  subtitle: Text(cam ? PermissionString.cameraAllowed : PermissionString.cameraDisallowed),
                  trailing: Icon(cam ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: cam ? oGreen : oRed),
                  onTap: cam
                      ? null
                      : () async => await ref.read(permissionServiceProvider).requestCameraAndMediaPermission(),
                ),
                if (ref.read(authUserProvider)?.roleId != 1)
                  ListTile(
                    leading: const Icon(SuperIcons.bx_microphone),
                    title: const Text('Microphone').bold(),
                    subtitle: Text(mic ? PermissionString.microphoneAllowed : PermissionString.microphoneDisallowed),
                    trailing: Icon(mic ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: mic ? oGreen : oRed),
                    onTap: mic
                        ? null
                        : () async => await ref.read(permissionServiceProvider).requestMicrophonePermission(),
                  ),
                ListTile(
                  leading: const Icon(SuperIcons.mg_bell_ringing_line),
                  title: const Text('Notification').bold(),
                  subtitle: Text(not ? PermissionString.notificationAllowed : PermissionString.notificationDisallowed),
                  trailing: Icon(not ? SuperIcons.bx_check : SuperIcons.cl_warning_line, color: not ? oGreen : oRed),
                  onTap: not
                      ? null
                      : () async => await ref.read(permissionServiceProvider).requestNotificationPermission(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
