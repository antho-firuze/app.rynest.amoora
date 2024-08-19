import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageSide extends ConsumerWidget {
  const PageSide({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);

    return Column(
      children: [
        SvgPicture.asset(
          quran.isRightPage! ? QuranAsset.icPageRight : QuranAsset.icPageLeft,
          height: 55,
        ),
        Text(
          quran.hizbText!,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
