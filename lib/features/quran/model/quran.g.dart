// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuranImpl _$$QuranImplFromJson(Map<String, dynamic> json) => _$QuranImpl(
      page: json['page'] as int? ?? 1,
      markPage:
          (json['markPage'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      surahNumber: json['surahNumber'] as int?,
      surahName: json['surahName'] as String?,
      juz: json['juz'] as int?,
      hizb: json['hizb'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
      isRightPage: json['isRightPage'] as bool?,
      hizbText: json['hizbText'] as String?,
      surahData: json['surahData'] as String?,
      isMarkPage: json['isMarkPage'] as bool? ?? false,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$$QuranImplToJson(_$QuranImpl instance) =>
    <String, dynamic>{
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
