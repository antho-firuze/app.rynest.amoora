import 'dart:convert';
import 'dart:developer';

import 'package:amoora/features/emergency/model/emergency.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchEmergenciesProvider = FutureProvider<List<Emergency>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/emergency_call.json');
  List<dynamic>? jsonList = await jsonDecode(response);

  log('fetchEmergenciesProvider : $jsonList', name: 'EMERGENCY-CTRL');
  final result = jsonList?.map((e) => Emergency.fromJson(e)).toList();

  return result;
});
