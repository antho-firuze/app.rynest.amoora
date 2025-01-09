import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/prayer_times/model/prayer_times.dart';
import 'package:amoora/features/prayer_times/views/prayer_times_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
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
    // print('build => InfoPrayerTimes -> ${prayer?.dhuhr}');
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
            Align(
              alignment: Alignment.topCenter,
              child: NextPrayerTime(),
            ),
            3.height,
            // PRAYER TIMES
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 4),
                child: PrayerTimesGroup(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPrayerTime extends ConsumerWidget {
  const NextPrayerTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayer = ref.watch(prayerTimesProvider);
    final prayerText = '${prayer?.nextPrayer() ?? ''} Jam ${prayer?.nextPrayerTime() ?? ''}';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(
        color: primaryLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: SizedBox(
        height: 20,
        width: context.screenWidthRatio(.6, .35),
        child: ref.watch(fetchPrayerTimesProvider).when(
              skipLoadingOnRefresh: false,
              data: (data) => Marquee(
                text: 'Waktu sholat berikutnya ${prayer != null ? prayerText : ''}'.hardcoded,
                style: tsLabelL().clr(oWhite),
                blankSpace: context.screenWidthRatio(.1, .1),
                accelerationDuration: const Duration(seconds: 3),
                accelerationCurve: Curves.linear,
                fadingEdgeStartFraction: .1,
                fadingEdgeEndFraction: .1,
                showFadingOnlyWhenScrolling: false,
              ),
              error: (error, stackTrace) => Center(child: Text(error.toString())),
              loading: () => Skelton(),
            ),
      ),
    );
  }
}

class PrayerTimesGroup extends ConsumerWidget {
  const PrayerTimesGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => Skelton(),
          ),
    );
  }
}

class PrayerTimeItem extends ConsumerWidget {
  const PrayerTimeItem(
    this.type, {
    super.key,
  });

  final PrayerTimeType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayer = ref.watch(prayerTimesProvider);
    final currTimePrayer = prayer?.currPrayerTime();
    final prayerTimeStr = ref.read(prayerTimesCtrlProvider).getName(type);

    String? time;
    switch (type) {
      case PrayerTimeType.isha:
        time = prayer?.isha;
        break;
      case PrayerTimeType.fajr:
        time = prayer?.fajr;
        break;
      case PrayerTimeType.dhuhr:
        time = prayer?.dhuhr;
        break;
      case PrayerTimeType.asr:
        time = prayer?.asr;
        break;
      case PrayerTimeType.maghrib:
        time = prayer?.maghrib;
        break;
    }

    Color color = time == currTimePrayer ? oGold : oWhite;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prayerTimeStr,
          style: ts.copyWith(fontSize: 12).bold().clr(color),
          textScaler: TextScaler.noScaling,
        ),
        Text(
          time ?? '-:-',
          style: ts.copyWith(fontSize: 12).clr(color),
          textScaler: TextScaler.noScaling,
        ),
      ],
    );
  }
}
