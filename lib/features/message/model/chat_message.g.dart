// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String?,
      message: json['message'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      isSentByMe: json['isSentByMe'] as bool? ?? true,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'time': instance.time?.toIso8601String(),
      'isSentByMe': instance.isSentByMe,
    };
