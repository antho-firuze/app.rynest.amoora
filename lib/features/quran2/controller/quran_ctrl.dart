import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/common/services/talker_service.dart';
import 'package:amoora/features/quran2/controller/bookmark_ctrl.dart';
import 'package:amoora/features/quran2/model/chapter.dart';
import 'package:amoora/features/quran2/model/juz.dart';
import 'package:amoora/features/quran2/model/verse.dart';
import 'package:amoora/utils/talker_utils.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

final _kLogName = 'QURAN-CTRL';

enum FontType { arabic, latin, trans }

final autoScrollCtrl = AutoScrollController();
final headerCarouselController = CarouselSliderController();
final contentCarouselController = CarouselSliderController();

final chapterIdProvider = StateProvider<int>((ref) => 1);
final juzIdProvider = StateProvider<int>((ref) => 1);
final verseIdProvider = StateProvider<int>((ref) => 1);

final gotoChapterIdProvider = StateProvider<int>((ref) => 1);
final gotoVerseNumProvider = StateProvider<int>((ref) => 0);

final arabicFontSizeProvider = StateProvider<double>((ref) => 27.0);
final latinFontSizeProvider = StateProvider<double>((ref) => 22.0);
final transFontSizeProvider = StateProvider<double>((ref) => 22.0);

final showLatinProvider = StateProvider<bool>((ref) => true);
final showTransProvider = StateProvider<bool>((ref) => true);

double arabicFontSize = 0;

int lastVerseId = 0;

// Chapter (Surah)
// Verse (Ayah)

class QuranCtrl {
  Ref ref;
  QuranCtrl(this.ref);

  final String _arabicFontSizeKey = 'COOKIE_ARABIC_FONT_SIZE';
  final String _latinFontSizeKey = 'COOKIE_LATIN_FONT_SIZE';
  final String _transFontSizeKey = 'COOKIE_TRANS_FONT_SIZE';
  final String _showLatinKey = 'COOKIE_SHOW_LATIN_KEY';
  final String _showTransKey = 'COOKIE_SHOW_TRANS_KEY';

  List<Chapter> _chapters = [];
  List<Juz> _juzs = [];
  List<Verse> _verses = [];

  void initialize() async {
    log('Initialize Quran !');

    loadSettings();

    _chapters = await _fetchChapters();
    _juzs = await _fetchJuzs();
    _verses = await fetchVerses();

    ref.read(bookmarkCtrlProvider).initialize();
  }

  void setFontSize(FontType type, double size) {
    switch (type) {
      case FontType.arabic:
        ref.read(sharedPrefProvider).setDouble(_arabicFontSizeKey, size);
        ref.read(arabicFontSizeProvider.notifier).state = size;
        return;
      case FontType.latin:
        ref.read(sharedPrefProvider).setDouble(_latinFontSizeKey, size);
        ref.read(latinFontSizeProvider.notifier).state = size;
        return;
      case FontType.trans:
        ref.read(sharedPrefProvider).setDouble(_transFontSizeKey, size);
        ref.read(transFontSizeProvider.notifier).state = size;
        return;
    }
  }

  void setShowLatin(bool val) {
    ref.read(showLatinProvider.notifier).state = val;
    ref.read(sharedPrefProvider).setBool(_showLatinKey, val);
  }

  void setShowTrans(bool val) {
    ref.read(showTransProvider.notifier).state = val;
    ref.read(sharedPrefProvider).setBool(_showTransKey, val);
  }

  void loadSettings() {
    ref.read(arabicFontSizeProvider.notifier).state =
        ref.read(sharedPrefProvider).getDouble(_arabicFontSizeKey) ?? 34.0;
    ref.read(latinFontSizeProvider.notifier).state = ref.read(sharedPrefProvider).getDouble(_latinFontSizeKey) ?? 22.0;
    ref.read(transFontSizeProvider.notifier).state = ref.read(sharedPrefProvider).getDouble(_transFontSizeKey) ?? 22.0;

    ref.read(showLatinProvider.notifier).state = ref.read(sharedPrefProvider).getBool(_showLatinKey) ?? true;
    ref.read(showTransProvider.notifier).state = ref.read(sharedPrefProvider).getBool(_showTransKey) ?? true;
  }

  List<Chapter> get chapters => _chapters;

  List<Juz> get juzs => _juzs;

  List<Verse> get verses => _verses;

  Chapter getChapter(int? chapterId) => _chapters.firstWhere((chapter) => chapter.id == chapterId);

  Juz getJuz(int juzId) => _juzs.firstWhere((juz) => juz.id == juzId);

  String getChapterName(int chapterId) => chapters[chapterId - 1].name;

  int getJuzId(int verseId) => _juzs
      .firstWhere(
          (juz) => List<int>.generate(juz.versesCount, (int index) => index + juz.firstVerseId).contains(verseId))
      .id;

  int getChapterId(int verseId) => _verses.firstWhere((verse) => verse.id == verseId).chapter;

  int getVerseNum(int verseId) => _verses.firstWhere((verse) => verse.id == verseId).number;

  void selectedChapter(int chapterId, [int? verseId]) {
    ref.read(chapterIdProvider.notifier).state = chapterId;
    ref.read(verseIdProvider.notifier).state = verseId ?? getChapter(chapterId).verses![0].id;

    final verseNum = verseId == null || verseId == 1 ? 0 : getVerseNum(verseId);
    ref.read(gotoVerseNumProvider.notifier).state = verseNum;
  }

  void selectedJuz(int juzId) {
    ref.read(juzIdProvider.notifier).state = juzId;
    ref.read(verseIdProvider.notifier).state = getJuz(juzId).firstVerseId;
  }

  List<Verse> versesByJuz(int juzId) {
    final start = getJuz(juzId).firstVerseId - 1;
    final end = start + getJuz(juzId).versesCount;
    return _verses.getRange(start, end).toList();
  }

  Future<List<Chapter>> _fetchChapters() async {
    try {
      log('_fetchChapters', name: _kLogName);
      await Future.delayed(Duration(seconds: 1));
      final response = await rootBundle.loadString('assets/json/quran_chapters.json');

      if (response.isEmpty) return [];

      List<dynamic>? jsonList = json.decode(response);
      final result = jsonList?.map((e) => Chapter.fromJson(e)).toList();

      return result ?? [];
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error : _fetchChapters", exception: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<List<Juz>> _fetchJuzs() async {
    try {
      log('_fetchJuzs', name: _kLogName);
      await Future.delayed(Duration(seconds: 1));
      final response = await rootBundle.loadString('assets/json/quran_juzs.json');

      if (response.isEmpty) return [];

      List<dynamic>? jsonList = json.decode(response);
      final result = jsonList?.map((e) => Juz.fromJson(e)).toList();

      return result ?? [];
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error : fetchJuzsProvider", exception: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  // Future<List<Chapter>> _fetchQuran() async {
  //   List<Map<String, Object>>? data = ref.read(quranServiceProvider).fetchQuran();
  //   return data!.map(Chapter.fromJson).toList();
  // }

  // Future<List<Juz>> _fetchJuzs() async {
  //   List<Map<String, Object>>? data = ref.read(quranServiceProvider).fetchJuzs();
  //   return data!.map(Juz.fromJson).toList();
  // }

  Future<List<Verse>> fetchVerses() async {
    List<Verse> verses = [];
    for (var chapter in _chapters) {
      verses += chapter.verses!;
    }
    return verses;
  }
}

final quranCtrlProvider = Provider(QuranCtrl.new);
