// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_service.g.dart';

@JsonLiteral('../repository/emergency_call.json', asConst: true)
const emergencyRepo = _$emergencyRepoJsonLiteral;

class EmergencyService {
  final Ref ref;
  EmergencyService(this.ref);

  List<Map<String, Object>> fetchAll() => emergencyRepo;
}

final emergencyServiceProvider = Provider(EmergencyService.new);
