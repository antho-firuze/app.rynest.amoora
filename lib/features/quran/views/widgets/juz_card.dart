import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JuzCard extends ConsumerWidget {
  const JuzCard({
    super.key,
    required this.juz,
  });

  final int juz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        getJuzUI(context, ref),
        getHizbPart(context, ref, part: 1),
        getHizbPart(context, ref, part: 2),
      ],
    );
  }

  Widget getJuzUI(BuildContext context, WidgetRef ref) {
    var page = getJuzPage(juz);

    return InkWell(
      onTap: () => ref.read(quranNotifierProvider.notifier).gotoPage(page - 1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${QuranString.juz}' $juz", style: tsTitleL()),
            Text(page.toString(), style: tsTitleL()),
          ],
        ),
      ),
    );
  }

  Widget getHizbPart(BuildContext context, WidgetRef ref, {required int part}) {
    var hizb = getHizb(juz: juz, hizb: part);
    var page = getHizbPage(hizb);

    return InkWell(
      onTap: () => ref.read(quranNotifierProvider.notifier).gotoPage(page - 1),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 16, top: 6, bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${QuranString.hizb}' $hizb",
              style: tsTitleM(),
            ),
            Text("$page"),
          ],
        ),
      ),
    );
  }
}
