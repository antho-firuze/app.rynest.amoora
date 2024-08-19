import 'package:amoora/features/prayers/model/prayer.dart';
import 'package:amoora/features/prayers/service/prayer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final prayerIndexProvider = StateProvider<int>((ref) => 0);

final prayersCtrlProvider =
    NotifierProvider.autoDispose<PrayersCtrl, List<Prayer>>(PrayersCtrl.new);

class PrayersCtrl extends AutoDisposeNotifier<List<Prayer>> {
  @override
  List<Prayer> build() => _fetchData();

  List<Prayer> _fetchData() => ref.read(prayerServiceProvider).getPrayers();
}
