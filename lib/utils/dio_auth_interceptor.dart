import 'dart:developer';
import 'dart:io';

import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/auth/model/jwt_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioAuthInterceptor implements Interceptor {
  final Ref ref;
  DioAuthInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    JwtToken? token = ref.read(authTokenProvider);
    if (token != null) {
      log("check the token", name: "DIO");
      if (token.refreshToken != null && token.hasExpired()) {
        log("token has expired", name: "DIO");
        token = await ref.read(authCtrlProvider).refreshToken();
      }
      
      log("token : ${token?.accessToken}", name: "DIO");

      options.headers.putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer ${token?.accessToken}");
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
