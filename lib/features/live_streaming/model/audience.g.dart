// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Audience _$AudienceFromJson(Map<String, dynamic> json) => _Audience(
      id: (json['id'] as num?)?.toInt() ?? 0,
      presenterId: (json['presenter_id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      heartbeat: json['heartbeat'] == null
          ? null
          : DateTime.parse(json['heartbeat'] as String),
      offer: json['offer'] as Map<String, dynamic>?,
      answer: json['answer'] as Map<String, dynamic>?,
      state: json['state'] as String? ?? 'join',
    );

Map<String, dynamic> _$AudienceToJson(_Audience instance) => <String, dynamic>{
      'id': instance.id,
      'presenter_id': instance.presenterId,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'profile': instance.profile,
      'heartbeat': instance.heartbeat?.toIso8601String(),
      'offer': instance.offer,
      'answer': instance.answer,
      'state': instance.state,
    };
