import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/bookmark_controller.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/views/widgets/info_text.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageInfo extends ConsumerWidget {
  const PageInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            BackButton(
              onPressed: () => context.popz(),
              color: context.isDarkMode ? null : oWhite30,
            ),
            Tooltip(
              message: QuranString.saveBookmark,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  quran.isMarkPage ? QuranAsset.icSaveFilled : QuranAsset.icSave,
                  color: quran.isMarkPage ? Colors.red : null,
                ),
                onPressed: () => ref.read(bookmarkCtrlProvider.notifier).updateMark(quran.page),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${QuranString.surah} ${quran.surahName}',
              style: tsTitleL().clr(oWhite),
            ),
            2.height,
            InfoText(
              text: quran.surahData ?? '',
              // svgIcon: QuranAsset.icBook,
            ),
            8.height,
            Row(
              children: [
                InfoText(
                  text: '${QuranString.page} ${quran.page}',
                  svgIcon: QuranAsset.icPage,
                ),
                10.width,
                InfoText(
                  text: '${QuranString.juz} ${quran.juz}',
                  svgIcon: QuranAsset.icPart,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
