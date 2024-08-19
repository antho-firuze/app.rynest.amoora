import 'dart:developer';

import 'package:amoora/features/emergency/model/emergency.dart';
import 'package:amoora/features/emergency/service/emergency_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emergenciesProvider =
    FutureProvider<List<Emergency>>((ref) async => await ref.read(emergencyCtrlProvider).fetchAll());

class EmergencyCtrl {
  Ref ref;
  EmergencyCtrl(this.ref);

  Future<List<Emergency>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<Map<String, Object>> jsonList = ref.read(emergencyServiceProvider).fetchAll();
    List<Emergency> emergencies = jsonList.map(Emergency.fromJson).toList();

    emergencies.removeWhere((value) => value.enabled == false);
    log(":: emergencies => ${emergencies.length}");
    return emergencies;
  }
}

final emergencyCtrlProvider = Provider(EmergencyCtrl.new);
