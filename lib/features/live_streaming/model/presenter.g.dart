// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenterImpl _$$PresenterImplFromJson(Map<String, dynamic> json) =>
    _$PresenterImpl(
      id: json['id'] as int? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      label: json['label'] as String? ?? '',
      userId: json['user_id'] as int? ?? 0,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      heartbeat: json['heartbeat'] == null
          ? null
          : DateTime.parse(json['heartbeat'] as String),
      state: json['state'] as String? ?? 'active',
    );

Map<String, dynamic> _$$PresenterImplToJson(_$PresenterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'label': instance.label,
      'user_id': instance.userId,
      'profile': instance.profile,
      'heartbeat': instance.heartbeat?.toIso8601String(),
      'state': instance.state,
    };
