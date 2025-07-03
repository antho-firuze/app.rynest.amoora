// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerTimes _$PrayerTimesFromJson(Map<String, dynamic> json) => _PrayerTimes(
      fajr: const JsonTimeConverter().fromJson(json['Fajr']),
      sunrise: const JsonTimeConverter().fromJson(json['Sunrise']),
      dhuhr: const JsonTimeConverter().fromJson(json['Dhuhr']),
      asr: const JsonTimeConverter().fromJson(json['Asr']),
      sunset: const JsonTimeConverter().fromJson(json['Sunset']),
      maghrib: const JsonTimeConverter().fromJson(json['Maghrib']),
      isha: const JsonTimeConverter().fromJson(json['Isha']),
      imsak: const JsonTimeConverter().fromJson(json['Imsak']),
      midnight: const JsonTimeConverter().fromJson(json['Midnight']),
      firstthird: const JsonTimeConverter().fromJson(json['Firstthird']),
      lastthird: const JsonTimeConverter().fromJson(json['Lastthird']),
    );

Map<String, dynamic> _$PrayerTimesToJson(_PrayerTimes instance) =>
    <String, dynamic>{
      'Fajr': const JsonTimeConverter().toJson(instance.fajr),
      'Sunrise': const JsonTimeConverter().toJson(instance.sunrise),
      'Dhuhr': const JsonTimeConverter().toJson(instance.dhuhr),
      'Asr': const JsonTimeConverter().toJson(instance.asr),
      'Sunset': const JsonTimeConverter().toJson(instance.sunset),
      'Maghrib': const JsonTimeConverter().toJson(instance.maghrib),
      'Isha': const JsonTimeConverter().toJson(instance.isha),
      'Imsak': const JsonTimeConverter().toJson(instance.imsak),
      'Midnight': const JsonTimeConverter().toJson(instance.midnight),
      'Firstthird': const JsonTimeConverter().toJson(instance.firstthird),
      'Lastthird': const JsonTimeConverter().toJson(instance.lastthird),
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
