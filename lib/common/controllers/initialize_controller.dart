import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/controllers/package_info_ctrl.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/live_location/controller/live_location_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/broadcast_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/signaling_ctrl.dart';
import 'package:amoora/features/notification/controller/notification_ctrl.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_alert.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/quran/controller/quran_controller.dart';
import 'package:amoora/features/user/controller/profile_ctrl.dart';
import 'package:amoora/features/user/controller/user_setting_ctrl.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitializeCtrl {
  final Ref ref;

  InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;

  final bool _showWalkThrough;

  void initializeApps() async {
    // Get Device Info
    // await ref.read(deviceServiceProvider).getDeviceInfo();

    // Initialize Package Info
    ref.read(packageInfoCtrlProvider).initialize();

    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Initialize Location/GPS
    await ref.read(locationCtrlProvider).initialize();

    // Check User login & token
    ref.read(authCtrlProvider).initialize();

    // Initialize User Settings
    ref.read(userSettingCtrlProvider).initialize();

    // Initialize Profile
    await ref.read(profileCtrlProvider).initialize();

    // Initialize Prayer Times
    ref.read(prayerTimesCtrlProvider).initialize();

    // Initialize Prayers Time Alert
    ref.read(prayerTimesAlertProvider).initialize();

    // Initialize Notifications
    ref.read(notificationCtrlProvider).initialize();

    // Initialized Quran
    ref.read(quranCtrlProvider).initialize();

    // Initialize Broadcast 
    // for presenter  => broadcast audio streaming
    // for audience   => received/listen audio streaming (from presenter)
    ref.read(broadcastCtrlProvider).initialize();

    // Initialize Live Location
    // for muthowwif  => monitoring jamaah
    // for jamaah     => push coordinate
    ref.read(liveLocationCtrlProvider).initialize();

    // Goto Next Route
    if (_showWalkThrough) {
      ref.read(goRouterProvider).go('/walkthrough');
    } else {
      ref.read(goRouterProvider).go('/home');
    }
  }
}

final initCtrlProvider = Provider(InitializeCtrl.new);
