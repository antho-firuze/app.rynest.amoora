// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  @JsonKey(name: 'user_id')
  int? get userId;
  @JsonKey(name: 'member_id')
  int? get memberId;
  String get identifier;
  String get name;
  @JsonKey(name: 'full_name')
  String get fullName;
  String get email;
  String get phone;
  @JsonKey(name: 'is_phone_verified')
  @JsonBoolConverter()
  bool get isPhoneVerified;
  @JsonKey(name: 'is_email_verified')
  @JsonBoolConverter()
  bool get isEmailVerified;
  String get address;
  String get photo;
  @JsonKey(name: 'passport_no')
  String? get passportNo;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
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

  @override
  String toString() {
    return 'Profile(userId: $userId, memberId: $memberId, identifier: $identifier, name: $name, fullName: $fullName, email: $email, phone: $phone, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, address: $address, photo: $photo, passportNo: $passportNo)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
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
      @JsonBoolConverter()
      bool isPhoneVerified,
      @JsonKey(name: 'is_email_verified')
      @JsonBoolConverter()
      bool isEmailVerified,
      String address,
      String photo,
      @JsonKey(name: 'passport_no') String? passportNo});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

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
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _self.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneVerified: null == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      passportNo: freezed == passportNo
          ? _self.passportNo
          : passportNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Profile implements Profile {
  _Profile(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'member_id') this.memberId,
      this.identifier = '',
      this.name = '',
      @JsonKey(name: 'full_name') this.fullName = '',
      this.email = '',
      this.phone = '',
      @JsonKey(name: 'is_phone_verified')
      @JsonBoolConverter()
      this.isPhoneVerified = false,
      @JsonKey(name: 'is_email_verified')
      @JsonBoolConverter()
      this.isEmailVerified = false,
      this.address = '',
      this.photo = '',
      @JsonKey(name: 'passport_no') this.passportNo});
  factory _Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

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
  @JsonBoolConverter()
  final bool isPhoneVerified;
  @override
  @JsonKey(name: 'is_email_verified')
  @JsonBoolConverter()
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

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
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

  @override
  String toString() {
    return 'Profile(userId: $userId, memberId: $memberId, identifier: $identifier, name: $name, fullName: $fullName, email: $email, phone: $phone, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, address: $address, photo: $photo, passportNo: $passportNo)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
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
      @JsonBoolConverter()
      bool isPhoneVerified,
      @JsonKey(name: 'is_email_verified')
      @JsonBoolConverter()
      bool isEmailVerified,
      String address,
      String photo,
      @JsonKey(name: 'passport_no') String? passportNo});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Profile(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _self.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneVerified: null == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      passportNo: freezed == passportNo
          ? _self.passportNo
          : passportNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
