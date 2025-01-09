import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class PrayersBottomSheet extends ConsumerWidget {
  const PrayersBottomSheet(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayer = ref.read(prayersCtrlProvider).getPrayerByIndex(index);
    var title = prayer.title?.toCamelCase() ?? '';

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('${index + 1}. $title').bold(),
          ),
          20.height,
          if (prayer.bookmark == false)
            ListTile(
              leading: const Icon(SuperIcons.cl_bookmark_line),
              title: const Text('Tambah ke Bookmark'),
              onTap: () {
                ref.read(prayersCtrlProvider).addBookmark(prayer);
                if (context.mounted) context.popz();
              },
            ),
          if (prayer.bookmark == true)
            ListTile(
              leading: const Icon(SuperIcons.bs_bookmark_x),
              title: const Text('Hapus Bookmark'),
              onTap: () {
                ref.read(prayersCtrlProvider).removeBookmark(prayer);
                if (context.mounted) context.popz();
              },
            ),
          40.height,
        ],
      ),
    );
  }
}
