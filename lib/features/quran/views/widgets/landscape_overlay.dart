import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/bookmark_controller.dart';
import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/views/widgets/custom_container.dart';
import 'package:amoora/features/quran/views/widgets/goto_page_popup.dart';
import 'package:amoora/features/quran/views/widgets/info_text.dart';
import 'package:amoora/features/user/views/user_setting/user_setting_view.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandscapeOverlay extends ConsumerWidget {
  const LandscapeOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              15.width,
              Text(
                '${QuranString.surah} ${quran.surahName}',
                style: tsTitleL().clr(oWhite),
              ),
              5.width,
              InfoText(
                text: quran.surahData ?? '',
                svgIcon: QuranAsset.icBook,
              ),
              const Spacer(),
              5.width,
              InfoText(
                text: '${QuranString.page} ${quran.page}',
                svgIcon: QuranAsset.icPage,
              ),
              20.width,
              InfoText(
                text: '${QuranString.juz} ${quran.juz}',
                svgIcon: QuranAsset.icPart,
              ),
              15.width,
              Tooltip(
                message: QuranString.saveBookmark,
                child: IconButton(
                  icon: SvgPicture.asset(
                    quran.isMarkPage ? QuranAsset.icSaveFilled : QuranAsset.icSave,
                    // color: quran.isMarkPage ? Colors.red : null,
                    colorFilter: ColorFilter.mode(quran.isMarkPage ? Colors.red : Colors.transparent, BlendMode.srcIn),
                  ),
                  onPressed: () => ref.read(bookmarkCtrlProvider.notifier).updateMark(quran.page),
                ),
              ),
              Tooltip(
                message: context.isDarkMode ? QuranString.lightMode : QuranString.nightMode,
                child: IconButton(
                  icon: SvgPicture.asset(context.isDarkMode ? QuranAsset.icSun : QuranAsset.icMoon),
                  onPressed: () => context.goto(page: const UserSettingView()),
                ),
              ),
            ],
          ),
          divider(color: oWhite),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () => ref.read(quranNotifierProvider.notifier).openScreen('/bookmark_quran'),
                    icon: SvgPicture.asset(QuranAsset.icSaveFilled),
                    label: FittedBox(
                      child: Text(
                        QuranString.goToBookMark,
                        style: tsButton().clr(oWhite),
                      ),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => const GotoPagePopup(),
                      );
                    },
                    icon: SvgPicture.asset(QuranAsset.icPage),
                    label: Text(
                      QuranString.changePage,
                      style: tsButton().clr(oWhite),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () => ref.read(quranNotifierProvider.notifier).openScreen('/index_quran'),
                    icon: SvgPicture.asset(QuranAsset.icIndex),
                    label: Text(
                      QuranString.index,
                      style: tsButton().clr(oWhite),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () => ref.read(quranNotifierProvider.notifier).openScreen('/juz_quran'),
                    icon: SvgPicture.asset(QuranAsset.icPart),
                    label: Text(
                      QuranString.ajzaa,
                      style: tsButton().clr(oWhite),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () => ref.read(quranNotifierProvider.notifier).openScreen('/dua_khatam'),
                    icon: SvgPicture.asset(QuranAsset.icHand),
                    label: FittedBox(
                      child: Text(
                        QuranString.douaa,
                        style: tsButton().clr(oWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
