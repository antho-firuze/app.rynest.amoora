import 'package:amoora/features/hijri_calendar/model/hijri.dart';
import 'package:amoora/features/hijri_calendar/service/hijri_calendar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hijriDateProvider = StateProvider<Hijri?>((ref) => null);

class HijriCalendarCtrl {
  Ref ref;
  HijriCalendarCtrl(this.ref);

  Future<void> getHijriDate(DateTime? now) async {
    final state = await AsyncValue.guard(() => ref.read(hijriCalendarServiceProvider).getHijriDate());

    if (state.hasError) return;

    final dataJson = state.value['data']['hijri'];
    ref.read(hijriDateProvider.notifier).state  = Hijri.fromJson(dataJson);
  }
}

final hijriCalendarCtrlProvider = StateProvider(HijriCalendarCtrl.new);
