// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presenter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Presenter {
  int get id;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  String get label;
  @JsonKey(name: 'user_id')
  int get userId;
  Profile? get profile;
  DateTime? get heartbeat;
  String get state;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenterCopyWith<Presenter> get copyWith =>
      _$PresenterCopyWithImpl<Presenter>(this as Presenter, _$identity);

  /// Serializes this Presenter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Presenter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, label, userId, profile, heartbeat, state);

  @override
  String toString() {
    return 'Presenter(id: $id, createdAt: $createdAt, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, state: $state)';
  }
}

/// @nodoc
abstract mixin class $PresenterCopyWith<$Res> {
  factory $PresenterCopyWith(Presenter value, $Res Function(Presenter) _then) =
      _$PresenterCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String label,
      @JsonKey(name: 'user_id') int userId,
      Profile? profile,
      DateTime? heartbeat,
      String state});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$PresenterCopyWithImpl<$Res> implements $PresenterCopyWith<$Res> {
  _$PresenterCopyWithImpl(this._self, this._then);

  final Presenter _self;
  final $Res Function(Presenter) _then;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? label = null,
    Object? userId = null,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Presenter implements Presenter {
  _Presenter(
      {this.id = 0,
      @JsonKey(name: 'created_at') this.createdAt,
      this.label = '',
      @JsonKey(name: 'user_id') this.userId = 0,
      this.profile,
      this.heartbeat,
      this.state = 'active'});
  factory _Presenter.fromJson(Map<String, dynamic> json) =>
      _$PresenterFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final Profile? profile;
  @override
  final DateTime? heartbeat;
  @override
  @JsonKey()
  final String state;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PresenterCopyWith<_Presenter> get copyWith =>
      __$PresenterCopyWithImpl<_Presenter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PresenterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Presenter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, label, userId, profile, heartbeat, state);

  @override
  String toString() {
    return 'Presenter(id: $id, createdAt: $createdAt, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$PresenterCopyWith<$Res>
    implements $PresenterCopyWith<$Res> {
  factory _$PresenterCopyWith(
          _Presenter value, $Res Function(_Presenter) _then) =
      __$PresenterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String label,
      @JsonKey(name: 'user_id') int userId,
      Profile? profile,
      DateTime? heartbeat,
      String state});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$PresenterCopyWithImpl<$Res> implements _$PresenterCopyWith<$Res> {
  __$PresenterCopyWithImpl(this._self, this._then);

  final _Presenter _self;
  final $Res Function(_Presenter) _then;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = freezed,
    Object? label = null,
    Object? userId = null,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? state = null,
  }) {
    return _then(_Presenter(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
