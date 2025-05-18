// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hijri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hijri _$HijriFromJson(Map<String, dynamic> json) => _Hijri(
      date: json['date'] as String?,
      format: json['format'] as String?,
      weekday: json['weekday'] == null
          ? null
          : HijriWeekday.fromJson(json['weekday'] as Map<String, dynamic>),
      day: const JsonIntConverter().fromJson(json['day']),
      year: const JsonIntConverter().fromJson(json['year']),
      month: json['month'] == null
          ? null
          : HijriMonth.fromJson(json['month'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HijriToJson(_Hijri instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'weekday': instance.weekday,
      'day': _$JsonConverterToJson<dynamic, int>(
          instance.day, const JsonIntConverter().toJson),
      'year': _$JsonConverterToJson<dynamic, int>(
          instance.year, const JsonIntConverter().toJson),
      'month': instance.month,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_HijriWeekday _$HijriWeekdayFromJson(Map<String, dynamic> json) =>
    _HijriWeekday(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$HijriWeekdayToJson(_HijriWeekday instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

_HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) => _HijriMonth(
      number: (json['number'] as num?)?.toInt(),
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$HijriMonthToJson(_HijriMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };
