import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChapterNo extends StatelessWidget {
  const ChapterNo(
    this.num, {
    super.key,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/icons/quran/surah-number.svg', color: oGold300),
        Text("${num}").family('diodrum').size(18).bold().center(),
      ],
    );
  }
}
