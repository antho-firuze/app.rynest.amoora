// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presenter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Presenter _$PresenterFromJson(Map<String, dynamic> json) {
  return _Presenter.fromJson(json);
}

/// @nodoc
mixin _$Presenter {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  DateTime? get heartbeat => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  /// Serializes this Presenter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresenterCopyWith<Presenter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenterCopyWith<$Res> {
  factory $PresenterCopyWith(Presenter value, $Res Function(Presenter) then) =
      _$PresenterCopyWithImpl<$Res, Presenter>;
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
class _$PresenterCopyWithImpl<$Res, $Val extends Presenter>
    implements $PresenterCopyWith<$Res> {
  _$PresenterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _value.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PresenterImplCopyWith<$Res>
    implements $PresenterCopyWith<$Res> {
  factory _$$PresenterImplCopyWith(
          _$PresenterImpl value, $Res Function(_$PresenterImpl) then) =
      __$$PresenterImplCopyWithImpl<$Res>;
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
class __$$PresenterImplCopyWithImpl<$Res>
    extends _$PresenterCopyWithImpl<$Res, _$PresenterImpl>
    implements _$$PresenterImplCopyWith<$Res> {
  __$$PresenterImplCopyWithImpl(
      _$PresenterImpl _value, $Res Function(_$PresenterImpl) _then)
      : super(_value, _then);

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
    return _then(_$PresenterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _value.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenterImpl implements _Presenter {
  _$PresenterImpl(
      {this.id = 0,
      @JsonKey(name: 'created_at') this.createdAt,
      this.label = '',
      @JsonKey(name: 'user_id') this.userId = 0,
      this.profile,
      this.heartbeat,
      this.state = 'active'});

  factory _$PresenterImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenterImplFromJson(json);

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

  @override
  String toString() {
    return 'Presenter(id: $id, createdAt: $createdAt, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenterImpl &&
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

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenterImplCopyWith<_$PresenterImpl> get copyWith =>
      __$$PresenterImplCopyWithImpl<_$PresenterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenterImplToJson(
      this,
    );
  }
}

abstract class _Presenter implements Presenter {
  factory _Presenter(
      {final int id,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      final String label,
      @JsonKey(name: 'user_id') final int userId,
      final Profile? profile,
      final DateTime? heartbeat,
      final String state}) = _$PresenterImpl;

  factory _Presenter.fromJson(Map<String, dynamic> json) =
      _$PresenterImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  String get label;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  Profile? get profile;
  @override
  DateTime? get heartbeat;
  @override
  String get state;

  /// Create a copy of Presenter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenterImplCopyWith<_$PresenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
