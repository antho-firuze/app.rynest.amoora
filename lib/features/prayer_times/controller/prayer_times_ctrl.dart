import 'dart:developer';

import 'package:amoora/common/controllers/location_ctrl.dart';
import 'package:amoora/common/controllers/permission_ctrl.dart';
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

final _kLogName = 'PRAYERTIMES-CTRL';

PanelController panelController = PanelController();

enum PrayerTimeType {
  isha('Isya'),
  fajr('Subuh'),
  dhuhr('Dzuhur'),
  asr('Ashar'),
  maghrib('Maghrib');

  const PrayerTimeType(this.desc);
  final String desc;
}

final prayerTimesProvider = StateProvider<PrayerTimes?>((ref) => null);
final prayerMethodProvider = StateProvider<PrayerMethod?>((ref) => null);

// Output List<String> => ['01:00:00', 'Dzuhur', '11:57']
final remainingNextPrayerTimeProvider = StreamProvider.autoDispose<List<String>>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));

    PrayerTimes? prayerTimes = ref.read(prayerTimesProvider);
    if (prayerTimes == null) {
      log('remainingNextPrayerTimeProvider : prayerTimes = null', name: _kLogName);
      yield ['00:00:00', '-', '-'];
      continue;
    }

    String timeStr = prayerTimes.nextPrayerTime()?.hms() ?? '';
    String dateStr = DateTime.now().custom('yyyy-MM-dd');
    if (prayerTimes.nextPrayer() == 'Subuh') {
      dateStr = DateTime.now().add(const Duration(days: 1)).custom('yyyy-MM-dd');
    }

    // anticipate when next prayer between isya & subh
    DateTime? nextPrayer = DateTime.tryParse('$dateStr $timeStr');
    if (nextPrayer == null) {
      log('remainingNextPrayerTimeProvider : nextPrayer = null', name: _kLogName);
      yield ['00:00:00', '-', '-'];
      continue;
    }

    var remaining = nextPrayer.difference(DateTime.now());
    if (remaining.inSeconds > 0) {
      yield [remaining.custom(), prayerTimes.nextPrayer() ?? '-', prayerTimes.nextPrayerTime()?.hms() ?? '-'];
    }
    // if (remaining.inSeconds < 0) {
    //   log('remainingNextPrayerTimeProvider => nextPrayer: ${remaining.custom()}', name: _kLogName);

    //   yield ['00:00:00', '-', ''];
    //   await Future.delayed(const Duration(minutes: 1));
    // } else {
    //   yield [remaining.custom(), prayerTimes.nextPrayer() ?? '-', prayerTimes.nextPrayerTime()?.hm() ?? '-'];
    // }
  }
});

// Output List<String> => ['27 Jun 2025', '1 Muharram 1447']
final fetchPrayerDateProvider = StreamProvider<List<String>>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final hijri = ref.read(hijriDateProvider);
    final hijriStr = "${hijri?.day} ${hijri?.month?.en} ${hijri?.year}";
    final gregStr = DateTime.now().yMMMd();
    yield [gregStr, hijriStr];
  }
});

// Output List<String> => ['Depok', 'Indonesia', 'ID']
final fetchPrayerLocationProvider = FutureProvider<List<String>>((ref) async {
  if (!ref.read(isGpsEnableProvider)) throw 'GPS tidak aktif !';
  if (!ref.read(allowGpsProvider)) throw 'Akses lokasi/GPS gagal !';

  final latLong = ref.read(latLongProvider);
  if (latLong == null) throw 'Lokasi tidak dikenal !';

  final placemark = await ref.read(locationCtrlProvider).fetchPlacemark(latLong);
  return [placemark?.subAdministrativeArea ?? '-', placemark?.country ?? '-', placemark?.isoCountryCode ?? ''];
});

// Output List<String> => ['Dzuhur', '13:12']
final currentPrayerTimeProvider = StreamProvider<List<String>>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final prayer = ref.read(prayerTimesProvider);

    // if (DateTime.now() < prayer)

    yield [prayer?.currPrayer() ?? '-', prayer?.currPrayerTime()?.hm() ?? '-'];
  }
});

final fetchPrayerTimesProvider = FutureProvider<PrayerTimes?>((ref) async {
  final latLng = ref.read(latLongProvider);
  if (latLng == null) return null;

  final reqs = Reqs(
    url: Env.prayerTimeRepoUrl,
    path: '/v1/timings/${DateTime.now().custom('d-MM-yyyy')}',
    queryParameters: {
      'latitude': latLng.lat.toString(),
      'longitude': latLng.lng.toString(),
      'method': '20',
    },
  );
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).get(reqs: reqs));

  Map<String, dynamic> json = state.value;
  // log('fetchPrayerTimesProvider => $json', name: "PRAYERTIMES-CTRL");

  final timings = json['data']['timings'];
  // log('timing => $timings', name: _kLogName);
  final prayerTimes = PrayerTimes.fromJson(timings);
  ref.read(prayerTimesProvider.notifier).state = prayerTimes;

  final dataHijri = json['data']['date']['hijri'];
  // log('dataHijri => $dataHijri', name: _kLogName);
  final hijri = Hijri.fromJson(dataHijri);
  ref.read(hijriDateProvider.notifier).state = hijri;

  final dataMethod = json['data']['meta']['method'];
  // log('dataMethod: $dataMethod', name: _kLogName);
  final method = PrayerMethod.fromJson(dataMethod);
  ref.read(prayerMethodProvider.notifier).state = method;

  return prayerTimes;
});

class PrayerTimesCtrl {
  Ref ref;
  PrayerTimesCtrl(this.ref);

  void initialize() async {
    log('Initialize Prayer Times !');

    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        ref.refresh(fetchPrayerLocationProvider);
        ref.refresh(fetchPrayerTimesProvider);
      }
    });
  }

  DateTime? getPrayerTimeByType(PrayerTimeType type) {
    final prayer = ref.read(prayerTimesProvider);
    return switch (type) {
      PrayerTimeType.isha => prayer?.isha,
      PrayerTimeType.fajr => prayer?.fajr,
      PrayerTimeType.dhuhr => prayer?.dhuhr,
      PrayerTimeType.asr => prayer?.asr,
      PrayerTimeType.maghrib => prayer?.maghrib,
    };
  }

  DateTime? getCurrPrayerTime() => ref.read(prayerTimesProvider)?.currPrayerTime();
}

final prayerTimesCtrlProvider = Provider(PrayerTimesCtrl.new);
