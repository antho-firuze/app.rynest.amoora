import 'dart:convert';
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
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

PanelController panelController = PanelController();

final isBusyPrayerTimesProvider = StateProvider<bool>((ref) => false);
final prayerTimesProvider = StateProvider<PrayerTimes?>((ref) => null);

final prayerMethodProvider = StateProvider<PrayerMethod?>((ref) => null);
// final forcePrayerTimeProvider = StateProvider<bool>((ref) => false);

final prayerTimesStreamProvider =
    StreamProvider.autoDispose<void>((ref) => ref.watch(prayerTimesCtrlProvider).updateCurrNextPrayerTimes());

final remainingNextPrayerTimeProvider =
    StreamProvider.autoDispose<String>((ref) => ref.read(prayerTimesCtrlProvider).getRemainingNextPrayerTime());

class PrayerTimesCtrl {
  Ref ref;
  PrayerTimesCtrl(this.ref);

  static const prayerTimesKey = 'PRAYER_TIMES_KEY';

  void initialize() async {
    log('Initialize Prayer Times !');
    loadPrayerTimes();

    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        await fetchPrayerTimes();
      }
    });
  }

  Future<void> fetchPrayerTimes() async {
    LatLong? latLong = ref.read(latLongProvider);
    if (latLong != null) {
      ref.read(isBusyPrayerTimesProvider.notifier).state = true;

      final reqs = Reqs(
        url: Env.prayerTimeRepoUrl,
        path: '/v1/timings/${DateTime.now().custom('d-MM-yyyy')}',
        queryParameters: {
          'latitude': latLong.lat.toString(),
          'longitude': latLong.lng.toString(),
          'method': '20',
        },
      );
      final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).get(reqs: reqs));

      savePrayerTimes(state.value);

      ref.read(isBusyPrayerTimesProvider.notifier).state = false;
    }
  }

  void savePrayerTimes(response) {
    if (response == null) {
      ref.read(prayerTimesProvider.notifier).state = null;
      ref.read(hijriDateProvider.notifier).state = null;
      ref.read(prayerMethodProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(prayerTimesKey);
    } else {
      ref.read(sharedPrefProvider).setString(prayerTimesKey, jsonEncode(response));

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
    }
  }

  void loadPrayerTimes() {
    final data = ref.read(sharedPrefProvider).getString(prayerTimesKey);
    if (data != null) {
      final dataJson = jsonDecode(data);

      final timings = dataJson['data']['timings'];
      var prayerTimes = PrayerTimes.fromJson(timings);
      ref.read(prayerTimesProvider.notifier).state = prayerTimes;

      final dataHijri = dataJson['data']['date']['hijri'];
      var hijri = Hijri.fromJson(dataHijri);
      ref.read(hijriDateProvider.notifier).state = hijri;

      final dataMethod = dataJson['data']['meta']['method'];
      var method = PrayerMethod.fromJson(dataMethod);
      ref.read(prayerMethodProvider.notifier).state = method;
    }
  }

  Stream<String> getRemainingNextPrayerTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      PrayerTimes? prayerTimes = ref.read(prayerTimesProvider);
      if (prayerTimes == null) {
        log(':: getRemainingNextPrayerTime => prayerTimes: null', name: 'PRAYERTIMES-CTRL');
        yield '00:00:00';
        continue;
      }

      String timeStr = prayerTimes.nextPrayerTime ?? '';
      String dateStr = DateTime.now().custom('yyyy-MM-dd');
      if (prayerTimes.nextPrayer == 'Subuh') {
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
        await Future.delayed(const Duration(minutes: 1)).then((value) {
          prayerTimes = calcCurrPrayer(prayerTimes);
          prayerTimes = calcNextPrayer(prayerTimes);
        });
      } else {
        yield remaining.custom();
      }
    }
  }

  Stream<void> updateCurrNextPrayerTimes() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));

      PrayerTimes? prayerTimes = ref.read(prayerTimesProvider);
      if (prayerTimes != null) {
        prayerTimes = calcCurrPrayer(prayerTimes);
        prayerTimes = calcNextPrayer(prayerTimes);

        ref.read(prayerTimesProvider.notifier).state = prayerTimes;
      }
    }
  }

  PrayerTimes calcCurrPrayer(PrayerTimes? prayer) {
    final now = DateTime.now();
    List<String?> curr = [];

    if (now.isBefore(prayer!.fajr!.toTime())) {
      curr = ['Isya', prayer.isha];
    } else if (now.isBefore(prayer.dhuhr!.toTime())) {
      curr = ['Subuh', prayer.fajr];
    } else if (now.isBefore(prayer.asr!.toTime())) {
      curr = ['Dzuhur', prayer.dhuhr];
    } else if (now.isBefore(prayer.maghrib!.toTime())) {
      curr = ['Ashar', prayer.asr];
    } else if (now.isBefore(prayer.isha!.toTime())) {
      curr = ['Maghrib', prayer.maghrib];
    } else {
      curr = ['Isya', prayer.isha];
    }

    // log('Current prayer: ${curr.join(': ')}', name: 'PRAYERTIMES-CTRL');
    return prayer.copyWith(
      currPrayer: curr[0],
      currPrayerTime: curr[1],
    );
  }

  PrayerTimes calcNextPrayer(PrayerTimes? prayer) {
    final now = DateTime.now();
    List<String?> next = [];

    if (now.isAfter(prayer!.fajr!.toTime())) {
      if (now.isAfter(prayer.dhuhr!.toTime())) {
        if (now.isAfter(prayer.asr!.toTime())) {
          if (now.isAfter(prayer.maghrib!.toTime())) {
            if (now.isAfter(prayer.isha!.toTime())) {
              next = ['Subuh', prayer.fajr];
            } else {
              next = ['Isya', prayer.isha];
            }
          } else {
            next = ['Maghrib', prayer.maghrib];
          }
        } else {
          next = ['Ashar', prayer.asr];
        }
      } else {
        next = ['Dzuhur', prayer.dhuhr];
      }
    } else {
      next = ['Subuh', prayer.fajr];
    }

    // log('Next prayer: ${next.join(': ')}', name: 'PRAYERTIMES-CTRL');
    return prayer.copyWith(
      nextPrayer: next[0],
      nextPrayerTime: next[1],
    );
  }
}

final prayerTimesCtrlProvider = Provider(PrayerTimesCtrl.new);
