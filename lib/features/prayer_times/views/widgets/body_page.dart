import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/hijri_calendar/controller/hijri_calendar_ctrl.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/responsive_screen.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyPage extends ConsumerWidget {
  const BodyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var placemark = ref.watch(placemarkProvider);
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
        Padding(
          padding: EdgeInsets.only(top: 140.whenLandscape(90)!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gregorian / Hijri Date
              Consumer(
                builder: (context, ref, child) {
                  var hijri = ref.watch(hijriDateProvider);
                  var hijriStr = " / ${hijri?.day} ${hijri?.month?.en} ${hijri?.year}";
                  final dateStr = "${DateTime.now().yMMMd()}${hijri != null ? hijriStr : ''}";
                  return Text(dateStr).tsTitleL().bold().clr(oGold);
                },
              ),
              3.height,
              // Location
              if (ref.watch(isBusyLocationProvider)) ...[
                const Skelton(width: 200)
              ] else ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.near_me, color: oGold200),
                        10.width,
                        context.isLandscape()
                            ? Text(ref.watch(locationProvider)).tsTitleL().ellipsis().center().clr(oWhite50)
                            : SizedBox(
                                width: context.isBigScreen ? null : context.screenWidthRatio(.7, .5),
                                child: Text(ref.watch(locationProvider)).tsTitleL().ellipsis().center().clr(oWhite50),
                              ),
                        10.width,
                        Text(countryCodeToEmoji(placemark?.isoCountryCode)).tsHeadlineS(),
                      ],
                    ),
                  ),
                ),
              ],
              15.height,
              Consumer(
                builder: (context, ref, child) {
                  var prayer = ref.watch(prayerTimesProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Waktu sholat berikutnya '.hardcoded).tsTitleL().clr(oWhite50),
                      3.width,
                      Text(prayer?.nextPrayer ?? '-').tsHeadlineS().bold().clr(oGold),
                      3.width,
                      const Text(', Jam').tsTitleL().bold().clr(oGold),
                      3.width,
                      Text(prayer?.nextPrayerTime ?? '-').tsHeadlineS().bold().clr(oGold),
                    ],
                  );
                },
              ),
              5.height,
              Consumer(
                builder: (context, ref, child) {
                  var method = ref.watch(prayerMethodProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Metode:'.hardcoded).clr(oWhite50),
                      2.width,
                      Text(method?.name ?? '').bold().clr(oWhite50),
                    ],
                  );
                },
              ),
              ResponsiveScreen(
                largeScreen: Column(
                  children: [
                    30.height,
                    const Text('Remaining').tsHeadlineM().clr(oWhite50),
                    15.height,
                    Consumer(builder: (context, ref, child) {
                      return ref.watch(remainingNextPrayerTimeProvider).when(
                            data: (data) => Text(data).tsHeadlineDM().bold().clr(oGold).family('roboto'),
                            error: (error, stackTrace) =>
                                const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
                            loading: () => const Skelton(width: 150),
                          );
                    }),
                  ],
                ),
                child: Column(
                  children: [
                    if (!context.isLandscape()) ...[
                      30.height,
                      const Text('Remaining').tsHeadlineM().clr(oWhite50),
                      15.height,
                      Consumer(builder: (context, ref, child) {
                        return ref.watch(remainingNextPrayerTimeProvider).when(
                              data: (data) => Text(data).tsHeadlineDM().bold().clr(oGold).family('roboto'),
                              error: (error, stackTrace) =>
                                  const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
                              loading: () => const Skelton(width: 150),
                            );
                      }),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
