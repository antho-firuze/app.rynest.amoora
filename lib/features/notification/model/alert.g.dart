// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertImpl _$$AlertImplFromJson(Map<String, dynamic> json) => _$AlertImpl(
      id: json['id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      title: json['title'] as String?,
      body: json['body'] as String?,
      image: json['image'] as String?,
      topic: json['topic'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] == null
          ? false
          : const IntToBoolConverter().fromJson(json['is_read'] as int),
      pinned: json['pinned'] == null
          ? false
          : const IntToBoolConverter().fromJson(json['pinned'] as int),
      pinnedDuration: json['pinned_duration'] as int? ?? 86400,
    );

Map<String, dynamic> _$$AlertImplToJson(_$AlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
      'topic': instance.topic,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_read': const IntToBoolConverter().toJson(instance.isRead),
      'pinned': const IntToBoolConverter().toJson(instance.pinned),
      'pinned_duration': instance.pinnedDuration,
    };
