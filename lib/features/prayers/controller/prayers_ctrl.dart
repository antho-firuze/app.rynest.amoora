import 'dart:developer';

import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/features/prayers/model/prayer.dart';
import 'package:amoora/features/prayers/service/prayer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FontType { arabic, latin, trans }

final prayerIndexProvider = StateProvider<int>((ref) => 0);
final prayerProvider = StateProvider<Prayer?>((ref) => null);
final prayersProvider = StateProvider<List<Prayer>>((ref) => []);
final bookmarksProvider = StateProvider<List<Prayer>>((ref) => []);

final arabicFontSizeProvider = StateProvider<double>((ref) => 27.0);
final latinFontSizeProvider = StateProvider<double>((ref) => 22.0);
final transFontSizeProvider = StateProvider<double>((ref) => 22.0);

final showLatinProvider = StateProvider<bool>((ref) => true);
final showTransProvider = StateProvider<bool>((ref) => true);

class PrayersCtrl {
  Ref ref;
  PrayersCtrl(this.ref);

  final String _arabicFontSizeKey = 'PRAYERS_ARABIC_FONT_SIZE';
  final String _latinFontSizeKey = 'PRAYERS_LATIN_FONT_SIZE';
  final String _transFontSizeKey = 'PRAYERS_TRANS_FONT_SIZE';
  final String _showLatinKey = 'PRAYERS_SHOW_LATIN_KEY';
  final String _showTransKey = 'PRAYERS_SHOW_TRANS_KEY';
  final String _bookmarkKey = 'PRAYERS_BOOKMARK_KEY';

  List<Prayer> _prayers = [];
  List<int> _bookmarksIndex = [];

  void initialize() async {
    log('Initialize Prayers !');

    loadSettings();

    _prayers = _fetchPrayers();
    ref.read(prayersProvider.notifier).state = _prayers;

    _loadBookmark();
  }

  List<Prayer> get prayers => _prayers;

  Prayer getPrayerByIndex(int index) => _prayers[index];

  void addBookmark(Prayer prayer) {
    final index = _prayers.indexOf(prayer);
    _prayers[index] = _prayers[index].copyWith(bookmark: true);

    var bookmarks = _prayers.where((e) => e.bookmark == true).toList();

    // Required this step for Riverpod update state
    ref.read(bookmarksProvider.notifier).state = [...bookmarks];
    ref.read(prayersProvider.notifier).state = [..._prayers];

    // UPDATE BOOKMARK CACHE
    _bookmarksIndex.add(index);
    _saveBookmark(_bookmarksIndex);
  }

  void removeBookmark(Prayer prayer) {
    final index = _prayers.indexOf(prayer);
    // log("removeBookmark : $index", name: 'PRAYERS-CTRL');
    _prayers[index] = _prayers[index].copyWith(bookmark: false);

    var bookmarks = _prayers.where((e) => e.bookmark == true).toList();

    // Required this step for Riverpod update state
    ref.read(bookmarksProvider.notifier).state = [...bookmarks];
    ref.read(prayersProvider.notifier).state = [..._prayers];

    // UPDATE BOOKMARK CACHE
    _bookmarksIndex.remove(index);
    _saveBookmark(_bookmarksIndex);
  }

  Future removeAllBookmark() async {
    await AlertService.confirm(
      body: "Anda yakin ingin menghapus semua bookmark ?",
      onYes: () {
        final map = _prayers.asMap();
        map.forEach((key, value) => _prayers[key] = _prayers[key].copyWith(bookmark: false));

        var bookmarks = _prayers.where((e) => e.bookmark == true).toList();

        // Required this step for Riverpod update state
        ref.read(bookmarksProvider.notifier).state = [...bookmarks];
        ref.read(prayersProvider.notifier).state = [..._prayers];

        // UPDATE BOOKMARK CACHE
        _bookmarksIndex = [];
        _saveBookmark(_bookmarksIndex);
      },
    );
  }

  void _loadBookmark() {
    var data = ref.read(sharedPrefProvider).getString(_bookmarkKey);
    log("_loadBookmark : $data", name: 'PRAYERS-CTRL');
    if (data != null) {
      var bookmarks = ref.read(bookmarksProvider);
      for (var index in data.split(',').map(int.parse).toList()) {
        _prayers[index] = _prayers[index].copyWith(bookmark: true);
        bookmarks.add(_prayers[index]);
      }

      // Required this step for Riverpod update state
      ref.read(bookmarksProvider.notifier).state = [...bookmarks];
      ref.read(prayersProvider.notifier).state = [..._prayers];
    }
  }

  void _saveBookmark(List<int> bookmarks) {
    // log('_saveBookmark : $bookmarks', name: 'PRAYERS-CTRL');
    if (bookmarks.isNotEmpty) {
      ref.read(sharedPrefProvider).setString(_bookmarkKey, bookmarks.join(','));
    } else {
      ref.read(sharedPrefProvider).remove(_bookmarkKey);
    }
  }

  List<Prayer> _fetchPrayers() {
    final jsonList = ref.read(prayerServiceProvider).fetchPrayers();

    return jsonList!.map(Prayer.fromJson).toList();
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
}

final prayersCtrlProvider = Provider(PrayersCtrl.new);
