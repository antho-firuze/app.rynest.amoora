import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
import 'package:amoora/common/exceptions/data_exeception_layout.dart';
import 'package:amoora/common/services/version_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/auth/model/jwt_token.dart';
import 'package:amoora/features/live_location/controller/live_location_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/broadcast_ctrl.dart';
import 'package:amoora/features/notification/controller/notification_ctrl.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_alert.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/user/controller/profile_ctrl.dart';
import 'package:amoora/features/user/controller/user_setting_ctrl.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;

  final bool _showWalkThrough;

  void initializeApps() async {
    // Check New Version
    ref.read(isConnectedFutureProvider.future).then((value) async {
      if (value == true) {
        log('Check New Version => Executed !', name: 'INIT-CTRL');
        bool result = await ref.read(versionServiceProvider).newVersionAvailable().onError((error, stackTrace) {
          final errType = ref.read(exceptionProvider(error));
          log('ERROR : ${errType.title}', name: 'INIT-CTRL');
          return false;
        });
        if (result) return;
      } else {
        log('Check New Version => Not Executed !', name: 'INIT-CTRL');
      }
    });

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

    // Initialized Prayers
    ref.read(prayersCtrlProvider).initialize();

    // Initialized Quran
    // ref.read(quranCtrlProvider).initialize();
    ref.read(quranCtrlProvider).initialize();

    // Initialize Broadcast
    // for presenter  => broadcast audio streaming
    // for audience   => received/listen audio streaming (from presenter)
    ref.read(broadcastCtrlProvider).initialize();

    // Initialize Live Location
    // for muthowwif  => monitoring jamaah
    // for jamaah     => push coordinate
    ref.read(liveLocationCtrlProvider).initialize();

    // Check Is Token Expired
    if (ref.read(authTokenProvider) != null) {
      log("initialize => check token ?", name: "INITIALIZE-CTRL");
      if (ref.read(authTokenProvider)!.hasExpired()) {
        log("initialize => token has expired", name: "INITIALIZE-CTRL");
        await ref.read(authCtrlProvider).signOut(silence: true);
      } else {
        log("initialize => token still valid", name: "INITIALIZE-CTRL");
      }
    } else {
      log("initialize => token is null", name: "INITIALIZE-CTRL");
      await ref.read(authCtrlProvider).signOut(silence: true);
    }

    // Goto Next Route
    if (_showWalkThrough) {
      ref.read(goRouterProvider).go('/walkthrough');
    } else {
      ref.read(goRouterProvider).go('/home');
    }
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
