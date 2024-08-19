import 'dart:developer';

import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmarkCtrlProvider = NotifierProvider<BookmarkCtrl, List<String>>(BookmarkCtrl.new);

class BookmarkCtrl extends Notifier<List<String>> {
  static const _bookmarkKey = 'QURAN_BOOKMARK_KEY';

  @override
  List<String> build() => ref.read(sharedPrefProvider).getStringList(_bookmarkKey) ?? [];

  void updateMark(int page) {
    // Toggle Bookmark
    var markedPage = state;
    if (markedPage.contains(page.toString())) {
      markedPage.remove(page.toString());
      ref.read(quranNotifierProvider.notifier).updateMark(false);
    } else {
      markedPage.add(page.toString());
      ref.read(quranNotifierProvider.notifier).updateMark(true);
    }

    state = [
      for (final mark in markedPage) mark,
    ];

    log(markedPage.toString());
    ref.read(sharedPrefProvider).setStringList(_bookmarkKey, markedPage);
  }
}
