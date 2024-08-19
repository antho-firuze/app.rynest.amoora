import 'package:amoora/core/app_theme.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/views/widgets/surah_number.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexQuranView extends ConsumerWidget {
  const IndexQuranView({super.key});

  static const routeName = '/index_quran';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(QuranString.surahIndex),
      ),
      body: ListView.separated(
        itemCount: 114,
        separatorBuilder: (context, index) => divider(),
        itemBuilder: (context, index) {
          final surahNumber = index + 1;
          final page = getSurahFirstPage(surahNumber);
          return Stack(
            children: [
              ListTile(
                onTap: () => ref.read(quranNotifierProvider.notifier).gotoPage(page - 1),
                visualDensity: const VisualDensity(horizontal: -3),
                leading: SurahNumber(number: surahNumber),
                title: Text(
                  getSurahNameArabic(surahNumber),
                  style: tsTitleL().family(AppTheme.secondaryFont).bold().copyWith(height: 1.2),
                ),
                subtitle: Text(
                  getSurahData(surahNumber),
                  style: tsTitleM(),
                ),
                trailing: Text(
                  getSurahFirstPage(surahNumber).toString(),
                  style: tsHeadlineS(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
