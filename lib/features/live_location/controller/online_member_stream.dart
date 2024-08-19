import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/features/live_location/controller/live_maps_controller.dart';
import 'package:amoora/features/live_location/model/member.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnlineMemberStream {
  Ref ref;
  OnlineMemberStream(this.ref);

  Stream<SseMessage>? streamData;
  StreamSubscription<SseMessage>? streamSubs;

  void initialize() async {
    log('Initialize Online Member Stream!');
    if (ref.read(authUserProvider)?.roleId == 2) {
      await startStream();
    }

    ref.listen(authUserProvider, (previous, next) async {
      if (next == null) {
        closeStream();
      } else {
        if (next.roleId == 2 || next.roleId == 99) {
          await startStream();
        } else {
          closeStream();
        }
      }
    });
  }

  Future<Stream<SseMessage>?> _fetchStream() async {
    try {
      final url = Uri.parse(AppBase.broadcastStreamUrl).toString();
      final data = {
        "stream_type": "online_member",
      };
      Response<ResponseBody>? response = await ref.read(dioStreamProvider).get(url, data: FormData.fromMap(data));
      
      // Transform stream value Uint8List to SseMessage
      return response.data?.stream
          .transform(uInt8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .transform(const SseTransformer());

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future startStream() async {
    log(':: online_member_stream => start');

    streamSubs = (await _fetchStream())!.listen((event) {
      log("Event: ${event.id}, ${event.event}, ${event.retry}, ${event.data}");

      if (event.data.isEmpty) {
        return;
      }

      List<dynamic> jsonList = jsonDecode(event.data);
      if (jsonList.isEmpty) {
        // log('empty => $jsonList');
        ref.read(onlineMemberProvider.notifier).state = [];
      } else {
        List<Member> datas = jsonList.map((json) => Member.fromJson(json)).toList();
        // log('total online: ${datas.length}');
        ref.read(onlineMemberProvider.notifier).state = datas;
      }
    });
  }

  void closeStream() {
    streamSubs?.cancel();
    streamSubs == null;
    ref.read(onlineMemberProvider.notifier).state = [];
    log(':: online_member_stream => closed');
  }
}

final onlineMemberStreamProvider = Provider(OnlineMemberStream.new);
