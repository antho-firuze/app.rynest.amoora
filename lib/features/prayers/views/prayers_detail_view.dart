import 'package:amoora/common/widgets/button/darkmode_button.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/core/app_theme.dart';
import 'package:amoora/features/prayers/controller/prayer_controller.dart';
import 'package:amoora/features/prayers/controller/prayer_experience.dart';
import 'package:amoora/features/prayers/views/widgets/bottom_overlay.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PrayersDetailView extends ConsumerWidget {
  const PrayersDetailView({super.key});

  static const routeName = '/prayers_detail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(prayerIndexProvider);
    var prayers = ref.watch(prayersCtrlProvider);

    // print('Build Prayers');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        debugPrint('onPopInvoked');
        if (ref.watch(prayerOverlayProvider)) {
          ref.read(prayerOverlayProvider.notifier).toggle();
        } else {
          context.pop();
        }
      },
      child: GestureDetector(
        onTap: ref.read(prayerOverlayProvider.notifier).toggle,
        child: MyUI(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                prayers[index].title?.toCamelCase() ?? '',
                overflow: TextOverflow.ellipsis,
              ),
              // title: Row(
              //   children: [
              //     CircleAvatar(
              //       child: Text('${index + 1}'),
              //     ),
              //     5.width,
              //     Expanded(
              //       child: Text(
              //         prayers[index].title?.toUpperCase() ?? '',
              //         overflow: TextOverflow.ellipsis,
              //         style: tsTitleL().bold().clr(oWhite),
              //       ),
              //     ),
              //   ],
              // ),
              actions: const [
                DarkModeButton(),
              ],
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      25.height,
                      Text(
                        prayers[index].title?.toCamelCase() ?? '',
                        style: tsHeadlineL(),
                        textAlign: TextAlign.center,
                      ),
                      20.height,
                      divider(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidthRatio(.3, .3),
                        ),
                        thick: 3,
                        color: oGold,
                      ),
                      if (prayers[index].subTitle != null && prayers[index].subTitle!.isNotEmpty) ...[
                        10.height,
                        Text(
                          prayers[index].subTitle ?? '',
                          style: tsHeadlineS(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      25.height,
                      RichText(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: prayers[index].arabic,
                              style: TextStyle(
                                fontFamily: AppTheme.secondaryFont,
                                fontSize: 30.whenLandscape(35),
                                color: Colors.black.whenDark(Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.height,
                      Text(
                        prayers[index].latin ?? '',
                        style: tsHeadlineS().italic,
                        textAlign: TextAlign.justify,
                      ),
                      20.height,
                      Text(
                        prayers[index].translate ?? '',
                        style: tsHeadlineS(),
                        textAlign: TextAlign.justify,
                      ),
                      70.height,
                    ],
                  ),
                ),
                const BottomOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
