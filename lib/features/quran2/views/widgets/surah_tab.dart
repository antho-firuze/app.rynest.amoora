import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/views/chapter_view.dart';
import 'package:amoora/features/quran2/views/widgets/chapter_no.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurahTab extends ConsumerWidget {
  const SurahTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.read(quranCtrlProvider).chapters;

    return ListView.separated(
      itemCount: chapters.length,
      separatorBuilder: (BuildContext context, int index) => divider(padding: const EdgeInsets.symmetric(vertical: 2)),
      itemBuilder: (BuildContext context, int index) {
        final chapter = chapters[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: ChapterNo(chapter.id),
          title: Text("Surah ${chapter.name}").family('diodrum').size(20).bold(),
          subtitle:
              Text("${chapter.revelationPlace} | ${chapter.versesCount} Ayat").family('diodrum').size(18).clr(oGold300),
          trailing: SizedBox(
              height: 35,
              child: Image.asset(
                "assets/quran-surah/sname_${chapter.id}.png",
                color: null.whenDark(oWhite),
              )),
          onTap: () async {
            ref.read(quranCtrlProvider).selectedChapter(chapter.id);
            await context.goto(page: const ChapterView());
          },
        );
      },
    );
  }
}
