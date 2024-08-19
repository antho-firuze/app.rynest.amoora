// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Airline _$AirlineFromJson(Map<String, dynamic> json) {
  return _Airline.fromJson(json);
}

/// @nodoc
mixin _$Airline {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'airline_id')
  int? get airlineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  DateTime? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  DateTime? get checkOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirlineCopyWith<Airline> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineCopyWith<$Res> {
  factory $AirlineCopyWith(Airline value, $Res Function(Airline) then) =
      _$AirlineCopyWithImpl<$Res, Airline>;
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
class _$AirlineCopyWithImpl<$Res, $Val extends Airline>
    implements $AirlineCopyWith<$Res> {
  _$AirlineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      airlineId: freezed == airlineId
          ? _value.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirlineImplCopyWith<$Res> implements $AirlineCopyWith<$Res> {
  factory _$$AirlineImplCopyWith(
          _$AirlineImpl value, $Res Function(_$AirlineImpl) then) =
      __$$AirlineImplCopyWithImpl<$Res>;
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
class __$$AirlineImplCopyWithImpl<$Res>
    extends _$AirlineCopyWithImpl<$Res, _$AirlineImpl>
    implements _$$AirlineImplCopyWith<$Res> {
  __$$AirlineImplCopyWithImpl(
      _$AirlineImpl _value, $Res Function(_$AirlineImpl) _then)
      : super(_value, _then);

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
    return _then(_$AirlineImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      airlineId: freezed == airlineId
          ? _value.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AirlineImpl implements _Airline {
  _$AirlineImpl(
      {this.id,
      @JsonKey(name: 'airline_id') this.airlineId,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'image') this.image = '',
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_out') this.checkOut});

  factory _$AirlineImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirlineImplFromJson(json);

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

  @override
  String toString() {
    return 'Airline(id: $id, airlineId: $airlineId, name: $name, code: $code, image: $image, checkIn: $checkIn, checkOut: $checkOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirlineImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, airlineId, name, code, image, checkIn, checkOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirlineImplCopyWith<_$AirlineImpl> get copyWith =>
      __$$AirlineImplCopyWithImpl<_$AirlineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirlineImplToJson(
      this,
    );
  }
}

abstract class _Airline implements Airline {
  factory _Airline(
      {final int? id,
      @JsonKey(name: 'airline_id') final int? airlineId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'code') final String code,
      @JsonKey(name: 'image') final String image,
      @JsonKey(name: 'check_in') final DateTime? checkIn,
      @JsonKey(name: 'check_out') final DateTime? checkOut}) = _$AirlineImpl;

  factory _Airline.fromJson(Map<String, dynamic> json) = _$AirlineImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'airline_id')
  int? get airlineId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'check_in')
  DateTime? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  DateTime? get checkOut;
  @override
  @JsonKey(ignore: true)
  _$$AirlineImplCopyWith<_$AirlineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
