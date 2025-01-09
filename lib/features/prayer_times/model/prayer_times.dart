// ignore_for_file: invalid_annotation_target

import 'package:amoora/utils/datetime_utils.dart';
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
  }) = _PrayerTimes;

  factory PrayerTimes.fromJson(Map<String, dynamic> json) => _$PrayerTimesFromJson(json);
}

@freezed
class PrayerMethod with _$PrayerMethod {
  factory PrayerMethod({
    int? id,
    String? name,
  }) = _PrayerMethod;

  factory PrayerMethod.fromJson(Map<String, dynamic> json) => _$PrayerMethodFromJson(json);
}

extension PrayerTimesExt on PrayerTimes {
  String? currPrayer() {
    final now = DateTime.now();
    if (now.isBefore(fajr!.toTime())) {
      return 'Isya';
    } else if (now.isBefore(dhuhr!.toTime())) {
      return 'Subuh';
    } else if (now.isBefore(asr!.toTime())) {
      return 'Dzuhur';
    } else if (now.isBefore(maghrib!.toTime())) {
      return 'Ashar';
    } else if (now.isBefore(isha!.toTime())) {
      return 'Maghrib';
    } else {
      return 'Isya';
    }
  }

  String? currPrayerTime() {
    final now = DateTime.now();
    if (now.isBefore(fajr!.toTime())) {
      return isha;
    } else if (now.isBefore(dhuhr!.toTime())) {
      return fajr;
    } else if (now.isBefore(asr!.toTime())) {
      return dhuhr;
    } else if (now.isBefore(maghrib!.toTime())) {
      return asr;
    } else if (now.isBefore(isha!.toTime())) {
      return maghrib;
    } else {
      return isha;
    }
  }

  String? nextPrayer() {
    final now = DateTime.now();
    if (now.isAfter(fajr!.toTime())) {
      if (now.isAfter(dhuhr!.toTime())) {
        if (now.isAfter(asr!.toTime())) {
          if (now.isAfter(maghrib!.toTime())) {
            if (now.isAfter(isha!.toTime())) {
              return 'Subuh';
            } else {
              return 'Isya';
            }
          } else {
            return 'Maghrib';
          }
        } else {
          return 'Ashar';
        }
      } else {
        return 'Dzuhur';
      }
    } else {
      return 'Subuh';
    }
  }

  String? nextPrayerTime() {
    final now = DateTime.now();
    if (now.isAfter(fajr!.toTime())) {
      if (now.isAfter(dhuhr!.toTime())) {
        if (now.isAfter(asr!.toTime())) {
          if (now.isAfter(maghrib!.toTime())) {
            if (now.isAfter(isha!.toTime())) {
              return fajr;
            } else {
              return isha;
            }
          } else {
            return maghrib;
          }
        } else {
          return asr;
        }
      } else {
        return dhuhr;
      }
    } else {
      return fajr;
    }
  }
}
