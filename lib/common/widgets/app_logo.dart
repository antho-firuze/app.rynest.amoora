import 'package:amoora/core/app_asset.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.color, this.width, this.height,
  });

  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAsset.imLogo,
      color: color,
      width: width,
      height: height,
    );
  }
}
