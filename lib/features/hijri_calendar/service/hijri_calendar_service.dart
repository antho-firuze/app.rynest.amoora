import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HijriCalendarService {
  final Ref ref;
  HijriCalendarService(this.ref);

  String apiUrl = 'http://api.aladhan.com';

  static const adjDayKey = 'ADJ_DAY_KEY';

  Future getHijriDate() async {
    final url = Uri.parse(apiUrl).replace(
      path: '/v1/gToH/${DateTime.now().custom('d-MM-yyyy')}',
      queryParameters: {},
    ).toString();

    final state = await AsyncValue.guard(() async => await ref.read(dioProvider).get(url));

    return state.value?.data;
  }
}

final hijriCalendarServiceProvider = Provider(HijriCalendarService.new);
