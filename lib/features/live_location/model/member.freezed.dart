// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  DateTime? get heartbeat => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  bool get isOutOfRange => throw _privateConstructorUsedError;

  /// Serializes this Member to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {int id,
      double lat,
      double lng,
      String label,
      @JsonKey(name: 'user_id') int userId,
      Profile? profile,
      DateTime? heartbeat,
      double distance,
      bool isOutOfRange});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? label = null,
    Object? userId = null,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? distance = null,
    Object? isOutOfRange = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
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
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isOutOfRange: null == isOutOfRange
          ? _value.isOutOfRange
          : isOutOfRange // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Member
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
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double lat,
      double lng,
      String label,
      @JsonKey(name: 'user_id') int userId,
      Profile? profile,
      DateTime? heartbeat,
      double distance,
      bool isOutOfRange});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? label = null,
    Object? userId = null,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? distance = null,
    Object? isOutOfRange = null,
  }) {
    return _then(_$MemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
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
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isOutOfRange: null == isOutOfRange
          ? _value.isOutOfRange
          : isOutOfRange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl implements _Member {
  _$MemberImpl(
      {this.id = 0,
      this.lat = 0.0,
      this.lng = 0.0,
      this.label = '',
      @JsonKey(name: 'user_id') this.userId = 0,
      this.profile,
      this.heartbeat,
      this.distance = 0.0,
      this.isOutOfRange = false});

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;
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
  final double distance;
  @override
  @JsonKey()
  final bool isOutOfRange;

  @override
  String toString() {
    return 'Member(id: $id, lat: $lat, lng: $lng, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, distance: $distance, isOutOfRange: $isOutOfRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.isOutOfRange, isOutOfRange) ||
                other.isOutOfRange == isOutOfRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lat, lng, label, userId,
      profile, heartbeat, distance, isOutOfRange);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member implements Member {
  factory _Member(
      {final int id,
      final double lat,
      final double lng,
      final String label,
      @JsonKey(name: 'user_id') final int userId,
      final Profile? profile,
      final DateTime? heartbeat,
      final double distance,
      final bool isOutOfRange}) = _$MemberImpl;

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  int get id;
  @override
  double get lat;
  @override
  double get lng;
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
  double get distance;
  @override
  bool get isOutOfRange;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
