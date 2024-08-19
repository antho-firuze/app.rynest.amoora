import 'package:amoora/features/quran/views/widgets/bottom_overlay.dart';
import 'package:amoora/features/quran/views/widgets/landscape_overlay.dart';
import 'package:amoora/features/quran/views/widgets/top_overlay.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:flutter/material.dart';

class InfoOverlay extends StatelessWidget {
  const InfoOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: context.isLandscape()
          ? MainAxisAlignment.end
          : MainAxisAlignment.spaceBetween,
      children: context.isLandscape()
          ? [
              const LandscapeOverlay(),
            ]
          : [
              const TopOverlay(),
              const BottomOverlay(),
            ],
    );
  }
}
