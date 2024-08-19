import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductService {
  Ref ref;
  ProductService(this.ref);

  Future list({Map<String, dynamic>? data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/product/list').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future byId({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/product/byId').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final productServiceProvider = Provider(ProductService.new);
