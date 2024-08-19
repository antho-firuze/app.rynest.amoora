// ignore_for_file: invalid_annotation_target

import 'package:amoora/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@freezed
class Alert with _$Alert {

  factory Alert({
    @Default(0) int id,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    String? title,
    String? body,
    String? image,
    String? topic,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_read') @IntToBoolConverter() @Default(false) bool isRead,
    @IntToBoolConverter() @Default(false) bool pinned,
    @JsonKey(name: 'pinned_duration') @Default(86400) int pinnedDuration,   // 24 hours
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}