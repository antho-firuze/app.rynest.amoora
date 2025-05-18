// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quran _$QuranFromJson(Map<String, dynamic> json) => _Quran(
      page: (json['page'] as num?)?.toInt() ?? 1,
      markPage: (json['markPage'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      surahNumber: (json['surahNumber'] as num?)?.toInt(),
      surahName: json['surahName'] as String?,
      juz: (json['juz'] as num?)?.toInt(),
      hizb: (json['hizb'] as num?)?.toInt(),
      hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
      isRightPage: json['isRightPage'] as bool?,
      hizbText: json['hizbText'] as String?,
      surahData: json['surahData'] as String?,
      isMarkPage: json['isMarkPage'] as bool? ?? false,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$QuranToJson(_Quran instance) => <String, dynamic>{
      'page': instance.page,
      'markPage': instance.markPage,
      'surahNumber': instance.surahNumber,
      'surahName': instance.surahName,
      'juz': instance.juz,
      'hizb': instance.hizb,
      'hizbQuarter': instance.hizbQuarter,
      'isRightPage': instance.isRightPage,
      'hizbText': instance.hizbText,
      'surahData': instance.surahData,
      'isMarkPage': instance.isMarkPage,
      'lang': instance.lang,
    };
