import 'package:amoora/features/quran/utils/math_utils.dart';

class Page {
  final int surah;
  int hizbQuarter;
  int get hizb => (hizbQuarter / 4).fixedRound;
  int get juz => (hizbQuarter / 8).fixedRound;

  Page({
    required this.surah,
    required this.hizbQuarter,
  });
}
