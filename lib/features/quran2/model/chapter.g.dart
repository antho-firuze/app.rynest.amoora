// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name_simple'] as String? ?? '',
      versesCount: (json['verses_count'] as num?)?.toInt() ?? 0,
      bismillahPre: json['bismillah_pre'] as bool? ?? true,
      revelationPlace: json['revelation_place'] as String? ?? '',
      revelationOrder: (json['revelation_order'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      translatedName: json['translated_name'] as Map<String, dynamic>?,
      verses: (json['verses'] as List<dynamic>?)
          ?.map((e) => Verse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_simple': instance.name,
      'verses_count': instance.versesCount,
      'bismillah_pre': instance.bismillahPre,
      'revelation_place': instance.revelationPlace,
      'revelation_order': instance.revelationOrder,
      'pages': instance.pages,
      'translated_name': instance.translatedName,
      'verses': instance.verses,
    };
