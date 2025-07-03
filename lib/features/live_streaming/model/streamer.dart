// ignore_for_file: invalid_annotation_target

import 'package:amoora/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streamer.freezed.dart';
part 'streamer.g.dart';

@freezed
abstract class Streamer with _$Streamer {
  factory Streamer({
    @JsonKey(name: 'id') @JsonIntConverter() @Default(0) int id,
    @JsonKey(name: 'signaling_channel') @Default('') String signalingChannel,
    @JsonKey(name: 'streaming_channel') @Default('') String streamingChannel,
    @JsonKey(name: 'views') @Default(0) int views,
    @JsonKey(name: 'live_views') @Default(0) int liveViews,
    @Default('') String title,
    @Default('') String desc,
    @Default('') String device,
    @Default('') String location,
    @JsonKey(name: 'ip_address') @Default('') String ipAddress,
    @JsonKey(name: 'started_at') @JsonDateTimeConverter() DateTime? startedAt,
    @JsonKey(name: 'finished_at') @JsonDateTimeConverter() DateTime? finishedAt,
    @JsonKey(name: 'heartbeat') @JsonDateTimeConverter() DateTime? heartbeat,
    @JsonKey(name: 'user_id') @JsonIntConverter() int? userId,
  }) = _Streamer;

  factory Streamer.fromJson(Map<String, dynamic> json) => _$StreamerFromJson(json);
}
