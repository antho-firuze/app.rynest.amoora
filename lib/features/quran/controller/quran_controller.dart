import 'dart:developer';

import 'package:amoora/features/quran/controller/quran_asset_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranCtrl {
  Ref ref;
  QuranCtrl(this.ref);

  void initialize() async {
    log('Initialize Quran !');

    ref.read(quranAssetCtrlProvider).checkFileExists();
  }
}

final quranCtrlProvider = Provider(QuranCtrl.new);
