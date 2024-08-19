import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNumber extends ConsumerWidget {
  const PageNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          '${quran.page}',
          style: tsTitleM(),
        ),
      ),
    );
  }
}
