import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amoora/utils/json_converter_utils.dart';

part 'hijri.freezed.dart';
part 'hijri.g.dart';

@freezed
abstract class Hijri with _$Hijri {
  factory Hijri({
    String? date,
    String? format,
    HijriWeekday? weekday,
    @JsonIntConverter() int? day,
    @JsonIntConverter() int? year,
    HijriMonth? month,
  }) = _Hijri;

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);
}

@freezed
abstract class HijriWeekday with _$HijriWeekday {
  factory HijriWeekday({
    String? en,
    String? ar,
  }) = _HijriWeekday;

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => _$HijriWeekdayFromJson(json);
}

@freezed
abstract class HijriMonth with _$HijriMonth {
  factory HijriMonth({
    int? number,
    String? en,
    String? ar,
  }) = _HijriMonth;

  factory HijriMonth.fromJson(Map<String, dynamic> json) => _$HijriMonthFromJson(json);
}
