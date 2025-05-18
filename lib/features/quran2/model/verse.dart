// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse.freezed.dart';
part 'verse.g.dart';

@freezed
abstract class Verse with _$Verse {

  factory Verse({
    @Default(0) int id,
    @Default(0) int chapter,
    @Default(0) int number,
    @JsonKey(name: 'ar') @Default('') String ar,
    @JsonKey(name: 'tr') @Default('') String tr,
    @JsonKey(name: 'idn') @Default('') String idn,
  }) = _Verse;

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);
}