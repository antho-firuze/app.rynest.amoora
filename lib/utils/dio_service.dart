import 'package:amoora/utils/dio_auth_interceptor.dart';
import 'package:amoora/utils/dio_busy_interceptor.dart';
import 'package:amoora/utils/dio_download_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:amoora/utils/dio_logger_interceptor.dart';

final busyProvider = StateProvider<bool>((ref) => false);

final dioProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  dio.options.connectTimeout = const Duration(seconds: 60);

  dio.interceptors.add(DioLoggerInterceptor());
  return dio;
});

final dioApiProvider = Provider.autoDispose((ref) {
  final dio = ref.read(dioProvider);

  dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

  dio.interceptors.add(DioAuthInterceptor(ref));
  return dio;
});

final dioApiFileUploadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.options.connectTimeout = const Duration(seconds: 60);

  dio.interceptors.add(DioLoggerInterceptor());
  dio.interceptors.add(DioBusyInterceptor(ref));
  dio.interceptors.add(DioAuthInterceptor(ref));

  dio.options.headers['Content-Type'] = 'multipart/form-data';

  return dio;
});

final dioFileDownloadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  dio.interceptors.add(DioDownloadInterceptor());
  dio.options.responseType = ResponseType.bytes;
  dio.options.followRedirects = false;
  dio.options.validateStatus = (status) => status! < 500;

  return dio;
});

// final dioOptionBytesProvider = Provider((ref) {
//   return Options(
//     responseType: ResponseType.bytes,
//     followRedirects: false,
//     validateStatus: (status) => status! < 500,
//   );
// });

final dioStreamProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);

  dio.interceptors.add(DioLoggerInterceptor());
  dio.interceptors.add(DioAuthInterceptor(ref));

  dio.options.headers['Cache-Control'] = 'no-cache';
  dio.options.headers['Accept'] = 'text/event-stream';
  dio.options.headers['Content-Type'] = 'text/event-stream';
  dio.options.responseType = ResponseType.stream;
  return dio;
});
