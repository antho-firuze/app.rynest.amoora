import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/widgets/clipper/smile_clipper.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/hijri_calendar/controller/hijri_calendar_ctrl.dart';
import 'package:amoora/features/prayer_times/controller/prayer_times_ctrl.dart';
import 'package:amoora/features/prayer_times/model/prayer_times.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/datetime_utils.dart';
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
    // print("Build");
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
            ref.refresh(fetchLocationProvider);
            ref.refresh(fetchPrayerTimesProvider);
          },
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              140.whenLandscape(90)!.height,
              // Gregorian / Hijri Date
              Consumer(
                builder: (context, ref, child) {
                  var hijri = ref.watch(hijriDateProvider);
                  var hijriStr = " / ${hijri?.day} ${hijri?.month?.en} ${hijri?.year}";
                  final dateStr = "${DateTime.now().yMMMd()}${hijri != null ? hijriStr : ''}";
                  return Text(dateStr).tsTitleL().bold().clr(oGold).center();
                },
              ),
              3.height,
              // Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: ref.watch(fetchLocationProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) => Row(
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
                                    child:
                                        Text(ref.watch(locationProvider)).tsTitleL().ellipsis().center().clr(oWhite50),
                                  ),
                            10.width,
                            Text(countryCodeToEmoji(placemark?.isoCountryCode)).tsHeadlineS(),
                          ],
                        ),
                        error: (error, stackTrace) => Container(),
                        loading: () => Skelton(width: 200),
                      ),
                ),
              ),
              15.height,
              Consumer(
                builder: (context, ref, child) {
                  var prayer = ref.watch(prayerTimesProvider);
                  return ref.watch(fetchPrayerTimesProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Waktu sholat berikutnya '.hardcoded).tsTitleL().clr(oWhite50),
                            3.width,
                            Text(prayer?.nextPrayer() ?? '-').tsHeadlineS().bold().clr(oGold),
                            3.width,
                            const Text(', Jam').tsTitleL().bold().clr(oGold),
                            3.width,
                            Text(prayer?.nextPrayerTime() ?? '-').tsHeadlineS().bold().clr(oGold),
                          ],
                        ),
                        error: (error, stackTrace) => Container(),
                        loading: () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Skelton(),
                        ),
                      );
                },
              ),
              5.height,
              ref.watch(fetchPrayerTimesProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Metode:'.hardcoded).clr(oWhite50),
                        2.width,
                        Text(ref.watch(prayerMethodProvider)?.name ?? '').bold().clr(oWhite50),
                      ],
                    ),
                    error: (error, stackTrace) => Container(),
                    loading: () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Skelton(),
                    ),
                  ),
              if (!context.isLandscape()) ...[
                30.height,
                Consumer(builder: (context, ref, child) {
                  return ref.watch(remainingNextPrayerTimeProvider).when(
                        data: (data) => Column(
                          children: [
                            const Text('Remaining').tsHeadlineM().clr(oWhite50),
                            15.height,
                            Text(data).tsHeadlineDM().bold().clr(oGold).family('roboto'),
                          ],
                        ),
                        error: (error, stackTrace) =>
                            const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
                        loading: () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: const Skelton(width: 150),
                        ),
                      );
                }),
              ],
              if (context.isLandscape()) ...[
                15.height,
                Consumer(builder: (context, ref, child) {
                  return ref.watch(remainingNextPrayerTimeProvider).when(
                        data: (data) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Remaining').tsHeadlineM().clr(oWhite50),
                            10.width,
                            Text(data).tsHeadlineL().bold().clr(oGold).family('roboto'),
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
              // ResponsiveScreen(
              //   largeScreen: Column(
              //     children: [
              //       30.height,
              //       const Text('Remaining').tsHeadlineM().clr(oWhite50),
              //       15.height,
              //       Consumer(builder: (context, ref, child) {
              //         print('largeScreen');
              //         return ref.watch(remainingNextPrayerTimeProvider).when(
              //               data: (data) => Text(data).tsHeadlineDM().bold().clr(oGold).family('roboto'),
              //               error: (error, stackTrace) =>
              //                   const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
              //               loading: () => const Skelton(width: 150),
              //             );
              //       }),
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       if (!context.isLandscape()) ...[
              //         30.height,
              //         Consumer(builder: (context, ref, child) {
              //           return ref.watch(remainingNextPrayerTimeProvider).when(
              //                 data: (data) => Column(
              //                   children: [
              //                     const Text('Remaining').tsHeadlineM().clr(oWhite50),
              //                     15.height,
              //                     Text(data).tsHeadlineDM().bold().clr(oGold).family('roboto'),
              //                   ],
              //                 ),
              //                 error: (error, stackTrace) =>
              //                     const Text('00:00').tsHeadlineDM().bold().clr(oGold).family('roboto'),
              //                 loading: () => const Skelton(width: 150),
              //               );
              //         }),
              //       ],
              //       if (context.isLandscape()) ...[
              //         15.height,
              //         Consumer(builder: (context, ref, child) {
              //           return ref.watch(remainingNextPrayerTimeProvider).when(
              //                 data: (data) => Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     const Text('Remaining').tsHeadlineM().clr(oWhite50),
              //                     10.width,
              //                     Text(data).tsHeadlineL().bold().clr(oGold).family('roboto'),
              //                   ],
              //                 ),
              //                 error: (error, stackTrace) =>
              //                     const Text('00:00').tsHeadlineL().bold().clr(oGold).family('roboto'),
              //                 loading: () => const Skelton(width: 150),
              //               );
              //         }),
              //       ],
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
