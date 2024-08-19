import 'package:amoora/core/app_base.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/utils/dio_service.dart';

class AuthService {
  final Ref ref;
  AuthService(this.ref);

  Future signUp({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/signup').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future signIn({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/signin').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future sendCode({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/send_code').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future sendVerificationCode({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/send_verification_code').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future confirmVerificationCode({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/confirm_verification_code').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future resetPwd({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/reset_pwd').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future changePwd({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/change_pwd').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future refreshToken() async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/refresh_token').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioProvider).post(
          url,
          options: ref.read(dioOptionRefreshTokenProvider),
        ));

    return state.value?.data;
  }

  Future closingAccount({required Map<String, dynamic> data}) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/auth/closing_account').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final authServiceProvider = Provider(AuthService.new);
