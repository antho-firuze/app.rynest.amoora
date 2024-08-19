// ignore_for_file: invalid_annotation_target

import 'package:amoora/features/user/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presenter.freezed.dart';
part 'presenter.g.dart';

@freezed
class Presenter with _$Presenter {

  factory Presenter({
    @Default(0) int id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default('') String label,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    Profile? profile,
    DateTime? heartbeat,
    @Default('active') String state,
    // @Default('') String session,
    // @Default('') String channel,
    // @JsonKey(name: 'ip_address') @Default('') String ipAddress,
    // @JsonKey(name: 'ip_broadcast') @Default('') String ipBroadcast,
    // @Default(0) int port,
  }) = _Presenter;

  factory Presenter.fromJson(Map<String, dynamic> json) => _$PresenterFromJson(json);
}