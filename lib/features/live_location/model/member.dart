// ignore_for_file: invalid_annotation_target

import 'package:amoora/features/user/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
abstract class Member with _$Member {
  factory Member({
    @Default(0) int id,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
    @Default('') String label,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    Profile? profile,
    DateTime? heartbeat,
    @Default(0.0) double distance,
    @Default(false) bool isOutOfRange,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}