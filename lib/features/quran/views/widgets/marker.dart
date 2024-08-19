import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Marker extends ConsumerWidget {
  const Marker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    if (quran.isMarkPage == true) {
      return Positioned(
        left: 0,
        top: 40,
        child: RotatedBox(quarterTurns: 3, child: SvgPicture.asset(QuranAsset.icMark)),
      );
    }

    return const SizedBox.shrink();
  }
}
