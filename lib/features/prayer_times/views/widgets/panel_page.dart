import 'package:amoora/common/widgets/custom_card.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_alert.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/utils/theme_utils.dart';
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
                    prayerType: PrayerTimeType.fajr,
                    onTap: () => ref.read(prayerTimesAlertProvider).alertSubuh(),
                  ),
                  PrayerCard(
                    prayerType: PrayerTimeType.dhuhr,
                    onTap: () => ref.read(prayerTimesAlertProvider).alertDzuhur(),
                  ),
                  PrayerCard(
                    prayerType: PrayerTimeType.asr,
                    onTap: () => ref.read(prayerTimesAlertProvider).alertAshar(),
                  ),
                  PrayerCard(
                    prayerType: PrayerTimeType.maghrib,
                    onTap: () => ref.read(prayerTimesAlertProvider).alertMaghrib(),
                  ),
                  PrayerCard(
                    prayerType: PrayerTimeType.isha,
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
    required this.prayerType,
    this.onTap,
  });

  final PrayerTimeType prayerType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.read(prayerTimesCtrlProvider).getPrayerTimeByType(prayerType);
    final currPrayer = ref.read(prayerTimesCtrlProvider).getCurrPrayerTime();
    bool isAllow = switch (prayerType) {
      PrayerTimeType.isha => ref.watch(alertIsyaProvider),
      PrayerTimeType.fajr => ref.watch(alertSubuhProvider),
      PrayerTimeType.dhuhr => ref.watch(alertDzuhurProvider),
      PrayerTimeType.asr => ref.watch(alertAsharProvider),
      PrayerTimeType.maghrib => ref.watch(alertMaghribProvider),
    };

    IconData iconNotif = isAllow ? Icons.notifications_active_outlined : Icons.notifications_off_outlined;
    Color colorIcon = context.isDarkMode
        ? isAllow
            ? oGold.withValues(alpha: .5)
            : Theme.of(context).iconTheme.color!.withValues(alpha: .1)
        : isAllow
            ? oGold.withValues(alpha: .7)
            : Theme.of(context).iconTheme.color!.withValues(alpha: .2);

    Color? color = time == currPrayer ? oGold : null;

    return CustomCard(
      onTap: onTap,
      color: color ?? oBlack50.whenDark(oWhite70.withValues(alpha: .1)),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(iconNotif, size: 50, color: colorIcon),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                12.height,
                Text(prayerType.desc).bold().clr(oWhite.whenDark(oWhite50)),
                5.height,
                divider(
                  thick: 1.5,
                  color: context.isDarkMode ? null : oBlack50,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                ),
                ref.watch(fetchPrayerTimesProvider).when(
                      skipLoadingOnRefresh: false,
                      data: (data) => Text(time ?? '-:-').bold().clr(oWhite.whenDark(oWhite50)),
                      error: (error, stackTrace) => Container(),
                      loading: () => Skelton(),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
