import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/prayer_times/views/prayer_times_view.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee/marquee.dart';

class InfoPrayerTimes extends ConsumerWidget {
  const InfoPrayerTimes({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.goto(page: const PrayerTimesView()),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: oWhite.whenDark(oGrey70),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x25000000).whenDark(oWhite70)!,
              blurRadius: 3.0,
              offset: const Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Column(
          children: [
            // NEXT PRAYER TIME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: const BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: SizedBox(
                  height: 20,
                  // width: context.screenWidthRatio(.6, .35),
                  child: ref.watch(fetchPrayerLocationProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) => Marquee(
                          text: "Waktu sholat daerah ${data[0]}, ${data[1]}",
                          style: tsLabelL().clr(oGold),
                          blankSpace: context.screenWidthRatio(.1, .1),
                          accelerationDuration: const Duration(seconds: 3),
                          accelerationCurve: Curves.linear,
                          fadingEdgeStartFraction: .1,
                          fadingEdgeEndFraction: .1,
                          showFadingOnlyWhenScrolling: false,
                        ),
                        error: (error, stackTrace) => Marquee(
                          text: '$error',
                          style: tsLabelL().clr(oGold),
                          blankSpace: context.screenWidthRatio(.1, .1),
                          accelerationDuration: const Duration(seconds: 3),
                          accelerationCurve: Curves.linear,
                          fadingEdgeStartFraction: .1,
                          fadingEdgeEndFraction: .1,
                          showFadingOnlyWhenScrolling: false,
                        ),
                        loading: () => Skelton(),
                      ),
                ),
              ),
            ),
            3.height,
            // PRAYER TIMES
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 4),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ref.watch(fetchPrayerTimesProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PrayerTimeItem(PrayerTimeType.fajr),
                            PrayerTimeItem(PrayerTimeType.dhuhr),
                            PrayerTimeItem(PrayerTimeType.asr),
                            PrayerTimeItem(PrayerTimeType.maghrib),
                            PrayerTimeItem(PrayerTimeType.isha),
                          ],
                        ),
                        error: (error, stackTrace) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PrayerTimeItem(PrayerTimeType.fajr),
                            PrayerTimeItem(PrayerTimeType.dhuhr),
                            PrayerTimeItem(PrayerTimeType.asr),
                            PrayerTimeItem(PrayerTimeType.maghrib),
                            PrayerTimeItem(PrayerTimeType.isha),
                          ],
                        ),
                        loading: () => Skelton(),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrayerTimeItem extends ConsumerWidget {
  const PrayerTimeItem(
    this.prayerType, {
    super.key,
  });

  final PrayerTimeType prayerType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.read(prayerTimesCtrlProvider).getPrayerTimeByType(prayerType);
    final currPrayer = ref.read(prayerTimesCtrlProvider).getCurrPrayerTime();
    Color color = time == currPrayer ? oGold : oWhite;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(prayerType.desc).size(14).bold().clr(color),
        Text(time?.hm() ?? '-:-').size(14).bold().clr(color),
      ],
    );
  }
}
