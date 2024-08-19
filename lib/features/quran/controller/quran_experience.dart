import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranOverlayNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

class QuranToastNotifier extends Notifier<bool> {
  int _hizbQuarter = 0;

  @override
  bool build() => false;

  void update(int newHizbQuarter) {
    if (_hizbQuarter != newHizbQuarter) {
      showToast();
    }
    _hizbQuarter = newHizbQuarter;
  }

  Future<void> showToast() async {
    await Future.delayed(Duration.zero);
    state = true;

    await Future.delayed(const Duration(milliseconds: 1500));

    state = false;
  }
}

final quranOverlayProvider = NotifierProvider<QuranOverlayNotifier, bool>(QuranOverlayNotifier.new);

final quranToastProvider = NotifierProvider<QuranToastNotifier, bool>(QuranToastNotifier.new);
