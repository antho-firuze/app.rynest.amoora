// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Member {
  int get id;
  double get lat;
  double get lng;
  String get label;
  @JsonKey(name: 'user_id')
  int get userId;
  Profile? get profile;
  DateTime? get heartbeat;
  double get distance;
  bool get isOutOfRange;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberCopyWith<Member> get copyWith =>
      _$MemberCopyWithImpl<Member>(this as Member, _$identity);

  /// Serializes this Member to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Member &&
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

  @override
  String toString() {
    return 'Member(id: $id, lat: $lat, lng: $lng, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, distance: $distance, isOutOfRange: $isOutOfRange)';
  }
}

/// @nodoc
abstract mixin class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) _then) =
      _$MemberCopyWithImpl;
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
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._self, this._then);

  final Member _self;
  final $Res Function(Member) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
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
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isOutOfRange: null == isOutOfRange
          ? _self.isOutOfRange
          : isOutOfRange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Member
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
class _Member implements Member {
  _Member(
      {this.id = 0,
      this.lat = 0.0,
      this.lng = 0.0,
      this.label = '',
      @JsonKey(name: 'user_id') this.userId = 0,
      this.profile,
      this.heartbeat,
      this.distance = 0.0,
      this.isOutOfRange = false});
  factory _Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

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

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Member &&
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

  @override
  String toString() {
    return 'Member(id: $id, lat: $lat, lng: $lng, label: $label, userId: $userId, profile: $profile, heartbeat: $heartbeat, distance: $distance, isOutOfRange: $isOutOfRange)';
  }
}

/// @nodoc
abstract mixin class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) _then) =
      __$MemberCopyWithImpl;
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
class __$MemberCopyWithImpl<$Res> implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(this._self, this._then);

  final _Member _self;
  final $Res Function(_Member) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Member(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
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
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isOutOfRange: null == isOutOfRange
          ? _self.isOutOfRange
          : isOutOfRange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Member
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
