// ignore_for_file: invalid_annotation_target

import 'package:amoora/features/quran2/model/verse.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class Chapter with _$Chapter {
  factory Chapter({
    @Default(0) int id,
    @JsonKey(name: 'name_simple') @Default('') String name,
    @JsonKey(name: 'verses_count') @Default(0) int versesCount,
    @JsonKey(name: 'bismillah_pre') @Default(true) bool bismillahPre,
    @JsonKey(name: 'revelation_place') @Default('') String revelationPlace,
    @JsonKey(name: 'revelation_order') @Default(0) int revelationOrder,
    List<int>? pages,
    @JsonKey(name: 'translated_name') Map<String, dynamic>? translatedName,
    List<Verse>? verses,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}