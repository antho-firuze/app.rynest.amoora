import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    this.svgIcon,
    required this.text,
    this.color = oWhite,
  });

  final String? svgIcon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (svgIcon != null) ...[
          SvgPicture.asset(
            svgIcon!,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          5.width,
        ],
        Text(
          text,
          style: tsTitleM().clr(color),
          // style: TextStyle(
          //   color: color,
          //   fontSize: text.length > 10 ? 16 : 16,
          // ),
        ),
      ],
    );
  }
}
