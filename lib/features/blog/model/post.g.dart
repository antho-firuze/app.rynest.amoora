// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      pubDate: json['pubDate'] == null
          ? null
          : DateTime.parse(json['pubDate'] as String),
      tags: json['tags'] as String?,
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'pubDate': instance.pubDate?.toIso8601String(),
      'tags': instance.tags,
      'content': instance.content,
    };
