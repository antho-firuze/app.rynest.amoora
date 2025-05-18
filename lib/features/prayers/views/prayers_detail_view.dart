import 'package:amoora/common/exceptions/data_exeception_layout.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/prayers/controller/prayers_experience.dart';
import 'package:amoora/features/prayers/model/prayer.dart';
import 'package:amoora/features/prayers/views/settings_view.dart';
import 'package:amoora/features/prayers/views/widgets/bottom_overlay.dart';
import 'package:amoora/features/prayers/views/widgets/prayer_no.dart';
import 'package:amoora/features/quran2/views/widgets/custom_text.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class PrayersDetailView extends ConsumerWidget {
  const PrayersDetailView({
    super.key,
    required this.source,
  });

  static const routeName = '/prayers_detail';

  final int source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Prayer> prayers;
    if (source == 1) {
      prayers = ref.watch(prayersProvider);
    } else {
      prayers = ref.watch(bookmarksProvider);
    }
    WakelockPlus.enable();

    debugPrint('Build Prayers Detail');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        WakelockPlus.disable();
        context.pop();
      },
      child: Stack(
        children: [
          MyUI(
            showConnectivityInfo: false,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Panduan Haji & Umroh', overflow: TextOverflow.ellipsis),
                actions: [
                  Consumer(
                    builder: (context, ref, child) {
                      final prayer = ref.watch(prayerProvider);
                      // print('Build Bookmark Action');
                      if (prayer!.bookmark == true) {
                        return IconButton(
                          icon: const Icon(SuperIcons.cl_bookmark_solid),
                          onPressed: () {
                            ref.read(prayerProvider.notifier).state = prayer.copyWith(bookmark: false);
                            ref.read(prayersCtrlProvider).removeBookmark(prayer);
                            if (source == 2) {
                              context.pop();
                            }
                          },
                        );
                      } else {
                        return IconButton(
                          icon: const Icon(SuperIcons.cl_bookmark_line),
                          onPressed: () {
                            ref.read(prayerProvider.notifier).state = prayer.copyWith(bookmark: true);
                            ref.read(prayersCtrlProvider).addBookmark(prayer);
                          },
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(SuperIcons.ev_settings_outline),
                    onPressed: () async => await context.goto(page: const SettingsView()),
                  ),
                ],
              ),
              body: prayers.isEmpty
                  ? DataExceptionLayout(type: ExeceptionType.dataEmpty)
                  : NestedPageView.builder(
                      controller: PageController(initialPage: ref.read(prayerIndexProvider)),
                      onPageChanged: (value) {
                        ref.read(prayerIndexProvider.notifier).state = value;
                        ref.read(prayerProvider.notifier).state = prayers[value];
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: prayers.length,
                      itemBuilder: (context, index) {
                        final prayer = prayers[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollStartNotification) {
                                ref.read(prayerOverlayProvider.notifier).update(false);
                              } else if (notification is ScrollEndNotification) {
                                Future.delayed(Duration(milliseconds: 300))
                                    .then((value) => ref.read(prayerOverlayProvider.notifier).update(true));
                              }
                              return false;
                            },
                            child: ListView(
                              children: [
                                10.height,
                                PrayerNo(num: index + 1),
                                10.height,
                                Text(prayer.title?.toCamelCase() ?? '').tsHeadlineS().center().bold(),
                                if (prayer.subTitle != null && prayer.subTitle!.isNotEmpty) ...[
                                  10.height,
                                  Text(prayer.subTitle ?? '').tsTitleL().center(),
                                ],
                                10.height,
                                divider(
                                  padding: EdgeInsets.symmetric(horizontal: context.screenWidthRatio(.3, .3)),
                                  thick: 3,
                                  color: oGold,
                                ),
                                20.height,
                                CustomText(prayer.arabic ?? '', fontSize: ref.watch(arabicFontSizeProvider)),
                                if (ref.watch(showLatinProvider)) ...[
                                  20.height,
                                  Text(prayer.latin ?? '')
                                      .size(ref.watch(latinFontSizeProvider))
                                      .family('glyphs')
                                      .clr(oGold300),
                                ],
                                if (ref.watch(showTransProvider)) ...[
                                  20.height,
                                  Text(prayer.translate ?? '')
                                      .size(ref.watch(transFontSizeProvider))
                                      .family('glyphs')
                                      .clr(oBlack.whenDark(oWhite)),
                                ],
                                100.height,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          BottomOverlay(prayers: prayers),
        ],
      ),
    );
  }
}
