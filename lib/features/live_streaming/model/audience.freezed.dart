// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Audience {
  int get id;
  @JsonKey(name: 'presenter_id')
  int get presenterId;
  @JsonKey(name: 'user_id')
  int get userId;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  Profile? get profile;
  DateTime? get heartbeat;
  Map<String, dynamic>? get offer;
  Map<String, dynamic>? get answer;
  String get state;

  /// Create a copy of Audience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AudienceCopyWith<Audience> get copyWith =>
      _$AudienceCopyWithImpl<Audience>(this as Audience, _$identity);

  /// Serializes this Audience to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Audience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.presenterId, presenterId) ||
                other.presenterId == presenterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            const DeepCollectionEquality().equals(other.offer, offer) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      presenterId,
      userId,
      createdAt,
      profile,
      heartbeat,
      const DeepCollectionEquality().hash(offer),
      const DeepCollectionEquality().hash(answer),
      state);

  @override
  String toString() {
    return 'Audience(id: $id, presenterId: $presenterId, userId: $userId, createdAt: $createdAt, profile: $profile, heartbeat: $heartbeat, offer: $offer, answer: $answer, state: $state)';
  }
}

/// @nodoc
abstract mixin class $AudienceCopyWith<$Res> {
  factory $AudienceCopyWith(Audience value, $Res Function(Audience) _then) =
      _$AudienceCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'presenter_id') int presenterId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      Profile? profile,
      DateTime? heartbeat,
      Map<String, dynamic>? offer,
      Map<String, dynamic>? answer,
      String state});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$AudienceCopyWithImpl<$Res> implements $AudienceCopyWith<$Res> {
  _$AudienceCopyWithImpl(this._self, this._then);

  final Audience _self;
  final $Res Function(Audience) _then;

  /// Create a copy of Audience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? presenterId = null,
    Object? userId = null,
    Object? createdAt = freezed,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? offer = freezed,
    Object? answer = freezed,
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      presenterId: null == presenterId
          ? _self.presenterId
          : presenterId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offer: freezed == offer
          ? _self.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Audience
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
class _Audience implements Audience {
  _Audience(
      {this.id = 0,
      @JsonKey(name: 'presenter_id') this.presenterId = 0,
      @JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'created_at') this.createdAt,
      this.profile,
      this.heartbeat,
      final Map<String, dynamic>? offer,
      final Map<String, dynamic>? answer,
      this.state = 'join'})
      : _offer = offer,
        _answer = answer;
  factory _Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'presenter_id')
  final int presenterId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  final Profile? profile;
  @override
  final DateTime? heartbeat;
  final Map<String, dynamic>? _offer;
  @override
  Map<String, dynamic>? get offer {
    final value = _offer;
    if (value == null) return null;
    if (_offer is EqualUnmodifiableMapView) return _offer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _answer;
  @override
  Map<String, dynamic>? get answer {
    final value = _answer;
    if (value == null) return null;
    if (_answer is EqualUnmodifiableMapView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final String state;

  /// Create a copy of Audience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AudienceCopyWith<_Audience> get copyWith =>
      __$AudienceCopyWithImpl<_Audience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AudienceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Audience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.presenterId, presenterId) ||
                other.presenterId == presenterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            const DeepCollectionEquality().equals(other._offer, _offer) &&
            const DeepCollectionEquality().equals(other._answer, _answer) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      presenterId,
      userId,
      createdAt,
      profile,
      heartbeat,
      const DeepCollectionEquality().hash(_offer),
      const DeepCollectionEquality().hash(_answer),
      state);

  @override
  String toString() {
    return 'Audience(id: $id, presenterId: $presenterId, userId: $userId, createdAt: $createdAt, profile: $profile, heartbeat: $heartbeat, offer: $offer, answer: $answer, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$AudienceCopyWith<$Res>
    implements $AudienceCopyWith<$Res> {
  factory _$AudienceCopyWith(_Audience value, $Res Function(_Audience) _then) =
      __$AudienceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'presenter_id') int presenterId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      Profile? profile,
      DateTime? heartbeat,
      Map<String, dynamic>? offer,
      Map<String, dynamic>? answer,
      String state});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$AudienceCopyWithImpl<$Res> implements _$AudienceCopyWith<$Res> {
  __$AudienceCopyWithImpl(this._self, this._then);

  final _Audience _self;
  final $Res Function(_Audience) _then;

  /// Create a copy of Audience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? presenterId = null,
    Object? userId = null,
    Object? createdAt = freezed,
    Object? profile = freezed,
    Object? heartbeat = freezed,
    Object? offer = freezed,
    Object? answer = freezed,
    Object? state = null,
  }) {
    return _then(_Audience(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      presenterId: null == presenterId
          ? _self.presenterId
          : presenterId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offer: freezed == offer
          ? _self._offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _self._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of Audience
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
