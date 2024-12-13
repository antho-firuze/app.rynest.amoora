import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/quran_experience.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/features/quran/helper/quran_string.dart';
import 'package:amoora/features/quran/views/bookmark_quran_view.dart';
import 'package:amoora/features/quran/views/dua_khatam_view.dart';
import 'package:amoora/features/quran/views/index_quran_view.dart';
import 'package:amoora/features/quran/views/juz_quran_view.dart';
import 'package:amoora/features/quran/views/widgets/custom_container.dart';
import 'package:amoora/features/quran/views/widgets/goto_page_popup.dart';
import 'package:amoora/features/user/views/user_setting/user_setting_view.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomOverlay extends ConsumerWidget {
  const BottomOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomContainer(
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: QuranString.index,
                    child: IconButton(
                      onPressed: () {
                        ref.read(pageUtilsProvider).goto(page: const IndexQuranView());
                        ref.read(quranOverlayProvider.notifier).toggle();
                      },
                      icon: SvgPicture.asset(QuranAsset.icIndex),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: QuranString.ajzaa,
                    child: IconButton(
                      onPressed: () {
                        ref.read(pageUtilsProvider).goto(page: const JuzQuranView());
                        ref.read(quranOverlayProvider.notifier).toggle();
                      },
                      icon: SvgPicture.asset(QuranAsset.icPart),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: context.isDarkMode ? QuranString.lightMode : QuranString.nightMode,
                    child: IconButton(
                      onPressed: () => context.goto(page: const UserSettingView()),
                      icon: SvgPicture.asset(context.isDarkMode ? QuranAsset.icSun : QuranAsset.icMoon),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: QuranString.goToBookMark,
                    child: IconButton(
                      onPressed: () {
                        ref.read(pageUtilsProvider).goto(page: const BookmarkQuranView());
                        ref.read(quranOverlayProvider.notifier).toggle();
                      },
                      icon: SvgPicture.asset(QuranAsset.icSaveFilled),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: QuranString.changePage,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => const GotoPagePopup(),
                        );
                      },
                      icon: SvgPicture.asset(QuranAsset.icPage),
                    ),
                  ),
                ),
                divider(color: oWhite, isHorizontal: false),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: QuranString.douaa,
                    child: IconButton(
                      onPressed: () {
                        ref.read(pageUtilsProvider).goto(page: const DuaKhatamView());
                        ref.read(quranOverlayProvider.notifier).toggle();
                      },
                      icon: SvgPicture.asset(QuranAsset.icHand),
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
