// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Audience _$AudienceFromJson(Map<String, dynamic> json) {
  return _Audience.fromJson(json);
}

/// @nodoc
mixin _$Audience {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'presenter_id')
  int get presenterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  DateTime? get heartbeat => throw _privateConstructorUsedError;
  Map<String, dynamic>? get offer => throw _privateConstructorUsedError;
  Map<String, dynamic>? get answer => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudienceCopyWith<Audience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudienceCopyWith<$Res> {
  factory $AudienceCopyWith(Audience value, $Res Function(Audience) then) =
      _$AudienceCopyWithImpl<$Res, Audience>;
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
class _$AudienceCopyWithImpl<$Res, $Val extends Audience>
    implements $AudienceCopyWith<$Res> {
  _$AudienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      presenterId: null == presenterId
          ? _value.presenterId
          : presenterId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _value.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

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
abstract class _$$AudienceImplCopyWith<$Res>
    implements $AudienceCopyWith<$Res> {
  factory _$$AudienceImplCopyWith(
          _$AudienceImpl value, $Res Function(_$AudienceImpl) then) =
      __$$AudienceImplCopyWithImpl<$Res>;
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
class __$$AudienceImplCopyWithImpl<$Res>
    extends _$AudienceCopyWithImpl<$Res, _$AudienceImpl>
    implements _$$AudienceImplCopyWith<$Res> {
  __$$AudienceImplCopyWithImpl(
      _$AudienceImpl _value, $Res Function(_$AudienceImpl) _then)
      : super(_value, _then);

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
    return _then(_$AudienceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      presenterId: null == presenterId
          ? _value.presenterId
          : presenterId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      heartbeat: freezed == heartbeat
          ? _value.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offer: freezed == offer
          ? _value._offer
          : offer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudienceImpl implements _Audience {
  _$AudienceImpl(
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

  factory _$AudienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudienceImplFromJson(json);

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

  @override
  String toString() {
    return 'Audience(id: $id, presenterId: $presenterId, userId: $userId, createdAt: $createdAt, profile: $profile, heartbeat: $heartbeat, offer: $offer, answer: $answer, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudienceImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudienceImplCopyWith<_$AudienceImpl> get copyWith =>
      __$$AudienceImplCopyWithImpl<_$AudienceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudienceImplToJson(
      this,
    );
  }
}

abstract class _Audience implements Audience {
  factory _Audience(
      {final int id,
      @JsonKey(name: 'presenter_id') final int presenterId,
      @JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      final Profile? profile,
      final DateTime? heartbeat,
      final Map<String, dynamic>? offer,
      final Map<String, dynamic>? answer,
      final String state}) = _$AudienceImpl;

  factory _Audience.fromJson(Map<String, dynamic> json) =
      _$AudienceImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'presenter_id')
  int get presenterId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  Profile? get profile;
  @override
  DateTime? get heartbeat;
  @override
  Map<String, dynamic>? get offer;
  @override
  Map<String, dynamic>? get answer;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$AudienceImplCopyWith<_$AudienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
