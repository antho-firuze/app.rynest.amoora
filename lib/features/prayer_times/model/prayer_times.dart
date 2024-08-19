// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_times.freezed.dart';
part 'prayer_times.g.dart';

@freezed
class PrayerTimes with _$PrayerTimes {
  factory PrayerTimes({
    @JsonKey(name: 'Fajr') String? fajr,
    @JsonKey(name: 'Sunrise') String? sunrise,
    @JsonKey(name: 'Dhuhr') String? dhuhr,
    @JsonKey(name: 'Asr') String? asr,
    @JsonKey(name: 'Sunset') String? sunset,
    @JsonKey(name: 'Maghrib') String? maghrib,
    @JsonKey(name: 'Isha') String? isha,
    @JsonKey(name: 'Imsak') String? imsak,
    @JsonKey(name: 'Midnight') String? midnight,
    @JsonKey(name: 'Firstthird') String? firstthird,
    @JsonKey(name: 'Lastthird') String? lastthird,
    String? nextPrayer,
    String? nextPrayerTime,
    String? currPrayer,
    String? currPrayerTime,
  }) = _PrayerTimes;

  factory PrayerTimes.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesFromJson(json);
}

@freezed
class PrayerMethod with _$PrayerMethod {

  factory PrayerMethod({
    int? id,
    String? name,
  }) = _PrayerMethod;

  factory PrayerMethod.fromJson(Map<String, dynamic> json) => _$PrayerMethodFromJson(json);
}