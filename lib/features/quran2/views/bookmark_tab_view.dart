import 'dart:developer';

import 'package:amoora/common/widgets/forms/group_list.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/bookmark_ctrl.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/views/chapter_view.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class BookmarkTabView extends ConsumerWidget {
  const BookmarkTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final recent = ref.watch(recentProvider);

    final chapterId = recent?.chapterId ?? 1;
    final chapterName = ref.read(quranCtrlProvider).getChapterName(chapterId);
    final verseNum = recent?.verseNum ?? 1;
    final juzNum = recent?.juzNum ?? 1;
    final verseId = recent!.verseId;

    return ListView(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: const Icon(SuperIcons.bs_book_half, color: oGold200),
          title: const Text("Terakhir Baca").family('diodrum').size(20).bold(),
          subtitle: Text(" QS. $chapterName $chapterId : Ayat $verseNum (Juz: $juzNum)")
              .family('diodrum')
              .size(18)
              .clr(oGold300),
          onTap: () async {
            log('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: 'BOOKMARK-TAB');
            ref.read(quranCtrlProvider).selectedChapter(chapterId, verseId);
            await context.goto(page: const ChapterView());
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final bookmarks = ref.watch(bookmarksProvider);
            return GroupList(
              showDividerTop: true,
              showDividerBottom: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bookmark').tsTitleL(),
                    IconButton(
                      tooltip: 'Hapus Semua',
                      icon: Icon(SuperIcons.bx_bookmark_alt_minus_solid, color: bookmarks.isEmpty ? null : oGold300),
                      onPressed: bookmarks.isEmpty
                          ? null
                          : () async => await ref.read(bookmarkCtrlProvider).removeAllBookmark(),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        ...List.generate(
          bookmarks.length,
          (index) {
            final bookmark = bookmarks[index];
            final chapterId = bookmark.chapterId ?? 1;
            final chapterName = ref.read(quranCtrlProvider).getChapterName(chapterId);
            final verseNum = bookmark.verseNum;
            final juzNum = bookmark.juzNum;
            final verseId = bookmark.verseId;
            return ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              leading: const Icon(SuperIcons.bs_book_half, color: oGold200),
              // title: const Text("Terakhir Baca").family('diodrum').size(20).bold(),
              title: Text(" QS. $chapterName $chapterId : Ayat $verseNum (Juz: $juzNum)").family('diodrum').size(18),
              trailing: IconButton(
                tooltip: 'Hapus',
                icon: Icon(SuperIcons.bs_bookmark_x, color: oGold300),
                // onPressed: () {},
                onPressed: () => ref.read(bookmarkCtrlProvider).removeBookmark(bookmark),
              ),
              onTap: () async {
                log('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: 'BOOKMARK-TAB');
                ref.read(quranCtrlProvider).selectedChapter(chapterId, verseId);
                await context.goto(page: const ChapterView());
              },
            );
          },
        ),
      ],
    );
  }
}
