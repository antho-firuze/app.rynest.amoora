// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hijri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HijriImpl _$$HijriImplFromJson(Map<String, dynamic> json) => _$HijriImpl(
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

Map<String, dynamic> _$$HijriImplToJson(_$HijriImpl instance) =>
    <String, dynamic>{
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

_$HijriWeekdayImpl _$$HijriWeekdayImplFromJson(Map<String, dynamic> json) =>
    _$HijriWeekdayImpl(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$$HijriWeekdayImplToJson(_$HijriWeekdayImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

_$HijriMonthImpl _$$HijriMonthImplFromJson(Map<String, dynamic> json) =>
    _$HijriMonthImpl(
      number: (json['number'] as num?)?.toInt(),
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$$HijriMonthImplToJson(_$HijriMonthImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };
