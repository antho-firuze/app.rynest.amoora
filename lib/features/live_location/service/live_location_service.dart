import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveLocationService {
  Ref ref;
  LiveLocationService(this.ref);

  Future saveLocation({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/maps/save_location').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future log({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/maps/log').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final liveLocationServiceProvider = Provider(LiveLocationService.new);
