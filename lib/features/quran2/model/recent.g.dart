// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recent _$RecentFromJson(Map<String, dynamic> json) => _Recent(
      id: json['id'] as String?,
      chapterId: (json['chapterId'] as num?)?.toInt(),
      verseId: (json['verseId'] as num?)?.toInt(),
      verseNum: (json['verseNum'] as num?)?.toInt(),
      juzNum: (json['juzNum'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RecentToJson(_Recent instance) => <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'verseId': instance.verseId,
      'verseNum': instance.verseNum,
      'juzNum': instance.juzNum,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
