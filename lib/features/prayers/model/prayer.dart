// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer.freezed.dart';
part 'prayer.g.dart';

@freezed
abstract class Prayer with _$Prayer {
  factory Prayer({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "subtitle") String? subTitle,
    @JsonKey(name: "arab") String? arabic,
    @JsonKey(name: "transliterasi") String? latin,
    @JsonKey(name: "translasi") String? translate,
    @Default(false) bool bookmark,
    String? tags,
    String? note,
  }) = _Prayer;

  factory Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);
}