import 'package:amoora/features/quran/helper/quran_asset.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurahNumber extends StatelessWidget {
  const SurahNumber({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(QuranAsset.icSurahNumber),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: tsHeadlineL(),
          ),
        ),
      ],
    );
  }
}
