import 'package:amoora/common/widgets/custom_card.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_alert.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_controller.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PanelPage extends ConsumerWidget {
  const PanelPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayer = ref.watch(prayerTimesProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
          child: Column(
            children: [
              Text(
                'Waktu sholat hari ini',
                style: tsTitleL().bold(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: context.screenWidth * .3,
                  child: divider(thick: 3, color: oGold100),
                ),
              ),
              StaggeredGrid.count(
                crossAxisCount: context.isLandscape() ? 5 : 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  PrayerCard(
                    type: 'Subuh',
                    time: prayer?.fajr!,
                    isAllow: ref.watch(alertSubuhProvider),
                    onTap: () => ref.read(prayerTimesAlertProvider).alertSubuh(),
                  ),
                  PrayerCard(
                    type: 'Dzuhur',
                    time: prayer?.dhuhr!,
                    isAllow: ref.watch(alertDzuhurProvider),
                    onTap: () => ref.read(prayerTimesAlertProvider).alertDzuhur(),
                  ),
                  PrayerCard(
                    type: 'Ashar',
                    time: prayer?.asr!,
                    isAllow: ref.watch(alertAsharProvider),
                    onTap: () => ref.read(prayerTimesAlertProvider).alertAshar(),
                  ),
                  PrayerCard(
                    type: 'Maghrib',
                    time: prayer?.maghrib!,
                    isAllow: ref.watch(alertMaghribProvider),
                    onTap: () => ref.read(prayerTimesAlertProvider).alertMaghrib(),
                  ),
                  PrayerCard(
                    type: 'Isya',
                    time: prayer?.isha!,
                    isAllow: ref.watch(alertIsyaProvider),
                    onTap: () => ref.read(prayerTimesAlertProvider).alertIsya(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerCard extends ConsumerWidget {
  const PrayerCard({
    super.key,
    required this.type,
    this.time,
    required this.isAllow,
    this.onTap,
  });

  final String type;
  final String? time;
  final bool isAllow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData iconNotif = isAllow ? Icons.notifications_active_outlined : Icons.notifications_off_outlined;
    Color colorIcon = context.isDarkMode
        ? isAllow
            ? oGold.withOpacity(.5)
            : Theme.of(context).iconTheme.color!.withOpacity(.1)
        : isAllow
            ? oGold.withOpacity(.7)
            : Theme.of(context).iconTheme.color!.withOpacity(.2);

    return CustomCard(
      onTap: onTap,
      color: oBlack50.whenDark(oWhite70.withOpacity(.1)),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(
              iconNotif,
              size: 50,
              color: colorIcon,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                12.height,
                Text(
                  type,
                  style: ts.bold().clr(oWhite.whenDark(oWhite50)),
                ),
                5.height,
                divider(
                  thick: 1.5,
                  color: context.isDarkMode ? null : oBlack50,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                ),
                Text(
                  time ?? '-:-',
                  style: ts.bold().clr(oWhite.whenDark(oWhite50)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
