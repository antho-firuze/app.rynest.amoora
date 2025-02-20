import 'package:amoora/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/prayers/views/bookmark_view.dart';
import 'package:amoora/features/prayers/views/prayers_detail_view.dart';
import 'package:amoora/features/prayers/views/settings_view.dart';
import 'package:amoora/features/prayers/views/widgets/prayer_no.dart';
import 'package:amoora/features/prayers/views/widgets/prayers_bottom_sheet.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class PrayersView extends ConsumerWidget {
  const PrayersView({super.key});

  static const routeName = '/prayers';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayers = ref.watch(prayersProvider);
    final bookmarks = ref.watch(bookmarksProvider);

    WakelockPlus.enable();
    // print('Build Prayers');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        WakelockPlus.disable();
        context.pop();
      },
      child: MyUI(
        showConnectivityInfo: false,
        enabledSafeArea: false,
        child: Scaffold(
          body: OneUINestedScrollView(
            foregroundColor: oWhite,
            background: Container(
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                image: DecorationImage(image: AssetImage('assets/images/background_2.png'), fit: BoxFit.cover),
              ),
            ),
            expandedWidget: Text('Panduan Haji & Umroh'.hardcoded).tsHeadlineL().center().clr(oWhite),
            collapsedWidget: Text('Panduan Haji & Umroh'.hardcoded).tsTitleL().ellipsis().clr(oWhite).maxLn(1),
            actions: [
              IconButton(
                icon: const Icon(SuperIcons.ev_settings_outline, color: oWhite),
                onPressed: () async => await context.goto(page: const SettingsView()),
              ),
              if (bookmarks.isEmpty)
                IconButton(
                  icon: const Icon(SuperIcons.ii_bookmark, color: oWhite),
                  onPressed: () async => await context.goto(page: const BookmarkView()),
                ),
              if (bookmarks.isNotEmpty)
                IconButton(
                  icon: const Icon(SuperIcons.ii_bookmarks, color: oWhite),
                  onPressed: () async => await context.goto(page: const BookmarkView()),
                ),
            ],
            sliverList: SliverList.separated(
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                final prayer = prayers[index];
                var title = prayer.title?.toCamelCase() ?? '';
                var subTitle = prayer.subTitle ?? '';
                final num = index + 1;
                return ListTile(
                  leading: PrayerNo(num: num),
                  title: Text(title).bold(),
                  subtitle: subTitle.isNotEmpty ? Text(subTitle) : null,
                  trailing: prayer.bookmark == false
                      ? IconButton(
                          icon: Icon(SuperIcons.cl_bookmark_line, color: oGold300),
                          onPressed: () => ref.read(prayersCtrlProvider).addBookmark(prayer),
                        )
                      : IconButton(
                          icon: Icon(SuperIcons.cl_bookmark_solid, color: oGold300),
                          onPressed: () => ref.read(prayersCtrlProvider).removeBookmark(prayer),
                        ),
                  onTap: () async {
                    ref.read(prayerProvider.notifier).state = prayer;
                    ref.read(prayerIndexProvider.notifier).state = index;
                    await context.goto(page: PrayersDetailView(source: 1));
                  },
                  onLongPress: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => PrayersBottomSheet(index),
                  ),
                );
              },
              separatorBuilder: (context, index) => divider(padding: const EdgeInsets.symmetric(vertical: 2)),
            ),
          ),
        ),
      ),
    );
  }
}
