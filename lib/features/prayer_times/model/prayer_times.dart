// ignore_for_file: invalid_annotation_target

import 'package:amoora/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_times.freezed.dart';
part 'prayer_times.g.dart';

@freezed
abstract class PrayerTimes with _$PrayerTimes {
  factory PrayerTimes({
    @JsonKey(name: 'Fajr') @JsonTimeConverter() DateTime? fajr,
    @JsonKey(name: 'Sunrise') @JsonTimeConverter() DateTime? sunrise,
    @JsonKey(name: 'Dhuhr') @JsonTimeConverter() DateTime? dhuhr,
    @JsonKey(name: 'Asr') @JsonTimeConverter() DateTime? asr,
    @JsonKey(name: 'Sunset') @JsonTimeConverter() DateTime? sunset,
    @JsonKey(name: 'Maghrib') @JsonTimeConverter() DateTime? maghrib,
    @JsonKey(name: 'Isha') @JsonTimeConverter() DateTime? isha,
    @JsonKey(name: 'Imsak') @JsonTimeConverter() DateTime? imsak,
    @JsonKey(name: 'Midnight') @JsonTimeConverter() DateTime? midnight,
    @JsonKey(name: 'Firstthird') @JsonTimeConverter() DateTime? firstthird,
    @JsonKey(name: 'Lastthird') @JsonTimeConverter() DateTime? lastthird,
  }) = _PrayerTimes;

  factory PrayerTimes.fromJson(Map<String, dynamic> json) => _$PrayerTimesFromJson(json);
}

@freezed
abstract class PrayerMethod with _$PrayerMethod {
  factory PrayerMethod({
    int? id,
    String? name,
  }) = _PrayerMethod;

  factory PrayerMethod.fromJson(Map<String, dynamic> json) => _$PrayerMethodFromJson(json);
}

extension PrayerTimesExt on PrayerTimes {
  String? currPrayer() {
    final now = DateTime.now();
    if (now.isBefore(fajr!)) {
      return 'Isya';
    } else if (now.isBefore(sunrise!)) {
      return 'Subuh';
    } else if (now.isBefore(dhuhr!)) {
      return 'Dhuha';
    } else if (now.isBefore(asr!)) {
      return 'Dzuhur';
    } else if (now.isBefore(maghrib!)) {
      return 'Ashar';
    } else if (now.isBefore(isha!)) {
      return 'Maghrib';
    } else {
      return 'Isya';
    }
  }

  DateTime? currPrayerTime() {
    final now = DateTime.now();
    if (now.isBefore(fajr!)) {
      return isha;
    } else if (now.isBefore(dhuhr!)) {
      return fajr;
    } else if (now.isBefore(asr!)) {
      return dhuhr;
    } else if (now.isBefore(maghrib!)) {
      return asr;
    } else if (now.isBefore(isha!)) {
      return maghrib;
    } else {
      return isha;
    }
  }

  String? nextPrayer() {
    final now = DateTime.now();
    if (now.isAfter(fajr!)) {
      if (now.isAfter(dhuhr!)) {
        if (now.isAfter(asr!)) {
          if (now.isAfter(maghrib!)) {
            if (now.isAfter(isha!)) {
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

  DateTime? nextPrayerTime() {
    final now = DateTime.now();
    if (now.isAfter(fajr!)) {
      if (now.isAfter(dhuhr!)) {
        if (now.isAfter(asr!)) {
          if (now.isAfter(maghrib!)) {
            if (now.isAfter(isha!)) {
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
