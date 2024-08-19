import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarouselService {
  Ref ref;
  CarouselService(this.ref);

  Future all({Map<String, dynamic>? data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/carousel/all').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final carouselServiceProvider = Provider(CarouselService.new);
