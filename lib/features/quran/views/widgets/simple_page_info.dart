import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimplePageInfo extends ConsumerWidget {
  const SimplePageInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${QuranString.surah} ${quran.surahName}',
              style: tsTitleM(),
            ),
            Text(
              '${QuranString.juz} ${quran.juz} - ${quran.hizbText}',
              style: tsTitleM(),
            ),
          ],
        ),
      ),
    );
  }
}
