import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee/marquee.dart';

class BodyPage extends ConsumerWidget {
  const BodyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double backHeight = context.screenHeight * (context.isLandscape() ? .8 : 0.75);
    return Stack(
      children: [
        // BACKGROUND
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: SmileClipper(),
            child: Container(
              height: backHeight,
              color: primaryLight,
            ),
          ),
        ),
        ClipPath(
          clipper: SmileClipper(),
          child: Container(
            height: backHeight - 10,
            color: primaryLight,
            alignment: Alignment.bottomCenter,
          ),
        ),
        RefreshIndicator(
          onRefresh: () async {
            ref.refresh(fetchPrayerDateProvider);
            ref.refresh(fetchPrayerLocationProvider);
            ref.refresh(currentPrayerTimeProvider);
            ref.refresh(fetchPrayerTimesProvider);
            ref.refresh(remainingNextPrayerTimeProvider);
          },
          child: Column(
            spacing: 10,
            children: [
              // 140.whenLandscape(90)!.height,
              context.screenHeightRatio(.15, .2).height,
              // Gregorian / Hijri Date => 27 Jun 2025 / 1 Muharram 1447 H
              ref.watch(fetchPrayerDateProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) =>
                        Text("${data[0]} M / ${data[1]} H").tsTitleL().family('glyphs').bold().clr(oGold).center(),
                    error: (error, stackTrace) => Text('$error').tsTitleL().family('glyphs').bold().clr(oGold).center(),
                    loading: () => Skelton(width: 200),
                  ),
              // Location => Waktu sholat daerah Depok, Indonesia
              ref.watch(fetchPrayerLocationProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) => Center(
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.near_me, color: oGold200),
                          SizedBox(
                            width: context.isBigScreen ? null : context.screenWidthRatio(.7, .5),
                            height: 20,
                            child: Marquee(
                              text: "Waktu sholat daerah ${data[0]}, ${data[1]}",
                              style: tsBodyL().clr(oGold),
                              blankSpace: context.screenWidthRatio(.1, .1),
                              accelerationDuration: const Duration(seconds: 3),
                              accelerationCurve: Curves.linear,
                              fadingEdgeStartFraction: .1,
                              fadingEdgeEndFraction: .1,
                              showFadingOnlyWhenScrolling: false,
                            ),
                          ),
                          Text(countryCodeToEmoji(data[2])).tsHeadlineS(),
                        ],
                      ),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.near_me_disabled, color: oGrey),
                          10.width,
                          Text('$error').tsTitleL().ellipsis().center().clr(oWhite50),
                          10.width,
                        ],
                      ),
                    ),
                    loading: () => Skelton(width: 200),
                  ),
              // Current Prayer => Waktu sholat sekarang Dzuhur, Jam 13:12
              ref.watch(currentPrayerTimeProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) => Row(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Waktu sholat sekarang '.hardcoded).tsTitleL().clr(oWhite50),
                        Text(data[0]).tsHeadlineS().bold().clr(oGold),
                        // const Text(', Jam').tsTitleL().bold().clr(oGold),
                        // Text(data[1]).tsHeadlineS().bold().clr(oGold),
                      ],
                    ),
                    error: (error, stackTrace) => Row(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Waktu sholat sekarang '.hardcoded).tsTitleL().clr(oWhite50),
                        Text('-').tsHeadlineS().bold().clr(oGold),
                        // const Text(', Jam').tsTitleL().bold().clr(oGold),
                        // Text('-').tsHeadlineS().bold().clr(oGold),
                      ],
                    ),
                    loading: () => Skelton(width: 200),
                  ),
              // Metode => Kementerian Agama Republik Indonesia
              ref.watch(fetchPrayerTimesProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) => Row(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Metode:'.hardcoded).clr(oWhite50),
                        Text(ref.watch(prayerMethodProvider)?.name ?? '').bold().clr(oWhite50),
                      ],
                    ),
                    error: (error, stackTrace) => Row(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Metode:'.hardcoded).clr(oWhite50),
                        Text('-').bold().clr(oWhite50),
                      ],
                    ),
                    loading: () => Skelton(width: 200),
                  ),
              if (!context.isLandscape()) ...[
                10.height,
                ref.watch(remainingNextPrayerTimeProvider).when(
                      skipLoadingOnRefresh: false,
                      data: (data) => Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            spacing: 10,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('selanjutnya').tsTitleL().clr(oWhite50),
                              Text(data[1]).tsHeadlineS().bold().clr(oGold),
                              const Text('jam').tsTitleL().bold().clr(oWhite50),
                              Text(data[2]).tsHeadlineS().bold().clr(oGold),
                            ],
                          ),
                          Text('sisa waktu').tsTitleL().clr(oWhite50).bold(),
                          Text(data[0]).tsHeadlineDM().bold().clr(oGold).family('roboto'),
                        ],
                      ),
                      error: (error, stackTrace) =>
                          const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
                      loading: () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: const Skelton(width: 150),
                      ),
                    ),
              ],
              if (context.isLandscape()) ...[
                15.height,
                Consumer(builder: (context, ref, child) {
                  return ref.watch(remainingNextPrayerTimeProvider).when(
                        data: (data) => Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Sholat berikutnya').tsHeadlineM().clr(oWhite50),
                            Text(data[0]).tsHeadlineL().bold().clr(oGold).family('roboto'),
                            const Text('menuju Sholat').tsHeadlineM().clr(oWhite50),
                            Text(data[1]).tsHeadlineM().clr(oWhite50),
                          ],
                        ),
                        error: (error, stackTrace) =>
                            const Text('00:00').tsHeadlineL().bold().clr(oGold).family('roboto'),
                        loading: () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: const Skelton(width: 150),
                        ),
                      );
                }),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
