import 'dart:async';
import 'dart:convert';

import 'package:amoora/core/app_base.dart';
import 'package:amoora/env/env.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:amoora/utils/sse_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// COMMON SECTION
enum Server { google, meteredCA, twilio, rynest36 }

final serverName = <Server, String>{
  Server.google: "https://www.google.com/",
  Server.meteredCA: "https://www.metered.ca/",
  Server.twilio: "https://www.twilio.com/",
  Server.rynest36: "Rynest-202.73.24.36",
};

// AUDIENCE SECTION
final onlineHostStreamProvider = StreamProvider<SseMessage?>((ref) async* {
  final url = Uri.parse(AppBase.broadcastStreamUrl).toString();
  final data = {
    "stream_type": "online_host",
  };
  Response<ResponseBody>? response = await ref.read(dioStreamProvider).get(url, data: FormData.fromMap(data));

  // Transform stream value Uint8List to SseMessage
  yield* response.data!.stream
      .transform(uInt8Transformer)
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .transform(const SseTransformer());
});

final audienceStreamProvider = StreamProvider.family<SseMessage?, int>((ref, audienceId) async* {
  final url = Uri.parse(AppBase.broadcastStreamUrl).toString();
  final data = {
    "stream_type": "audience",
    "id": audienceId,
  };
  Response<ResponseBody>? response = await ref.read(dioStreamProvider).get(url, data: FormData.fromMap(data));

  // Transform stream value Uint8List to SseMessage
  yield* response.data!.stream
      .transform(uInt8Transformer)
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .transform(const SseTransformer());
});

// PRESENTER SECTION
final onlineParticipantStreamProvider = StreamProvider.family<SseMessage?, int>((ref, presenterId) async* {
  final url = Uri.parse(AppBase.broadcastStreamUrl).toString();
  final data = {
    "stream_type": "participant",
    "presenter_id": presenterId,
  };
  Response<ResponseBody>? response = await ref.read(dioStreamProvider).get(url, data: FormData.fromMap(data));

  // Transform stream value Uint8List to SseMessage
  yield* response.data!.stream
      .transform(uInt8Transformer)
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .transform(const SseTransformer());
});

class SignalingSvc {
  Ref ref;
  SignalingSvc(this.ref);

  Future<Map<String, dynamic>> fetchConfiguration(Server server) async {
    try {
      Map<String, dynamic> configuration = {};
      switch (server) {
        case Server.google:
          configuration['ice_servers'] = [
            {"url": "stun:stun3.l.google.com:19302", "urls": "stun:stun3.l.google.com:19302"},
          ];
          break;
        case Server.meteredCA:
          final data = {"apiKey": Env.meteredCaApiKey};
          final state = await AsyncValue.guard(() async => await _fetchConfigurationFromMetered(data));

          configuration['ice_servers'] = state.value;
          break;
        case Server.twilio:
          final state = await AsyncValue.guard(() async => await _fetchConfigurationFromTwilio());

          configuration = state.value;
          break;
        case Server.rynest36:
          final serverRynest = Env.rynesTurnUrl;
          final username = Env.rynestUsername;
          final password = Env.rynestPassword;
          configuration['ice_servers'] = [
            {"url": "stun:$serverRynest", "urls": "stun:$serverRynest"},
            {
              "url": "turn:$serverRynest",
              "urls": "turn:$serverRynest",
              "username": username,
              "credential": password,
            },
            {
              "url": "turn:$serverRynest?transport=udp",
              "urls": "turn:$serverRynest?transport=udp",
              "username": username,
              "credential": password,
            },
            {
              "url": "turn:$serverRynest?transport=tcp",
              "urls": "turn:$serverRynest?transport=tcp",
              "username": username,
              "credential": password,
            },
          ];
          break;
      }

      configuration['iceTransportPolicy'] = 'all';
      configuration['sdpSemantics'] = 'unified-plan';

      return configuration;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future _fetchConfigurationFromMetered([Map<String, dynamic>? data]) async {
    final url = Uri.parse("https://rynest.metered.live").replace(path: '/api/v1/turn/credentials').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioProvider).get(url, queryParameters: data));

    return state.value?.data;
  }

  Future _fetchConfigurationFromTwilio([Map<String, dynamic>? data]) async {
    final url = Uri.parse("https://api.twilio.com")
        .replace(path: '/2010-04-01/Accounts/${Env.twilioUsername}/Tokens.json')
        .toString();

    final basicAuth = 'Basic ${base64.encode(utf8.encode('${Env.twilioUsername}:${Env.twilioPassword}'))}';
    final options = Options(headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": basicAuth,
    });
    final state =
        await AsyncValue.guard(() async => await ref.read(dioProvider).post(url, data: data, options: options));

    return state.value?.data;
  }

  Future createPresenter(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/createPresenter').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future updatePresenter(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/updatePresenter').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future removePresenter(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/removePresenter').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future createAudience(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/createAudience').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future updateAudience(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/updateAudience').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future removeAudience(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/removeAudience').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }

  Future removeAudienceByPresenterId(Map<String, dynamic> data) async {
    final url = Uri.parse(AppBase.url).replace(path: '/api/v1/signaling/removeAudienceByPresenterId').toString();
    final state = await AsyncValue.guard(() async => await ref.read(dioApiProvider).post(url, data: data));

    return state.value?.data;
  }
}

final signalingSvcProvider = Provider(SignalingSvc.new);
