import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/repository/page_data.dart';
import 'package:amoora/features/quran/repository/surah_data.dart';

bool isMarkedSurah(int markPage, int surahNumber) {
  return getSurahNumberByPage(markPage) == surahNumber;
}

String getHizbText(int page) {
  final currentPage = quranPages[page - 1];
  final hizb = currentPage.hizb;
  switch (currentPage.hizbQuarter % 4) {
    case 0:
      return '¾ Hizb $hizb';
    // return '¾ الحزب $hizb';
    case 2:
      return '¼ Hizb $hizb';
    // return '¼ الحزب $hizb';
    case 3:
      return '½ Hizb $hizb';
    // return '½ الحزب $hizb';
    default:
      return 'Hizb $hizb';
    // return 'الحزب $hizb';
  }
}

String getSurahData(int surahNumber) {
  return '${getPlaceOfRevelation(surahNumber)}, ${getNumberOfAyahs(surahNumber)} ${QuranString.verse}';
  // return '${getPlaceOfRevelation(surahNumber)}, آياتها ${getNumberOfAyahs(surahNumber)}';
}

String getSurahDataByPage(int page) {
  return '${getPlaceOfRevelationByPage(page)}, ${getNumberOfAyahsByPage(page)} ${QuranString.verse}';
  // return '${getPlaceOfRevelationByPage(page)}, آياتها ${getNumberOfAyahsByPage(page)}';
}

String getSurahDataWithName(int page) {
  return '${QuranString.surah} ${getSurahName(page)} (${getSurahData(page)})';
  // return 'سورة ${getSurahName(page)} (${getSurahData(page)})';
}

String getSurahDataWithNameByPage(int page) {
  return '${QuranString.surah} ${getSurahName(page)} (${getSurahDataByPage(page)})';
}

// simple methods
int getSurahNumberByPage(int page) {
  return quranPages[page - 1].surah;
}

String getSurahName(int page) {
  return getSurahNameArabic(getSurahNumberByPage(page));
}

int getNumberOfAyahsByPage(int page) {
  return surah[getSurahNumberByPage(page) - 1]['aya'] as int;
}

int getNumberOfAyahs(int surahNumber) {
  return surah[surahNumber - 1]['aya'] as int;
}

String getSurahNameArabic(int surahNumber) {
  return surah[surahNumber - 1]['name'] as String;
}

String getPlaceOfRevelation(int surahNumber) {
  return surah[surahNumber - 1]['place'] as String;
}

String getPlaceOfRevelationByPage(page) {
  return getPlaceOfRevelation(getSurahNumberByPage(page));
}

int getSurahFirstPage(int surahNumber) {
  return quranPages.indexWhere((page) => page.surah == surahNumber) + 1;
}

int getHizbQuarter({required int hizb, required int quarter}) {
  return (hizb - 1) * 4 + quarter + 1;
}

int getHizb({required int juz, required int hizb}) {
  return (juz - 1) * 2 + hizb;
}

int getHizbQuarterPage(int quarter) {
  return quranPages.indexWhere((page) => page.hizbQuarter == quarter) + 1;
}

int getJuzPage(int juz) {
  return quranPages.indexWhere((page) => page.juz == juz) + 1;
}

int getHizbPage(int hizb) {
  return quranPages.indexWhere((page) => page.hizb == hizb) + 1;
}

// String pageDir(int number) {
//   return 'assets/quran-images/page${formattedPageNumber(number)}.png';
// }

String formattedPageNumber(int number) {
  if (number < 10) return '00$number';
  if (number < 100) return '0$number';
  return '$number';
}
