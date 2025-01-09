// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerImpl _$$PrayerImplFromJson(Map<String, dynamic> json) => _$PrayerImpl(
      title: json['title'] as String?,
      subTitle: json['subtitle'] as String?,
      arabic: json['arab'] as String?,
      latin: json['transliterasi'] as String?,
      translate: json['translasi'] as String?,
      bookmark: json['bookmark'] as bool? ?? false,
      tags: json['tags'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$PrayerImplToJson(_$PrayerImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subTitle,
      'arab': instance.arabic,
      'transliterasi': instance.latin,
      'translasi': instance.translate,
      'bookmark': instance.bookmark,
      'tags': instance.tags,
      'note': instance.note,
    };
