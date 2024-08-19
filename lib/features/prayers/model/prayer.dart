// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer.freezed.dart';
part 'prayer.g.dart';

@freezed
class Prayer with _$Prayer {

  factory Prayer({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "subtitle") String? subTitle,
    @JsonKey(name: "arab") String? arabic,
    @JsonKey(name: "transliterasi") String? latin,
    @JsonKey(name: "translasi") String? translate,
    @JsonKey(name: "next") List<Prayer>? next, 
  }) = _Prayer;

  factory Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);
}

@freezed
class Prayers with _$Prayers {

  factory Prayers({
    @JsonKey(name: 'data') required List<Prayer> prayers,
  }) = _Prayers;

  factory Prayers.fromJson(Map<String, dynamic> json) => _$PrayersFromJson(json);
}