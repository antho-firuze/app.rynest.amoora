// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Verse _$VerseFromJson(Map<String, dynamic> json) => _Verse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      chapter: (json['chapter'] as num?)?.toInt() ?? 0,
      number: (json['number'] as num?)?.toInt() ?? 0,
      ar: json['ar'] as String? ?? '',
      tr: json['tr'] as String? ?? '',
      idn: json['idn'] as String? ?? '',
    );

Map<String, dynamic> _$VerseToJson(_Verse instance) => <String, dynamic>{
      'id': instance.id,
      'chapter': instance.chapter,
      'number': instance.number,
      'ar': instance.ar,
      'tr': instance.tr,
      'idn': instance.idn,
    };
