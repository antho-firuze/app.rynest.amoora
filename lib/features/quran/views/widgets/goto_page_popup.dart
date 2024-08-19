import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/features/quran/helper/quran_helper.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/repository/page_data.dart';
import 'package:amoora/features/quran/views/widgets/info_text.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final inputPageProvider = StateProvider<int>((ref) => -1);

class GotoPagePopup extends ConsumerWidget {
  const GotoPagePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var page = ref.watch(inputPageProvider);
    int pageParse(String page) {
      if (int.tryParse(page) != null && int.parse(page) > 0 && int.parse(page) <= 604) {
        return int.parse(page);
      }
      return -1;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Go to page',
              style: tsTitleM().bold(),
            ),
            5.height,
            CustomInput(
              initialValue: page > 0 && page <= 604 ? page.toString() : '',
              keyboardType: TextInputType.number,
              onChanged: (p0) {
                ref.read(inputPageProvider.notifier).state = pageParse(p0);
              },
              validator: (p0) => pageParse(p0!) == -1 ? 'Halaman harus diantara 1 - 604' : '',
            ),
            5.height,
            const PageInfo(),
            15.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Batal'),
                ),
                10.width,
                ElevatedButton(
                  onPressed: () => ref.read(quranNotifierProvider.notifier).gotoPage(ref.watch(inputPageProvider) - 1),
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PageInfo extends ConsumerWidget {
  const PageInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var page = ref.watch(inputPageProvider);
    return page == -1
        ? Container()
        : Column(
            children: [
              InfoText(
                text: '${QuranString.surah} ${getSurahName(page)}\n'
                    '${getSurahData(page)}\n'
                    '${QuranString.juz} ${quranPages[page - 1].juz}, ${getHizbText(page)}'
                    '',
                svgIcon: QuranAsset.icBook,
                color: context.colorText,
              ),
              // InfoText(
              //   text: '${QuranString.juz} ${quranPages[page - 1].juz}',
              //   color: context.colorText,
              // ),
            ],
          );
  }
}
