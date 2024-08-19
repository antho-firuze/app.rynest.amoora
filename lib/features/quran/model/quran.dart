import 'package:freezed_annotation/freezed_annotation.dart';

part 'quran.freezed.dart';
part 'quran.g.dart';

@freezed
class Quran with _$Quran {

  factory Quran({
    @Default(1) int page,
    @Default([]) List<int> markPage,
    int? surahNumber,
    String? surahName,
    int? juz,
    int? hizb,
    int? hizbQuarter,
    bool? isRightPage,
    String? hizbText,
    String? surahData,
    @Default(false) bool isMarkPage,
    String? lang,
  }) = _Quran;

  factory Quran.fromJson(Map<String, dynamic> json) => _$QuranFromJson(json);
}