import 'package:amoora/common/controllers/permission_ctrl.dart';
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
    if (!ref.watch(isGpsEnableProvider)) {
      return IconText(
        onTap: () async => await ref.read(locationCtrlProvider).refresh(),
        icon: const Icon(Icons.near_me_disabled, color: oGrey),
        text: SizedBox(
          height: 20,
          width: context.screenWidthRatio(.4, .3),
          child: Marquee(
            text: 'GPS tidak aktif !',
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
      );
    }

    if (!ref.watch(allowGpsProvider)) {
      return IconText(
        onTap: () async => await ref.read(locationCtrlProvider).refresh(),
        icon: const Icon(Icons.near_me, color: oGold200),
        text: SizedBox(
          height: 20,
          width: context.screenWidthRatio(.4, .3),
          child: Marquee(
            text: 'Akses GPS gagal !',
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
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconText(
          onTap: () async => ref.refresh(fetchLocationProvider),
          icon: const Icon(Icons.near_me, color: oGold200),
          text: SizedBox(
            height: 20,
            width: context.screenWidthRatio(.4, .3),
            child: ref.watch(fetchLocationProvider).when(
                  skipLoadingOnRefresh: false,
                  data: (data) => Marquee(
                    text: ref.watch(locationProvider) ?? '',
                    style: ts.clr(oWhite70),
                    blankSpace: 30,
                    startPadding: 5,
                    pauseAfterRound: const Duration(seconds: 2),
                    accelerationDuration: const Duration(seconds: 3),
                    fadingEdgeStartFraction: .1,
                    fadingEdgeEndFraction: .1,
                    showFadingOnlyWhenScrolling: false,
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => Skelton(width: context.screenWidth * .4),
                ),
          ),
        )
      ],
    );
  }
}
