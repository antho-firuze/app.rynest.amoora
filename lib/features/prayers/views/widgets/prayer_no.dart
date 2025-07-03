import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrayerNo extends StatelessWidget {
  const PrayerNo({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/quran/surah-number.svg',
          colorFilter: ColorFilter.mode(oGold300, BlendMode.srcIn),
        ),
        Text("$num").family('diodrum').size(18).bold().center(),
      ],
    );
  }
}
