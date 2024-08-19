import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/features/notification/model/alert.dart';
import 'package:amoora/features/notification/service/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alertItineraryProvider = StateProvider<bool>((ref) => false);
final alertOutOfRangeProvider = StateProvider<bool>((ref) => false);
final alertLiveStreamingProvider = StateProvider<bool>((ref) => false);
final alertNewMessageProvider = StateProvider<bool>((ref) => false);
final notificationsProvider = StateProvider<List<Alert>>((ref) => []);

class NotificationCtrl {
  final Ref ref;
  NotificationCtrl(this.ref);

  static const allowAlertKey = 'ALLOW_ALERT_KEY';
  static const allowItineraryAlertKey = 'ALLOW_ITINERARY_ALERT_KEY';
  static const allowOutOfRangeAlertKey = 'ALLOW_OUT_OF_RANGE_ALERT_KEY';
  static const allowLiveStreamingAlertKey = 'ALLOW_LIVE_STREAMING_ALERT_KEY';
  static const allowNewMessageAlertKey = 'ALLOW_NEW_MESSAGE_ALERT_KEY';

  ProviderSubscription? _notificationSubs;

  get goSettingPage => null;

  void initialize() async {
    log('Initialize Notification !');

    bool allowPermission = await ref.read(permissionServiceProvider).checkNotificationPermission();
    bool allowAlert = getVal(allowAlertKey) ?? false;
    ref.read(allowAlertProvider.notifier).state = allowPermission && allowAlert;

    ref.read(alertItineraryProvider.notifier).state = getVal(allowItineraryAlertKey) ?? false;
    ref.read(alertOutOfRangeProvider.notifier).state = getVal(allowOutOfRangeAlertKey) ?? false;
    ref.read(alertLiveStreamingProvider.notifier).state = getVal(allowLiveStreamingAlertKey) ?? false;
    ref.read(alertNewMessageProvider.notifier).state = getVal(allowNewMessageAlertKey) ?? false;

    ref.listen(allowAlertProvider, (previous, next) => saveVal(allowAlertKey, next));
    ref.listen(alertItineraryProvider, (previous, next) => saveVal(allowItineraryAlertKey, next));
    ref.listen(alertOutOfRangeProvider, (previous, next) => saveVal(allowOutOfRangeAlertKey, next));
    ref.listen(alertLiveStreamingProvider, (previous, next) => saveVal(allowLiveStreamingAlertKey, next));
    ref.listen(alertNewMessageProvider, (previous, next) => saveVal(allowNewMessageAlertKey, next));

    if (ref.read(authUserProvider) != null) {
      log('listenForNotification | listen', name: 'notification');
      await _notificationListener();
    }

    ref.listen(authUserProvider, (previous, next) async {
      if (next == null) {
        log('listenForNotification | close', name: 'notification');
        _notificationSubs?.close();
        _notificationSubs = null;
      } else {
        log('listenForNotification | listen', name: 'notification');
        await _notificationListener();
      }
    });
  }

  void saveVal(String key, bool value) => ref.read(sharedPrefProvider).setBool(key, value);

  bool? getVal(String key) => ref.read(sharedPrefProvider).getBool(key);

  void allowAlertToggle() => ref.read(allowAlertProvider.notifier).state = !ref.watch(allowAlertProvider);

  void alertItinerary() => ref.read(alertItineraryProvider.notifier).state = !ref.watch(alertItineraryProvider);

  void alertOutOfRange() => ref.read(alertOutOfRangeProvider.notifier).state = !ref.watch(alertOutOfRangeProvider);

  void alertLiveStreaming() =>
      ref.read(alertLiveStreamingProvider.notifier).state = !ref.watch(alertLiveStreamingProvider);

  void alertNewMessage() => ref.read(alertNewMessageProvider.notifier).state = !ref.watch(alertNewMessageProvider);

  Future _notificationListener() async {
    _notificationSubs = ref.listen(notificationSvcProvider, (previous, next) async {
      if (next.value.data.isEmpty) {
        return;
      }

      List<dynamic> jsonList = jsonDecode(next.value.data);
      if (jsonList.isEmpty) {
        ref.read(notificationsProvider.notifier).state = [];
      } else {
        List<Alert> datas = jsonList.map((json) => Alert.fromJson(json)).toList();
        ref.read(notificationsProvider.notifier).state = datas;
      }
    });
  }
}

final notificationCtrlProvider = Provider(NotificationCtrl.new);
