// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => _Bookmark(
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

Map<String, dynamic> _$BookmarkToJson(_Bookmark instance) => <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'verseId': instance.verseId,
      'verseNum': instance.verseNum,
      'juzNum': instance.juzNum,
      'createdAt': instance.createdAt?.toIso8601String(),
      'note': instance.note,
      'folder': instance.folder,
    };
