// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JwtToken {
// @JsonKey(name: 'token_type') @Default('Bearer') String type,
// @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JwtTokenCopyWith<JwtToken> get copyWith =>
      _$JwtTokenCopyWithImpl<JwtToken>(this as JwtToken, _$identity);

  /// Serializes this JwtToken to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JwtToken &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @override
  String toString() {
    return 'JwtToken(accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class $JwtTokenCopyWith<$Res> {
  factory $JwtTokenCopyWith(JwtToken value, $Res Function(JwtToken) _then) =
      _$JwtTokenCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class _$JwtTokenCopyWithImpl<$Res> implements $JwtTokenCopyWith<$Res> {
  _$JwtTokenCopyWithImpl(this._self, this._then);

  final JwtToken _self;
  final $Res Function(JwtToken) _then;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_self.copyWith(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _JwtToken implements JwtToken {
  _JwtToken(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken});
  factory _JwtToken.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenFromJson(json);

// @JsonKey(name: 'token_type') @Default('Bearer') String type,
// @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JwtTokenCopyWith<_JwtToken> get copyWith =>
      __$JwtTokenCopyWithImpl<_JwtToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JwtTokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JwtToken &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @override
  String toString() {
    return 'JwtToken(accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$JwtTokenCopyWith<$Res>
    implements $JwtTokenCopyWith<$Res> {
  factory _$JwtTokenCopyWith(_JwtToken value, $Res Function(_JwtToken) _then) =
      __$JwtTokenCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class __$JwtTokenCopyWithImpl<$Res> implements _$JwtTokenCopyWith<$Res> {
  __$JwtTokenCopyWithImpl(this._self, this._then);

  final _JwtToken _self;
  final $Res Function(_JwtToken) _then;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_JwtToken(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
