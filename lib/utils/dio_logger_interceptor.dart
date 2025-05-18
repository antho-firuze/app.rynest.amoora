import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/services/snackbar_service.dart';
import 'package:dio/dio.dart';

class DioLoggerInterceptor implements Interceptor {
  final stopwatches = <String, Stopwatch>{};

  final _kLogName = 'DIO-LOGGER';
  final showLog = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = '${options.baseUrl}${options.path}';
    stopwatches[url] = Stopwatch()..start();
    if (showLog) log('🌍 Making request: $url', name: _kLogName);
    if (options.data != null) {
      if (showLog) log('🌍 Data request:', name: _kLogName);
      if (options.data is FormData) {
        if (showLog) log("FormData : ${options.data}", name: _kLogName);
      } else {
        final obj = const JsonEncoder.withIndent('  ').convert(options.data);
        if (showLog) log("Json : $obj", name: _kLogName);
      }
    }
    if (options.queryParameters.isNotEmpty) {
      final params = const JsonEncoder.withIndent(' ').convert(options.queryParameters);
      if (showLog) log('🌍 Params request:', name: _kLogName);
      if (showLog) log(params, name: _kLogName);
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final url = '${err.requestOptions.uri}';
    _logMessageAndClearStopwatch(null, url, '❌ Received error');
    // if (showLog) log('❌ ${err.stackTrace}', name: _kLogName);
    // if (err.response?.data != null) {
    //   if (showLog) log('❌ Response Error: ${err.response?.data}', name: _kLogName);
    //   final errCode = err.response?.data['code'] == null ? '' : "[${err.response?.data['code']}]";
    //   final errMessage = err.response?.data['message'];
    //   final message = "$errCode $errMessage";
    //   SnackBarService.show(message: message);
    // }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    _logMessageAndClearStopwatch(response.statusCode, url, '⬅️ Received response');
    // if (response.data != null) {
    //   final obj = const JsonEncoder.withIndent('  ').convert(response.data);
    //   if (showLog) log('🌍 Data response:\n $obj', name: _kLogName);
    // }
    if (showLog) log('-------------------------', name: _kLogName);
    return handler.next(response);
  }

  void _logMessageAndClearStopwatch(int? statusCode, String url, String message) {
    final stopwatch = stopwatches[url];
    if (stopwatch != null) {
      stopwatch.stop();
      _logResponse(statusCode, stopwatch.elapsedMilliseconds, url, message);
      if (stopwatch.elapsed > const Duration(seconds: 7)) {
        if (showLog) log('❌ Connection Timed Out', name: _kLogName);
        SnackBarService.show(message: '❌ Seems that the server is busy, please try again later !');
      }
      stopwatches.remove(url);
    } else {
      if (showLog) log(message, name: _kLogName);
    }
  }

  void _logResponse(int? statusCode, int milliseconds, String url, String message) {
    final emoji =
        switch (statusCode) { != null && >= 200 && < 300 => '✅', != null && >= 300 && < 400 => '🟠', _ => '❌' };
    if (showLog) log(message, name: _kLogName);
    if (statusCode != null) {
      if (showLog) log('$emoji $statusCode $emoji | ${milliseconds}ms | $url', name: _kLogName);
    } else {
      if (showLog) log('$emoji | ${milliseconds}ms | $url', name: _kLogName);
    }
  }
}
