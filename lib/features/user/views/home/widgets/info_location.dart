import 'package:amoora/common/widgets/icon_text.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee/marquee.dart';

class InfoLocation extends ConsumerWidget {
  const InfoLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ref.watch(fetchLocationProvider).when(
              skipLoadingOnRefresh: false,
              data: (data) => IconText(
                onTap: () async => ref.refresh(fetchLocationProvider),
                icon: const Icon(Icons.near_me, color: oGold200),
                text: SizedBox(
                  height: 20,
                  width: context.screenWidthRatio(.4, .3),
                  child: Marquee(
                    text: data,
                    style: ts.clr(oWhite70),
                    blankSpace: 30,
                    startPadding: 5,
                    pauseAfterRound: const Duration(seconds: 2),
                    accelerationDuration: const Duration(seconds: 3),
                    fadingEdgeStartFraction: .1,
                    fadingEdgeEndFraction: .1,
                    showFadingOnlyWhenScrolling: false,
                  ),
                ),
              ),
              error: (error, stackTrace) => IconText(
                onTap: () async => await ref.read(locationCtrlProvider).refresh(),
                icon: const Icon(Icons.near_me_disabled, color: oGrey),
                text: SizedBox(
                  height: 20,
                  width: context.screenWidthRatio(.4, .3),
                  child: Marquee(
                    text: '$error',
                    style: ts.clr(oWhite70),
                    blankSpace: 30,
                    startPadding: 5,
                    pauseAfterRound: const Duration(seconds: 2),
                    accelerationDuration: const Duration(seconds: 3),
                    fadingEdgeStartFraction: .1,
                    fadingEdgeEndFraction: .1,
                    showFadingOnlyWhenScrolling: false,
                  ),
                ),
              ),
              loading: () => Skelton(width: context.screenWidth * .4),
            ),
      ],
    );
  }
}
