import 'package:amoora/common/widgets/overlay_container.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayer_ctrl.dart';
import 'package:amoora/features/prayers/controller/prayer_experience.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomOverlay extends ConsumerWidget {
  const BottomOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(prayerIndexProvider);
    var prayers = ref.watch(prayersCtrlProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OverlayContainer(
          isShowOverlay: ref.watch(prayerOverlayProvider),
          backgroundColor: oBlack.withOpacity(.9).whenDark(oWhite.withOpacity(.9)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: index < 1
                      ? null
                      : () {
                          ref.read(prayerIndexProvider.notifier).state -= 1;
                        },
                  icon: Row(
                    children: [
                      const Icon(Icons.chevron_left),
                      if (index > 0)
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: context.screenWidth / 3),
                          child: Text(
                            prayers[index - 1].title!.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: tsButton().clr(oWhite.whenDark(oBlack)),
                          ),
                        ),
                    ],
                  ),
                  color: oWhite.whenDark(oBlack),
                ),
                IconButton(
                  onPressed: index == prayers.length - 1
                      ? null
                      : () {
                          ref.read(prayerIndexProvider.notifier).state += 1;
                        },
                  icon: Row(
                    children: [
                      if (index < prayers.length - 1)
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: context.screenWidth / 3),
                          child: Text(
                            prayers[index + 1].title!.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: tsButton().clr(oWhite.whenDark(oBlack)),
                          ),
                        ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  color: oWhite.whenDark(oBlack),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
