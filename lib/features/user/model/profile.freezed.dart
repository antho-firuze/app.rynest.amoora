// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  int? get memberId => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_phone_verified')
  @IntToBoolConverter()
  bool get isPhoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_email_verified')
  @IntToBoolConverter()
  bool get isEmailVerified => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'passport_no')
  String? get passportNo => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'member_id') int? memberId,
      String identifier,
      String name,
      @JsonKey(name: 'full_name') String fullName,
      String email,
      String phone,
      @JsonKey(name: 'is_phone_verified')
      @IntToBoolConverter()
      bool isPhoneVerified,
      @JsonKey(name: 'is_email_verified')
      @IntToBoolConverter()
      bool isEmailVerified,
      String address,
      String photo,
      @JsonKey(name: 'passport_no') String? passportNo});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? memberId = freezed,
    Object? identifier = null,
    Object? name = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? isPhoneVerified = null,
    Object? isEmailVerified = null,
    Object? address = null,
    Object? photo = null,
    Object? passportNo = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      passportNo: freezed == passportNo
          ? _value.passportNo
          : passportNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'member_id') int? memberId,
      String identifier,
      String name,
      @JsonKey(name: 'full_name') String fullName,
      String email,
      String phone,
      @JsonKey(name: 'is_phone_verified')
      @IntToBoolConverter()
      bool isPhoneVerified,
      @JsonKey(name: 'is_email_verified')
      @IntToBoolConverter()
      bool isEmailVerified,
      String address,
      String photo,
      @JsonKey(name: 'passport_no') String? passportNo});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? memberId = freezed,
    Object? identifier = null,
    Object? name = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? isPhoneVerified = null,
    Object? isEmailVerified = null,
    Object? address = null,
    Object? photo = null,
    Object? passportNo = freezed,
  }) {
    return _then(_$ProfileImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneVerified: null == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      passportNo: freezed == passportNo
          ? _value.passportNo
          : passportNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  _$ProfileImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'member_id') this.memberId,
      this.identifier = '',
      this.name = '',
      @JsonKey(name: 'full_name') this.fullName = '',
      this.email = '',
      this.phone = '',
      @JsonKey(name: 'is_phone_verified')
      @IntToBoolConverter()
      this.isPhoneVerified = false,
      @JsonKey(name: 'is_email_verified')
      @IntToBoolConverter()
      this.isEmailVerified = false,
      this.address = '',
      this.photo = '',
      @JsonKey(name: 'passport_no') this.passportNo});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'member_id')
  final int? memberId;
  @override
  @JsonKey()
  final String identifier;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey(name: 'is_phone_verified')
  @IntToBoolConverter()
  final bool isPhoneVerified;
  @override
  @JsonKey(name: 'is_email_verified')
  @IntToBoolConverter()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String photo;
  @override
  @JsonKey(name: 'passport_no')
  final String? passportNo;

  @override
  String toString() {
    return 'Profile(userId: $userId, memberId: $memberId, identifier: $identifier, name: $name, fullName: $fullName, email: $email, phone: $phone, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, address: $address, photo: $photo, passportNo: $passportNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.passportNo, passportNo) ||
                other.passportNo == passportNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      memberId,
      identifier,
      name,
      fullName,
      email,
      phone,
      isPhoneVerified,
      isEmailVerified,
      address,
      photo,
      passportNo);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {@JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'member_id') final int? memberId,
      final String identifier,
      final String name,
      @JsonKey(name: 'full_name') final String fullName,
      final String email,
      final String phone,
      @JsonKey(name: 'is_phone_verified')
      @IntToBoolConverter()
      final bool isPhoneVerified,
      @JsonKey(name: 'is_email_verified')
      @IntToBoolConverter()
      final bool isEmailVerified,
      final String address,
      final String photo,
      @JsonKey(name: 'passport_no') final String? passportNo}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'member_id')
  int? get memberId;
  @override
  String get identifier;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get email;
  @override
  String get phone;
  @override
  @JsonKey(name: 'is_phone_verified')
  @IntToBoolConverter()
  bool get isPhoneVerified;
  @override
  @JsonKey(name: 'is_email_verified')
  @IntToBoolConverter()
  bool get isEmailVerified;
  @override
  String get address;
  @override
  String get photo;
  @override
  @JsonKey(name: 'passport_no')
  String? get passportNo;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
