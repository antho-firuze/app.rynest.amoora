import 'package:amoora/core/app_theme.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 27.0,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontFamily: AppTheme.secondaryFont,
              fontSize: fontSize,
              color: Colors.black.whenDark(Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
