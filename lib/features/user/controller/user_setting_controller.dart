import 'dart:developer';

import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allowMonitorLocationProvider = StateProvider<bool>((ref) => true);
final allowMonitorInArabOnlyProvider = StateProvider<bool>((ref) => false);

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

class UserSettingCtrl {
  Ref ref;
  UserSettingCtrl(this.ref);

  static const allowMonitorLocationKey = 'allowMonitorLocation';
  static const allowMonitorInArabOnlyKey = 'allowMonitorInArabOnly';
  static const themeModeKey = 'THEME_MODE_KEY';

  void initialize() async {
    log('Initialize User Settings !');

    ref.read(allowMonitorLocationProvider.notifier).state = getVal(allowMonitorLocationKey) ?? true;
    ref.read(allowMonitorInArabOnlyProvider.notifier).state = getVal(allowMonitorInArabOnlyKey) ?? false;
    ref.read(themeModeProvider.notifier).state =
        ThemeMode.values[ref.read(sharedPrefProvider).getInt(themeModeKey) ?? 1];

    ref.listen(allowMonitorLocationProvider, (previous, next) => saveVal(allowMonitorLocationKey, next));
    ref.listen(allowMonitorInArabOnlyProvider, (previous, next) => saveVal(allowMonitorInArabOnlyKey, next));
    ref.listen(themeModeProvider, (previous, next) {
      ref.read(sharedPrefProvider).setInt(themeModeKey, next.index);
    });
  }

  void saveVal(String key, bool value) => ref.read(sharedPrefProvider).setBool(key, value);

  bool? getVal(String key) => ref.read(sharedPrefProvider).getBool(key);
}

final userSettingCtrlProvider = Provider(UserSettingCtrl.new);
