// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Member _$MemberFromJson(Map<String, dynamic> json) => _Member(
      id: (json['id'] as num?)?.toInt() ?? 0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      label: json['label'] as String? ?? '',
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      heartbeat: json['heartbeat'] == null
          ? null
          : DateTime.parse(json['heartbeat'] as String),
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      isOutOfRange: json['isOutOfRange'] as bool? ?? false,
    );

Map<String, dynamic> _$MemberToJson(_Member instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'label': instance.label,
      'user_id': instance.userId,
      'profile': instance.profile,
      'heartbeat': instance.heartbeat?.toIso8601String(),
      'distance': instance.distance,
      'isOutOfRange': instance.isOutOfRange,
    };
