import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
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
    ref.watch(prayerTimesStreamProvider);
    final prayer = ref.watch(prayerTimesProvider);

    var prayerText = '${prayer?.nextPrayer ?? ''} Jam ${prayer?.nextPrayerTime ?? ''}';

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
            ref.watch(isBusyPrayerTimesProvider)
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(6, 8, 6, 4),
                    child: Skelton(),
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: Container(
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
                        child: Marquee(
                          text: 'Waktu sholat berikutnya ${prayer != null ? prayerText : ''}'.hardcoded,
                          style: tsLabelL().clr(oWhite),
                          blankSpace: context.screenWidthRatio(.1, .1),
                          accelerationDuration: const Duration(seconds: 3),
                          accelerationCurve: Curves.linear,
                          fadingEdgeStartFraction: .1,
                          fadingEdgeEndFraction: .1,
                          showFadingOnlyWhenScrolling: false,
                        ),
                      ),
                    ),
                  ),
            3.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 4),
                child: ref.watch(isBusyPrayerTimesProvider)
                    ? const Center(child: Skelton())
                    : Container(
                        decoration: const BoxDecoration(
                          color: primaryLight,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PrayerScheduleItem(
                              'Subuh'.hardcoded,
                              prayer?.fajr ?? '-:-',
                              prayer?.currPrayerTime ?? '',
                            ),
                            PrayerScheduleItem(
                              'Dzuhur'.hardcoded,
                              prayer?.dhuhr ?? '-:-',
                              prayer?.currPrayerTime ?? '',
                            ),
                            PrayerScheduleItem(
                              'Ashar'.hardcoded,
                              prayer?.asr ?? '-:-',
                              prayer?.currPrayerTime ?? '',
                            ),
                            PrayerScheduleItem(
                              'Maghrib'.hardcoded,
                              prayer?.maghrib ?? '-:-',
                              prayer?.currPrayerTime ?? '',
                            ),
                            PrayerScheduleItem(
                              'Isya'.hardcoded,
                              prayer?.isha ?? '-:-',
                              prayer?.currPrayerTime ?? '',
                            ),
                          ],
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

class PrayerScheduleItem extends StatelessWidget {
  const PrayerScheduleItem(
    this.schedule,
    this.time,
    this.currTimePrayer, {
    super.key,
  });

  final String schedule;
  final String time;
  final String currTimePrayer;

  @override
  Widget build(BuildContext context) {
    Color color = time == currTimePrayer ? oGold : oWhite;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          schedule,
          style: ts.copyWith(fontSize: 12).bold().clr(color),
          textScaler: TextScaler.noScaling,
          // style: tsLabelL().bold().clr(color),
        ),
        Text(
          time,
          style: ts.copyWith(fontSize: 12).clr(color),
          // style: tsBodyL().clr(color),
          textScaler: TextScaler.noScaling,
        ),
      ],
    );
  }
}
