import 'dart:developer';

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final qiblaServiceProvider = Provider(QiblaService.new);

class QiblaService {
  final Ref ref;

  QiblaService(this.ref);

  Future<bool> checkDeviceSensorSupport() async {
    log('checkDeviceSensorSupport');
    bool result = await FlutterQiblah.androidDeviceSensorSupport() ?? false;
    return result;
  }
}