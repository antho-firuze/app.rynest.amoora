import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/controllers/permission_ctrl.dart';
import 'package:amoora/common/services/permission_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/notification/model/alert.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = "NOTIFICATION-CTRL";

final allowNotificationProvider = StateProvider<bool>((ref) => false);
final alertItineraryProvider = StateProvider<bool>((ref) => false);
final alertOutOfRangeProvider = StateProvider<bool>((ref) => false);
final alertLiveStreamingProvider = StateProvider<bool>((ref) => false);
final alertNewMessageProvider = StateProvider<bool>((ref) => false);
final notificationsProvider = StateProvider<List<Alert>>((ref) => []);

final notificationStreamProvider = StreamProvider<SseMessage?>((ref) async* {
  final url = Uri.parse(AppBase.broadcastStreamUrl).toString();
  final data = {
    "stream_type": "notification",
  };
  Response<ResponseBody>? response = await ref.read(dioStreamProvider).get(url, data: FormData.fromMap(data));

  // Transform stream value Uint8List to SseMessage
  yield* response.data!.stream
      .transform(uInt8Transformer)
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .transform(const SseTransformer());
});

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

    if (ref.read(authUserProvider) != null) {
      log('listenForNotification | listen', name: _kLogName);
      // await _notificationListener();
    }

    ref.listen(authUserProvider, (previous, next) async {
      if (next == null) {
        log('listenForNotification | close', name: _kLogName);
        _notificationSubs?.close();
        _notificationSubs = null;
      } else {
        log('listenForNotification | listen', name: _kLogName);
        // await _notificationListener();
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

  // Future _notificationListener() async {
  //   _notificationSubs = ref.listen(notificationSvcProvider, (previous, next) async {
  //     if (next.value.data.isEmpty) {
  //       return;
  //     }

  //     List<dynamic> jsonList = jsonDecode(next.value.data);
  //     if (jsonList.isEmpty) {
  //       ref.read(notificationsProvider.notifier).state = [];
  //     } else {
  //       List<Alert> datas = jsonList.map((json) => Alert.fromJson(json)).toList();
  //       ref.read(notificationsProvider.notifier).state = datas;
  //     }
  //   });
  // }

  Future create([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/notification/create').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future update([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/notification/update').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future delete([Map<String, dynamic>? data]) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/notification/delete').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final notificationCtrlProvider = Provider(NotificationCtrl.new);
