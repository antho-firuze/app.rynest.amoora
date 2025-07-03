import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/controller/quran_ctrl.dart';
import 'package:amoora/features/quran2/views/juz_view.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class JuzTabView extends ConsumerWidget {
  const JuzTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzs = ref.read(quranCtrlProvider).juzs;

    return ListView.separated(
      itemCount: juzs.length,
      separatorBuilder: (BuildContext context, int index) => divider(padding: const EdgeInsets.symmetric(vertical: 2)),
      itemBuilder: (BuildContext context, int index) {
        final juz = juzs[index];
        final chapterNum = juz.versesMapping.entries.first.key.toInt();
        final verseNum = juz.versesMapping.entries.first.value.split('-')[0];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/quran/surah-number.svg',
                colorFilter: ColorFilter.mode(oGold300, BlendMode.srcIn),
              ),
              Text("${juz.id}").family('diodrum').size(18).bold().center(),
            ],
          ),
          title: Text("Juz ${juz.id}").family('diodrum').size(20).bold(),
          subtitle: Text(" Mulai di Surah ${ref.read(quranCtrlProvider).getChapterName(chapterNum)} Ayat $verseNum")
              // " Mulai di Surah ${} Ayat ${juz.firstVerseId}")
              .family('diodrum')
              .size(18)
              .clr(oGold300),
          onTap: () async {
            ref.read(quranCtrlProvider).selectedJuz(juz.id);
            await context.goto(page: const JuzView());
          },
        );
      },
    );
  }
}
