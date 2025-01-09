import 'package:amoora/common/widgets/overlay_container.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/prayers/controller/prayers_experience.dart';
import 'package:amoora/features/prayers/model/prayer.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomOverlay extends ConsumerWidget {
  const BottomOverlay({
    super.key,
    required this.prayers,
  });

  final List<Prayer> prayers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(prayerIndexProvider);

    if (prayers.isEmpty) {
      return Container();
    }

    // For last index
    if ((index + 1) >= prayers.length) {
      return Container();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OverlayContainer(
            isShowOverlay: ref.watch(prayerOverlayProvider),
            backgroundColor: oGrey70.withValues(alpha: .9).whenDark(oWhite.withValues(alpha: .9)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  5.height,
                  Text('Selanjutnya : ').tsBodyM().clr(oWhite.whenDark(oBlack)),
                  Text(prayers[index + 1].title?.toCamelCase() ?? '').tsTitleM().clr(oWhite.whenDark(oBlack)).bold(),
                  5.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
