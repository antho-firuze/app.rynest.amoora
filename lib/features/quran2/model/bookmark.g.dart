// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      id: json['id'] as String?,
      chapterId: (json['chapterId'] as num?)?.toInt(),
      verseId: (json['verseId'] as num?)?.toInt(),
      verseNum: (json['verseNum'] as num?)?.toInt(),
      juzNum: (json['juzNum'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      note: json['note'] as String?,
      folder: json['folder'] as String?,
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'verseId': instance.verseId,
      'verseNum': instance.verseNum,
      'juzNum': instance.juzNum,
      'createdAt': instance.createdAt?.toIso8601String(),
      'note': instance.note,
      'folder': instance.folder,
    };