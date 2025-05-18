import 'dart:developer';
import 'dart:io';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/loading_service.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_logger_interceptor.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Ref ref;
  ApiService(this.ref);

  final _kLogName = 'API-SERVICE';

  Future call({required Reqs reqs, bool showBusy = false, bool showError = false, bool showLog = false}) async {
    final dio = ref.read(dioApiProvider);

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    FormData? formData;
    // Check if any files to be upload
    if (reqs.filePath != null) {
      if (showLog) log("Adding file : {${reqs.fileKey} : ${reqs.filePath}}", name: _kLogName);
      
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      Map<String, dynamic> payload = {}..addAll(reqs.data ?? {});
      payload[reqs.fileKey] = await MultipartFile.fromFile(reqs.filePath!);
      formData = FormData.fromMap(payload);
    }

    if (showBusy) LoadingService.show();
    final state = await AsyncValue.guard(() async => await dio.post(url, data: formData ?? reqs.data));
    if (showBusy) LoadingService.dissmiss();

    if (state.hasError) {
      final errDio = state.error as DioException;
      String errMessage = '';
      if (errDio.response?.data != null) {
        errMessage = errDio.response?.data['message'];
      } else {
        errMessage = errDio.message ?? '';
      }
      final errCode = errDio.response?.statusCode;

      if (showLog) log("[$errCode] $errMessage", name: _kLogName);
      if (showError) {
        SnackBarService.show(message: "[$errCode] $errMessage");
      }
    }

    if (state.value?.data == null) {
      if (showLog) log("Data response: null", name: _kLogName);
    }

    return state.value?.data;
  }

  Future fetch({required Reqs reqs, bool showLog = false}) async {
    final dio = ref.read(dioApiProvider);

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    FormData? formData;
    // Check if any files to be upload
    if (reqs.filePath != null) {
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      Map<String, dynamic> payload = {}..addAll(reqs.data ?? {});
      payload[reqs.fileKey] = await MultipartFile.fromFile(reqs.filePath!);
      formData = FormData.fromMap(payload);
    }

    final state = await AsyncValue.guard(() async => await dio.post(url, data: formData ?? reqs.data));

    if (state.hasError) {
      final errDio = state.error as DioException;
      String errMessage = '';
      if (errDio.response?.data != null) {
        errMessage = errDio.response?.data['message'];
      } else {
        errMessage = errDio.message ?? '';
      }
      final errCode = errDio.response?.statusCode;

      if (showLog) log("[$errCode] $errMessage", name: _kLogName);
    }

    if (state.value?.data == null) {
      if (showLog) log("Data response: null", name: _kLogName);
    }

    return state.value?.data;
  }

  Future get({required Reqs reqs, bool showLog = false}) async {
    final dio = ref.read(dioProvider);

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    final state = await AsyncValue.guard(() async => await dio.get(url));

    if (state.hasError) {
      final errDio = state.error as DioException;
      String errMessage = '';
      if (errDio.response?.data != null) {
        errMessage = errDio.response?.data['message'];
      } else {
        errMessage = errDio.message ?? '';
      }
      final errCode = errDio.response?.statusCode;

      if (showLog) log("[$errCode] $errMessage", name: _kLogName);
      SnackBarService.show(message: "[$errCode] $errMessage");
    }

    if (state.value?.data == null) {
      if (showLog) log("Data response: null", name: _kLogName);
    }

    return state.value?.data;
  }

  Future refreshToken({required Reqs reqs, String? refreshToken, bool showLog = false}) async {
    final dio = ref.read(dioProvider);

    dio.interceptors.add(DioLoggerInterceptor());

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    final options = Options(headers: {HttpHeaders.authorizationHeader: "Bearer $refreshToken"});
    final state = await AsyncValue.guard(() async => await dio.post(url, options: options));

    if (state.hasError) {
      final errDio = state.error as DioException;
      String errMessage = '';
      if (errDio.response?.data != null) {
        errMessage = errDio.response?.data['message'];
      } else {
        errMessage = errDio.message ?? '';
      }
      final errCode = errDio.response?.statusCode;

      if (showLog) log("[$errCode] $errMessage", name: _kLogName);
      SnackBarService.show(message: "[$errCode] $errMessage");
    }

    if (state.value?.data == null) {
      if (showLog) log("Data response: null", name: _kLogName);
    }

    return state.value?.data;
  }
}

final apiServiceProvider = Provider(ApiService.new);
