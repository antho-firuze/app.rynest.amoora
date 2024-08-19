import 'package:amoora/features/quran/views/widgets/custom_container.dart';
import 'package:amoora/features/quran/views/widgets/page_info.dart';
import 'package:amoora/features/quran/views/widgets/page_side.dart';
import 'package:flutter/material.dart';

class TopOverlay extends StatelessWidget {
  const TopOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomContainer(
        offsetY: -1,
        padding: EdgeInsets.only(left: 4, right: 10, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageInfo(),
            PageSide(),
          ],
        ),
      ),
    );
  }
}
