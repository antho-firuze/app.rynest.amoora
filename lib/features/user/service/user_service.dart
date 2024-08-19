import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  final Ref ref;
  UserService(this.ref);

  Future getProfile() async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/user/profile').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url));

    return state.value?.data;
  }

  Future uploadPhoto({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/user/upload_photo').toString();
    final state = await AsyncValue.guard(
        () async => await ref.read(dioApiFileUploadProvider).post(url, data: FormData.fromMap(data)));

    return state.value?.data;
  }

  Future updateProfile({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/user/update_profile').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final userServiceProvider = Provider(UserService.new);
