import 'dart:convert';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamService {
  Ref ref;
  StreamService(this.ref);

  Future<Stream<SseMessage>?> call({required Reqs reqs}) async {
    final dio = ref.read(dioStreamProvider);

    final url = Uri.parse(reqs.url ?? AppBase.broadcastStreamUrl)
        .replace(path: reqs.path, queryParameters: reqs.queryParameters)
        .toString();

    FormData? formData = reqs.data != null ? FormData.fromMap(reqs.data!) : null;

    Response<ResponseBody>? response = await dio.get(url, data: formData);
    
    // Transform stream value Uint8List to SseMessage
    return response.data!.stream
        .transform(uInt8Transformer)
        .transform(const Utf8Decoder())
        .transform(const LineSplitter())
        .transform(const SseTransformer());
  }
}

final streamServiceProvider = Provider(StreamService.new);
