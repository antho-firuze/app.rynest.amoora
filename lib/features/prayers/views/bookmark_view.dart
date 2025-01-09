import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/prayers/views/prayers_detail_view.dart';
import 'package:amoora/features/prayers/views/widgets/prayer_no.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

class BookmarkView extends ConsumerWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookmark'),
          actions: [
            if (bookmarks.isNotEmpty)
              IconButton(
                icon: Icon(SuperIcons.bx_bookmark_alt_minus_solid, color: oGold300),
                onPressed: () async => await ref.read(prayersCtrlProvider).removeAllBookmark(),
              )
          ],
        ),
        body: bookmarks.isEmpty
            ? DataFailed(onBack: () => context.pop())
            : ListView.separated(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  final bookmark = bookmarks[index];
                  var title = bookmark.title?.toCamelCase() ?? '';
                  var subTitle = bookmark.subTitle ?? '';
                  final num = index + 1;
                  return ListTile(
                    leading: PrayerNo(num: num),
                    title: Text(title).bold(),
                    subtitle: subTitle.isNotEmpty ? Text(subTitle) : null,
                    trailing: IconButton(
                      icon: Icon(SuperIcons.bs_bookmark_x, color: oGold300),
                      onPressed: () => ref.read(prayersCtrlProvider).removeBookmark(bookmark),
                    ),
                    onTap: () async {
                      ref.read(prayerProvider.notifier).state = bookmark;
                      ref.read(prayerIndexProvider.notifier).state = index;
                      await context.goto(page: PrayersDetailView(source: 2));
                    },
                  );
                },
                separatorBuilder: (context, index) => divider(padding: const EdgeInsets.symmetric(vertical: 2)),
              ),
      ),
    );
  }
}
