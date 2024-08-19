import 'package:amoora/features/quran/controller/bookmark_controller.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkQuranView extends ConsumerWidget {
  const BookmarkQuranView({super.key});

  static const routeName = '/bookmark_quran';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var markPages = ref.watch(bookmarkCtrlProvider);

    debugPrint('Build Bookmark Page');
    // SystemUIOverlay.showUIOverlay;
    return Scaffold(
      appBar: AppBar(
        title: const Text(QuranString.pageBookmark),
      ),
      body: ListView.separated(
        itemCount: markPages.length,
        separatorBuilder: (context, index) => divider(),
        itemBuilder: (context, index) {
          int page = int.parse(markPages[index]);
          return ListTile(
            onTap: () => ref.read(quranNotifierProvider.notifier).gotoPage(page - 1),
            visualDensity: const VisualDensity(horizontal: -3),
            leading: SvgPicture.asset(QuranAsset.icSaveFilled),
            title: Text(
              '${QuranString.surah} ${getSurahName(page)}',
              style: tsTitleL(),
            ),
            subtitle: Text(
              'Hal $page',
              style: tsTitleM(),
            ),
            trailing: IconButton(
              onPressed: () => ref.read(bookmarkCtrlProvider.notifier).updateMark(page),
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
