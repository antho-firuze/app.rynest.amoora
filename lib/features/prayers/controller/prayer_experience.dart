import 'package:flutter_riverpod/flutter_riverpod.dart';

final prayerOverlayProvider =
    NotifierProvider<PrayersOverlayNotifier, bool>(PrayersOverlayNotifier.new);

class PrayersOverlayNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
