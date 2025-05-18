// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Airline {
  int? get id;
  @JsonKey(name: 'airline_id')
  int? get airlineId;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'code')
  String get code;
  @JsonKey(name: 'image')
  String get image;
  @JsonKey(name: 'check_in')
  DateTime? get checkIn;
  @JsonKey(name: 'check_out')
  DateTime? get checkOut;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AirlineCopyWith<Airline> get copyWith =>
      _$AirlineCopyWithImpl<Airline>(this as Airline, _$identity);

  /// Serializes this Airline to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Airline &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.airlineId, airlineId) ||
                other.airlineId == airlineId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, airlineId, name, code, image, checkIn, checkOut);

  @override
  String toString() {
    return 'Airline(id: $id, airlineId: $airlineId, name: $name, code: $code, image: $image, checkIn: $checkIn, checkOut: $checkOut)';
  }
}

/// @nodoc
abstract mixin class $AirlineCopyWith<$Res> {
  factory $AirlineCopyWith(Airline value, $Res Function(Airline) _then) =
      _$AirlineCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'airline_id') int? airlineId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'check_in') DateTime? checkIn,
      @JsonKey(name: 'check_out') DateTime? checkOut});
}

/// @nodoc
class _$AirlineCopyWithImpl<$Res> implements $AirlineCopyWith<$Res> {
  _$AirlineCopyWithImpl(this._self, this._then);

  final Airline _self;
  final $Res Function(Airline) _then;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? airlineId = freezed,
    Object? name = null,
    Object? code = null,
    Object? image = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      airlineId: freezed == airlineId
          ? _self.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Airline implements Airline {
  _Airline(
      {this.id,
      @JsonKey(name: 'airline_id') this.airlineId,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'image') this.image = '',
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_out') this.checkOut});
  factory _Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'airline_id')
  final int? airlineId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'check_in')
  final DateTime? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final DateTime? checkOut;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AirlineCopyWith<_Airline> get copyWith =>
      __$AirlineCopyWithImpl<_Airline>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AirlineToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Airline &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.airlineId, airlineId) ||
                other.airlineId == airlineId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, airlineId, name, code, image, checkIn, checkOut);

  @override
  String toString() {
    return 'Airline(id: $id, airlineId: $airlineId, name: $name, code: $code, image: $image, checkIn: $checkIn, checkOut: $checkOut)';
  }
}

/// @nodoc
abstract mixin class _$AirlineCopyWith<$Res> implements $AirlineCopyWith<$Res> {
  factory _$AirlineCopyWith(_Airline value, $Res Function(_Airline) _then) =
      __$AirlineCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'airline_id') int? airlineId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'check_in') DateTime? checkIn,
      @JsonKey(name: 'check_out') DateTime? checkOut});
}

/// @nodoc
class __$AirlineCopyWithImpl<$Res> implements _$AirlineCopyWith<$Res> {
  __$AirlineCopyWithImpl(this._self, this._then);

  final _Airline _self;
  final $Res Function(_Airline) _then;

  /// Create a copy of Airline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? airlineId = freezed,
    Object? name = null,
    Object? code = null,
    Object? image = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_Airline(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      airlineId: freezed == airlineId
          ? _self.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
