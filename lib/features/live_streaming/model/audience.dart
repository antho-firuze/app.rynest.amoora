// ignore_for_file: invalid_annotation_target

import 'package:amoora/features/user/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audience.freezed.dart';
part 'audience.g.dart';

@freezed
class Audience with _$Audience {

  factory Audience({
    @Default(0) int id,
    @JsonKey(name: 'presenter_id') @Default(0) int presenterId,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    Profile? profile,
    DateTime? heartbeat,
    Map<String, dynamic>? offer,
    Map<String, dynamic>? answer,
    @Default('join') String state,
  }) = _Audience;

  factory Audience.fromJson(Map<String, dynamic> json) => _$AudienceFromJson(json);
}