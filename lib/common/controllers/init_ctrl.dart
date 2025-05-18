import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/network_ctrl.dart';
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

  final _kLogName = 'INIT-CTRL';

  final bool _showWalkThrough;

  void initializeApps() async {
    // Check New Version
    ref.read(isConnectedFutureProvider.future).then((value) async {
      if (value == true) {
        bool result = await ref.read(versionServiceProvider).newVersionAvailable().onError((error, stackTrace) {
          // final errType = ref.read(exceptionProvider(error));
          // log('ERROR : ${errType.title}', name: 'INIT-CTRL');
          return false;
        });
        if (result) return;
      } else {
        log('Check new version not executed !', name: _kLogName);
      }
    });

    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Initialize Location/GPS
    await ref.read(locationCtrlProvider).initialize();

    // Initialize Notifications
    ref.read(notificationCtrlProvider).initialize();

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
    log("Check token ?", name: _kLogName);
    var token = ref.read(authTokenProvider);
    if (token != null) {
      if (token.hasExpired()) {
        log("Token has expired", name: _kLogName);
        log("Request refresh token", name: _kLogName);
        token = await ref.read(authCtrlProvider).refreshToken();
        if (token == null) {
          log("Refresh token has expired too, need re-sign in again", name: _kLogName);
          await ref.read(authCtrlProvider).signOut(silence: true);
        } else {
          log("New token : $token", name: _kLogName);
        }
      } else {
        log("Token still valid", name: _kLogName);
      }
    } else {
      log("Token is null, need sign in", name: _kLogName);
      await ref.read(authCtrlProvider).signOut(silence: true);
    }

    // Goto Next Route
    if (_showWalkThrough) {
      log("Goto => /walkthrough");
      ref.read(goRouterProvider).go('/walkthrough');
    } else {
      log("Goto => /home");
      ref.read(goRouterProvider).go('/home');
    }
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
