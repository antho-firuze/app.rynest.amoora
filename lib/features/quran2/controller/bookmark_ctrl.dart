import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/model/bookmark.dart';
import 'package:amoora/features/quran2/model/recent.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/v4.dart';

final bookmarksProvider = StateProvider<List<Bookmark>>((ref) => []);
final recentsProvider = StateProvider<List<Recent>>((ref) => []);
final bookmarkProvider = StateProvider<Bookmark?>((ref) => null);
final recentProvider = StateProvider<Recent?>((ref) => null);

class BookmarkCtrl {
  Ref ref;
  BookmarkCtrl(this.ref);

  final String _recentKey = 'COOKIE_RECENT_KEY';
  final String _bookmarkKey = 'COOKIE_BOOKMARK_KEY';

  List<Bookmark> _bookmarks = [];
  List<Recent> _recents = [];

  void initialize() async {
    log('Initialize Quran Bookmark !');

    _loadBookmark();
    _loadRecent();
  }

  void _loadBookmark() {
    var data = ref.read(sharedPrefProvider).getString(_bookmarkKey);
    // log('_loadBookmark : $data', name: 'BOOKMARK-CTRL');
    if (data != null) {
      // log('_loadBookmark : is not null', name: 'BOOKMARK-CTRL');
      List<Map<String, dynamic>> datas = jsonDecode(data);
      _bookmarks = datas.map(Bookmark.fromJson).toList();
      ref.read(bookmarksProvider.notifier).state = _bookmarks;
    }
  }

  void addBookmark(int verseId) {
    final verse = ref.read(quranCtrlProvider).verses.firstWhere((verse) => verse.id == verseId);
    final juzNum = ref.read(quranCtrlProvider).getJuzId(verseId);

    final bookmark = Bookmark(
      id: const UuidV4().generate(),
      chapterId: verse.chapter,
      verseId: verseId,
      verseNum: verse.number,
      juzNum: juzNum,
      createdAt: DateTime.now(),
    );
    _bookmarks.add(bookmark);
    _bookmarks.sort((a, b) => a.createdAt!.millisecondsSinceEpoch.compareTo(b.createdAt!.millisecondsSinceEpoch));
    _saveBookmark(_bookmarks);
  }

  void _saveBookmark(List<Bookmark> bookmarks) {
    // log('_saveBookmark : $bookmarks', name: 'BOOKMARK-CTRL');
    if (bookmarks.isNotEmpty) {
      final data = bookmarks.map((bookmark) => bookmark.toJson()).toList();
      ref.read(sharedPrefProvider).setString(_bookmarkKey, jsonEncode(data));
    }
    ref.read(bookmarksProvider.notifier).state = bookmarks;
  }

  void _loadRecent() async {
    var data = ref.read(sharedPrefProvider).getString(_recentKey);
    if (data != null) {
      // log('_loadRecent : $data', name: 'BOOKMARK-CTRL');
      List<Map<String, dynamic>> datas = jsonDecode(data);
      _recents = datas.map(Recent.fromJson).toList();
    } else {
      // log('_loadRecent : $data', name: 'BOOKMARK-CTRL');
      _recents.add(Recent(
        id: const UuidV4().generate(),
        chapterId: 1,
        verseId: 1,
        verseNum: 1,
        juzNum: 1,
        createdAt: DateTime.now(),
      ));
    }
    ref.read(recentsProvider.notifier).state = _recents;
    ref.read(recentProvider.notifier).state = _recents[0];
    // log('_loadRecent : $_recents', name: 'BOOKMARK-CTRL');
  }

  void addRecent(int verseId) {
    final verse = ref.read(quranCtrlProvider).verses.firstWhere((verse) => verse.id == verseId);
    final juzNum = ref.read(quranCtrlProvider).getJuzId(verseId);

    final recent = Recent(
      id: const UuidV4().generate(),
      chapterId: verse.chapter,
      verseId: verseId,
      verseNum: verse.number,
      juzNum: juzNum,
      createdAt: DateTime.now(),
    );
    _recents.add(recent);
    _saveRecent(_recents);
  }

  void _saveRecent(List<Recent> recents) {
    // log('_saveRecent : $recents', name: 'BOOKMARK-CTRL');
    if (recents.isNotEmpty) {
      final data = recents.map((recent) => recent.toJson()).toList();
      ref.read(sharedPrefProvider).setString(_recentKey, jsonEncode(data));
    }
    ref.read(recentsProvider.notifier).state = recents;
    ref.read(recentProvider.notifier).state = _recents.last;
  }
}

final bookmarkCtrlProvider = Provider(BookmarkCtrl.new);
