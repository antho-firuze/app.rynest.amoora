import 'package:amoora/features/quran2/controller/bookmark_ctrl.dart';
import 'package:amoora/features/quran2/model/chapter.dart';
import 'package:amoora/features/quran2/model/verse.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class VerseBottomSheet extends ConsumerWidget {
  const VerseBottomSheet({
    super.key,
    required this.chapter,
    required this.verse,
  });

  final Chapter chapter;
  final Verse verse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.height,
          Text('QS. ${chapter.name} ${chapter.id} : ${verse.number}').bold(),
          20.height,
          ListTile(
            leading: const Icon(SuperIcons.cl_bookmark_line),
            title: const Text('Tambah ke Bookmark'),
            onTap: () {
              ref.read(bookmarkCtrlProvider).addBookmark(verse.id);
              if (context.mounted) context.popz();
            },
          ),
          ListTile(
            leading: const Icon(SuperIcons.cl_clipboard_outline_badged),
            title: const Text('Tandai bacaan terakhir'),
            onTap: () {
              ref.read(bookmarkCtrlProvider).addRecent(verse.id);
              if (context.mounted) context.popz();
            },
          ),
          40.height,
        ],
      ),
    );
  }
}
