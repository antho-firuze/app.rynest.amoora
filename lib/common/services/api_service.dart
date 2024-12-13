import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Ref ref;
  ApiService(this.ref);

  Future call({required Reqs reqs}) async {
    final dio = ref.read(dioApiProvider);

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    FormData? formData;
    // Check if any files to be upload
    if (reqs.filePath != null) {
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      Map<String, dynamic> payload = reqs.data ?? {};
      payload[reqs.fileKey] = await MultipartFile.fromFile(reqs.filePath!);
      formData = FormData.fromMap(payload);
    }

    final state = await AsyncValue.guard(() async => await dio.post(url, data: formData ?? reqs.data));
    return state.value?.data;
  }

  Future get({required Reqs reqs}) async {
    final dio = ref.read(dioProvider);

    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    final state = await AsyncValue.guard(() async => await dio.get(url));
    return state.value?.data;
  }
}

final apiServiceProvider = Provider(ApiService.new);
