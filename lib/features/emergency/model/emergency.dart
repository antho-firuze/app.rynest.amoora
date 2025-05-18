// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency.freezed.dart';
part 'emergency.g.dart';

@freezed
abstract class Emergency with _$Emergency {
  factory Emergency({
    String? title,
    String? phone,
    String? whatsapp,
    @Default(true) bool enabled,
  }) = _Emergency;

  factory Emergency.fromJson(Map<String, dynamic> json) => _$EmergencyFromJson(json);
}

// @freezed
// class Emergencies with _$Emergencies {

//   factory Emergencies({
//     @JsonKey(name: 'data') required List<Emergency> emergencies,
//   }) = _Emergencies;

//   factory Emergencies.fromJson(Map<String, dynamic> json) => _$EmergenciesFromJson(json);
// }