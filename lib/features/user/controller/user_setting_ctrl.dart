import 'dart:developer';

import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TrackingMyLocation { allowed, notAllowed, onlyInSaudiArabia }

final trackingLocationProvider = StateProvider<TrackingMyLocation>((ref) => TrackingMyLocation.allowed);

class UserSettingCtrl {
  Ref ref;
  UserSettingCtrl(this.ref);

  static const allowMonitorLocationKey = 'allowMonitorLocation';
  static const allowMonitorInArabOnlyKey = 'allowMonitorInArabOnly';
  static const _trackingLocationKey = 'TRACKING_MY_LOCATION_KEY';
  static const _themeModeKey = 'THEME_MODE_KEY';

  void initialize() async {
    log('Initialize User Settings !');

    loadSettings();

    ref.listen(trackingLocationProvider,
        (previous, next) => ref.read(sharedPrefProvider).setInt(_trackingLocationKey, next.index));

    ref.listen(themeModeProvider, (previous, next) => ref.read(sharedPrefProvider).setInt(_themeModeKey, next.index));
  }

  void loadSettings() {
    ref.read(trackingLocationProvider.notifier).state =
        TrackingMyLocation.values[ref.read(sharedPrefProvider).getInt(_trackingLocationKey) ?? 0];

    ref.read(themeModeProvider.notifier).state =
        ThemeMode.values[ref.read(sharedPrefProvider).getInt(_themeModeKey) ?? 0];
  }
}

final userSettingCtrlProvider = Provider(UserSettingCtrl.new);
