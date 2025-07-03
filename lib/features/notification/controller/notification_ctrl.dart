import 'dart:async';
import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/common/services/sse_service2.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/notification/model/alert.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = "NOTIFICATION-CTRL";

final allowNotificationProvider = StateProvider<bool>((ref) => false);
final alertItineraryProvider = StateProvider<bool>((ref) => false);
final alertOutOfRangeProvider = StateProvider<bool>((ref) => false);
final alertLiveStreamingProvider = StateProvider<bool>((ref) => false);
final alertNewMessageProvider = StateProvider<bool>((ref) => false);
// final notificationsProvider = StateProvider<List<Alert>>((ref) => []);
final notificationCountProvider = StateProvider<int>((ref) => 0);

// Count notification
final notificationCountListenerProvider = StreamProvider<int>((ref) async* {
  final url = Uri.parse(AppBase.sseUrl).replace(path: "/sse/get_notification_count", queryParameters: {
    "user_id": "${ref.read(authUserProvider)?.id}",
  });
  final sse = SSEService2(url: "$url");

  await sse.connect();

  final stream = sse.getStream;
  final data = stream.transform(_alertCountTransformer);
  data.listen((event) {
    log("notificationCountListenerProvider : $event", name: _kLogName);
    ref.read(notificationCountProvider.notifier).state = event;
  });
});

// Fetch notification list
final fetchNotificationsProvider = FutureProvider<List<Alert>?>((ref) async {
  // TODO: fetchNotificationsProvider
  return ;
});

// Transform SseMessage to number
StreamTransformer<SseMessage, int> _alertCountTransformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    try {
      if (data.data.isEmpty) {
        sink.add(0);
      } else {
        int count = data.data.toInt();
        sink.add(count);
      }
    } catch (e, st) {
      log('Error', error: e, stackTrace: st, name: _kLogName);
    }
  },
);

class NotificationCtrl {
  final Ref ref;
  NotificationCtrl(this.ref);

  static const allowAlertKey = 'ALLOW_ALERT_KEY';
  static const allowItineraryAlertKey = 'ALLOW_ITINERARY_ALERT_KEY';
  static const allowOutOfRangeAlertKey = 'ALLOW_OUT_OF_RANGE_ALERT_KEY';
  static const allowLiveStreamingAlertKey = 'ALLOW_LIVE_STREAMING_ALERT_KEY';
  static const allowNewMessageAlertKey = 'ALLOW_NEW_MESSAGE_ALERT_KEY';

  get goSettingPage => null;

  void initialize() async {
    log('Initialize Notification !');

    ref.read(notificationCountListenerProvider);

    bool allowPermission = await ref.read(permissionServiceProvider).checkNotificationPermission();
    ref.read(allowNotificationProvider.notifier).state = allowPermission;
    // bool allowAlert = getVal(allowAlertKey) ?? false;
    // ref.read(allowAlertProvider.notifier).state = allowPermission && allowAlert;

    ref.read(alertItineraryProvider.notifier).state = getVal(allowItineraryAlertKey) ?? false;
    ref.read(alertOutOfRangeProvider.notifier).state = getVal(allowOutOfRangeAlertKey) ?? false;
    ref.read(alertLiveStreamingProvider.notifier).state = getVal(allowLiveStreamingAlertKey) ?? false;
    ref.read(alertNewMessageProvider.notifier).state = getVal(allowNewMessageAlertKey) ?? false;

    ref.listen(allowAlertProvider, (previous, next) => saveVal(allowAlertKey, next));
    ref.listen(alertItineraryProvider, (previous, next) => saveVal(allowItineraryAlertKey, next));
    ref.listen(alertOutOfRangeProvider, (previous, next) => saveVal(allowOutOfRangeAlertKey, next));
    ref.listen(alertLiveStreamingProvider, (previous, next) => saveVal(allowLiveStreamingAlertKey, next));
    ref.listen(alertNewMessageProvider, (previous, next) => saveVal(allowNewMessageAlertKey, next));

    ref.listen(authUserProvider, (previous, next) async {
      ref.refresh(notificationCountListenerProvider);
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

  Future create([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/create').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioJWTTokenProvider(true)).post(url, data: data));

    return state.value?.data;
  }

  Future update([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/update').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioJWTTokenProvider(true)).post(url, data: data));

    return state.value?.data;
  }

  Future delete([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/delete').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioJWTTokenProvider(true)).post(url, data: data));

    return state.value?.data;
  }
}

final notificationCtrlProvider = Provider(NotificationCtrl.new);
