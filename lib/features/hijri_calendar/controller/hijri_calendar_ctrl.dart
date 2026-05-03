import 'package:amoora/cff/models/reqs.dart';
import 'package:amoora/cff/services/api_service.dart';
import 'package:amoora/features/hijri_calendar/model/hijri.dart';
import 'package:amoora/cff/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hijriDateProvider = StateProvider<Hijri?>((ref) => null);

class HijriCalendarCtrl {
  Ref ref;
  HijriCalendarCtrl(this.ref);

  Future<void> fetchHijriDate(DateTime? now) async {
    final reqs = Reqs(
      url: 'http://api.aladhan.com',
      path: '/v1/gToH/${DateTime.now().custom('d-MM-yyyy')}',
    );
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).get(reqs: reqs));

    // final state = await AsyncValue.guard(() => ref.read(hijriCalendarServiceProvider).getHijriDate());

    if (state.hasError) return;

    final dataJson = state.value['data']['hijri'];
    ref.read(hijriDateProvider.notifier).state = Hijri.fromJson(dataJson);
  }
}

final hijriCalendarCtrlProvider = StateProvider(HijriCalendarCtrl.new);
