import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/env/env.dart';
import 'package:amoora/features/hijri_calendar/controller/hijri_calendar_ctrl.dart';
import 'package:amoora/features/hijri_calendar/model/hijri.dart';
import 'package:amoora/features/prayer_times/model/prayer_times.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/duration_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// NOTE ::
// Prayer Times is not to be save, because it's must be up to date on every apps open.

PanelController panelController = PanelController();

enum PrayerTimeType { isha, fajr, dhuhr, asr, maghrib }

final prayerTimesProvider = StateProvider<PrayerTimes?>((ref) => null);
final prayerMethodProvider = StateProvider<PrayerMethod?>((ref) => null);

final remainingNextPrayerTimeProvider =
    StreamProvider.autoDispose<String>((ref) => ref.read(prayerTimesCtrlProvider).getRemainingNextPrayerTime());

final fetchPrayerTimesProvider = FutureProvider<PrayerTimes?>((ref) async {
  final latlong = ref.read(latLongProvider);
  if (latlong == null) return null;

  final state = await AsyncValue.guard(() async => await ref.read(prayerTimesCtrlProvider).fetchPrayerTimes(latlong));

  if (state.hasError) return null;

  log('fetchPrayerTimesProvider : Success', name: "PRAYERTIMES-CTRL");

  final response = state.value;
  final timings = response['data']['timings'];
  return PrayerTimes.fromJson(timings);
});

class PrayerTimesCtrl {
  Ref ref;
  PrayerTimesCtrl(this.ref);

  void initialize() async {
    log('Initialize Prayer Times !');
    // loadPrayerTimes();
    final latlong = ref.read(latLongProvider);
    if (latlong != null) await fetchPrayerTimes(latlong);

    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        await fetchPrayerTimes(next);
      }
    });
  }

  Future fetchPrayerTimes(LatLong latlong) async {
    final reqs = Reqs(
      url: Env.prayerTimeRepoUrl,
      path: '/v1/timings/${DateTime.now().custom('d-MM-yyyy')}',
      queryParameters: {
        'latitude': latlong.lat.toString(),
        'longitude': latlong.lng.toString(),
        'method': '20',
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).get(reqs: reqs));

    if (state.hasError) return null;

    final response = state.value;

    final timings = response['data']['timings'];
    log(':: savePrayerTimes => timing: $timings', name: 'PRAYERTIMES-CTRL');
    final prayerTimes = PrayerTimes.fromJson(timings);
    ref.read(prayerTimesProvider.notifier).state = prayerTimes;

    final dataHijri = response['data']['date']['hijri'];
    log(':: savePrayerTimes => dataHijri: $dataHijri', name: 'PRAYERTIMES-CTRL');
    final hijri = Hijri.fromJson(dataHijri);
    ref.read(hijriDateProvider.notifier).state = hijri;

    final dataMethod = response['data']['meta']['method'];
    log(':: savePrayerTimes => dataMethod: $dataMethod', name: 'PRAYERTIMES-CTRL');
    final method = PrayerMethod.fromJson(dataMethod);
    ref.read(prayerMethodProvider.notifier).state = method;

    return state.value;
  }

  String getName(PrayerTimeType type) => switch (type) {
        PrayerTimeType.isha => "Isya",
        PrayerTimeType.fajr => "Subuh",
        PrayerTimeType.dhuhr => "Dzuhur",
        PrayerTimeType.asr => "Ashar",
        PrayerTimeType.maghrib => "Maghrib",
      };

  Stream<String> getRemainingNextPrayerTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      PrayerTimes? prayerTimes = ref.read(prayerTimesProvider);
      if (prayerTimes == null) {
        log(':: getRemainingNextPrayerTime => prayerTimes: null', name: 'PRAYERTIMES-CTRL');
        yield '00:00:00';
        continue;
      }

      String timeStr = prayerTimes.nextPrayerTime() ?? '';
      String dateStr = DateTime.now().custom('yyyy-MM-dd');
      if (prayerTimes.nextPrayer() == 'Subuh') {
        dateStr = DateTime.now().add(const Duration(days: 1)).custom('yyyy-MM-dd');
      }

      DateTime? nextPrayer = DateTime.tryParse('$dateStr $timeStr');
      if (nextPrayer == null) {
        log(':: getRemainingNextPrayerTime => nextPrayer: null', name: 'PRAYERTIMES-CTRL');
        yield '00:00:00';
        continue;
      }

      var remaining = nextPrayer.difference(DateTime.now());
      if (remaining.inSeconds < 0) {
        log(':: getRemainingNextPrayerTime => nextPrayer: ${remaining.custom()}', name: 'PRAYERTIMES-CTRL');

        yield '00:00:00';
        await Future.delayed(const Duration(minutes: 1));
      } else {
        yield remaining.custom();
      }
    }
  }
}

final prayerTimesCtrlProvider = Provider(PrayerTimesCtrl.new);
