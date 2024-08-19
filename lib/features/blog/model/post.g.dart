// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      pubDate: json['pubDate'] == null
          ? null
          : DateTime.parse(json['pubDate'] as String),
      tags: json['tags'] as String?,
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'pubDate': instance.pubDate?.toIso8601String(),
      'tags': instance.tags,
      'content': instance.content,
    };
