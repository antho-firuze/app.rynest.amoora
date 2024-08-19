import 'package:amoora/common/models/latlong.dart';
import 'package:amoora/env/env.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrayerTimesService {
  final Ref ref;
  PrayerTimesService(this.ref);

  String apiUrl = Env.prayerTimeRepoUrl;

  Future getPrayerTimes(LatLong latLong) async {
    final url = Uri.parse(apiUrl).replace(
      path: '/v1/timings/${DateTime.now().custom('d-MM-yyyy')}',
      queryParameters: {
        'latitude': latLong.lat.toString(),
        'longitude': latLong.lng.toString(),
        'method': '20',
      },
    ).toString();

    final state = await AsyncValue.guard(() async => await ref.read(dioProvider).get(url));

    return state.value?.data;
  }
}

final prayerTimesServiceProvider = Provider(PrayerTimesService.new);
