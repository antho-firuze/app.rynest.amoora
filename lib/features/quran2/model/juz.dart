// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'juz.freezed.dart';
part 'juz.g.dart';

@freezed
abstract class Juz with _$Juz {
  factory Juz({
    @Default(0) int id,
    @JsonKey(name: 'first_verse_id') @Default(0) int firstVerseId,
    @JsonKey(name: 'last_verse_id') @Default(0) int lastVerseId,
    @JsonKey(name: 'verses_count') @Default(0) int versesCount,
    @JsonKey(name: 'verse_mapping') @Default({}) Map<String, String> versesMapping,
  }) = _Juz;

  factory Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);
}