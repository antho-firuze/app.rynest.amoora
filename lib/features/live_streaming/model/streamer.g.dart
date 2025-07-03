// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streamer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Streamer _$StreamerFromJson(Map<String, dynamic> json) => _Streamer(
      id: json['id'] == null
          ? 0
          : const JsonIntConverter().fromJson(json['id']),
      signalingChannel: json['signaling_channel'] as String? ?? '',
      streamingChannel: json['streaming_channel'] as String? ?? '',
      views: (json['views'] as num?)?.toInt() ?? 0,
      liveViews: (json['live_views'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      device: json['device'] as String? ?? '',
      location: json['location'] as String? ?? '',
      ipAddress: json['ip_address'] as String? ?? '',
      startedAt: const JsonDateTimeConverter().fromJson(json['started_at']),
      finishedAt: const JsonDateTimeConverter().fromJson(json['finished_at']),
      heartbeat: const JsonDateTimeConverter().fromJson(json['heartbeat']),
      userId: const JsonIntConverter().fromJson(json['user_id']),
    );

Map<String, dynamic> _$StreamerToJson(_Streamer instance) => <String, dynamic>{
      'id': const JsonIntConverter().toJson(instance.id),
      'signaling_channel': instance.signalingChannel,
      'streaming_channel': instance.streamingChannel,
      'views': instance.views,
      'live_views': instance.liveViews,
      'title': instance.title,
      'desc': instance.desc,
      'device': instance.device,
      'location': instance.location,
      'ip_address': instance.ipAddress,
      'started_at': const JsonDateTimeConverter().toJson(instance.startedAt),
      'finished_at': const JsonDateTimeConverter().toJson(instance.finishedAt),
      'heartbeat': const JsonDateTimeConverter().toJson(instance.heartbeat),
      'user_id': _$JsonConverterToJson<dynamic, int>(
          instance.userId, const JsonIntConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
