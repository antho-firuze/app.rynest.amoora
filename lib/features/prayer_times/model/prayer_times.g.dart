// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerTimes _$PrayerTimesFromJson(Map<String, dynamic> json) => _PrayerTimes(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      sunset: json['Sunset'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      imsak: json['Imsak'] as String?,
      midnight: json['Midnight'] as String?,
      firstthird: json['Firstthird'] as String?,
      lastthird: json['Lastthird'] as String?,
    );

Map<String, dynamic> _$PrayerTimesToJson(_PrayerTimes instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Sunset': instance.sunset,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
      'Midnight': instance.midnight,
      'Firstthird': instance.firstthird,
      'Lastthird': instance.lastthird,
    };

_PrayerMethod _$PrayerMethodFromJson(Map<String, dynamic> json) =>
    _PrayerMethod(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PrayerMethodToJson(_PrayerMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
