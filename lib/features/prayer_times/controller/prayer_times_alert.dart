import 'dart:developer';

import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alertPrayerScheduleProvider = StateProvider<bool>((ref) => false);
final alertSubuhProvider = StateProvider<bool>((ref) => false);
final alertDzuhurProvider = StateProvider<bool>((ref) => false);
final alertAsharProvider = StateProvider<bool>((ref) => false);
final alertMaghribProvider = StateProvider<bool>((ref) => false);
final alertIsyaProvider = StateProvider<bool>((ref) => false);

class PrayerTimesAlert {
  final Ref ref;
  PrayerTimesAlert(this.ref);

  static const allowPrayerScheduleAlertKey = 'ALLOW_PRAYER_SCHEDULE_ALERT_KEY';
  static const allowSubuhAlertKey = 'ALLOW_SUBUH_ALERT_KEY';
  static const allowDzuhurAlertKey = 'ALLOW_DZUHUR_ALERT_KEY';
  static const allowAsharAlertKey = 'ALLOW_ASHAR_ALERT_KEY';
  static const allowMaghribAlertKey = 'ALLOW_MAGHRIB_ALERT_KEY';
  static const allowIsyaAlertKey = 'ALLOW_ISYA_ALERT_KEY';

  void saveVal(String key, bool value) => ref.read(sharedPrefProvider).setBool(key, value);

  bool? getVal(String key) => ref.read(sharedPrefProvider).getBool(key);

  void initialize() async {
    log('Initialize Prayer Times Alert !');
    // bool allowPermission =
    //     await ref.read(permissionServiceProvider).checkNotificationPermission();
    // bool allowAlert = _getVal(allowAlertKey) ?? false;

    // ref.read(allowAlertProvider.notifier).state = allowPermission && allowAlert;

    ref.read(alertPrayerScheduleProvider.notifier).state = getVal(allowPrayerScheduleAlertKey) ?? false;
    ref.read(alertSubuhProvider.notifier).state = getVal(allowSubuhAlertKey) ?? false;
    ref.read(alertDzuhurProvider.notifier).state = getVal(allowDzuhurAlertKey) ?? false;
    ref.read(alertAsharProvider.notifier).state = getVal(allowAsharAlertKey) ?? false;
    ref.read(alertMaghribProvider.notifier).state = getVal(allowMaghribAlertKey) ?? false;
    ref.read(alertIsyaProvider.notifier).state = getVal(allowIsyaAlertKey) ?? false;

    ref.listen(alertPrayerScheduleProvider, (previous, next) => saveVal(allowPrayerScheduleAlertKey, next));
    ref.listen(alertSubuhProvider, (previous, next) => saveVal(allowSubuhAlertKey, next));
    ref.listen(alertDzuhurProvider, (previous, next) => saveVal(allowDzuhurAlertKey, next));
    ref.listen(alertAsharProvider, (previous, next) => saveVal(allowAsharAlertKey, next));
    ref.listen(alertMaghribProvider, (previous, next) => saveVal(allowMaghribAlertKey, next));
    ref.listen(alertIsyaProvider, (previous, next) => saveVal(allowIsyaAlertKey, next));
  }

  void alertPrayerSchedule() =>
      ref.read(alertPrayerScheduleProvider.notifier).state = !ref.watch(alertPrayerScheduleProvider);

  void alertSubuh() => ref.read(alertSubuhProvider.notifier).state = !ref.watch(alertSubuhProvider);

  void alertDzuhur() => ref.read(alertDzuhurProvider.notifier).state = !ref.watch(alertDzuhurProvider);

  void alertAshar() => ref.read(alertAsharProvider.notifier).state = !ref.watch(alertAsharProvider);

  void alertMaghrib() => ref.read(alertMaghribProvider.notifier).state = !ref.watch(alertMaghribProvider);

  void alertIsya() => ref.read(alertIsyaProvider.notifier).state = !ref.watch(alertIsyaProvider);
}

final prayerTimesAlertProvider = Provider(PrayerTimesAlert.new);
