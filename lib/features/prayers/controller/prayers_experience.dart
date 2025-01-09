import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrayersOverlayNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void toggle() => state = !state;

  void hide() => state = false;

  void show() => state = true;

  void update(bool value) => state = value;
}

final prayerOverlayProvider = NotifierProvider<PrayersOverlayNotifier, bool>(PrayersOverlayNotifier.new);
