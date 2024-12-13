import 'dart:io';

import 'package:amoora/features/quran/controller/quran_asset_controller.dart';
import 'package:amoora/features/quran/views/widgets/invert_color.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranPage extends ConsumerWidget {
  const QuranPage({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quranImage = ref.read(quranAssetCtrlProvider).getPageDir(pageIndex + 1);
    return InvertColor(
      isInvert: context.isDarkMode,
      child: Image.file(File(quranImage)),
      // child: Image.asset(quranImage),
    );
  }
}
