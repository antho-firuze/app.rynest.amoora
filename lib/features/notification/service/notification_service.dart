import 'dart:convert';

import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class NotificationService {
  Ref ref;
  NotificationService(this.ref);

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

final notificationSvcProvider = Provider(NotificationService.new);
