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
      next: (json['next'] as List<dynamic>?)
          ?.map((e) => Prayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrayerImplToJson(_$PrayerImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subTitle,
      'arab': instance.arabic,
      'transliterasi': instance.latin,
      'translasi': instance.translate,
      'next': instance.next,
    };

_$PrayersImpl _$$PrayersImplFromJson(Map<String, dynamic> json) =>
    _$PrayersImpl(
      prayers: (json['data'] as List<dynamic>)
          .map((e) => Prayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrayersImplToJson(_$PrayersImpl instance) =>
    <String, dynamic>{
      'data': instance.prayers,
    };
