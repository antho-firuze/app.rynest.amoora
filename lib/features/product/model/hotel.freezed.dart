// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return _Hotel.fromJson(json);
}

/// @nodoc
mixin _$Hotel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'hotel_id')
  int? get hotelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  @StringToIntConverter()
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'link_map')
  String get linkMap => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  DateTime? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  DateTime? get checkOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelCopyWith<Hotel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelCopyWith<$Res> {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) then) =
      _$HotelCopyWithImpl<$Res, Hotel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'hotel_id') int? hotelId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'rating') @StringToIntConverter() int rating,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'link_map') String linkMap,
      @JsonKey(name: 'check_in') DateTime? checkIn,
      @JsonKey(name: 'check_out') DateTime? checkOut});
}

/// @nodoc
class _$HotelCopyWithImpl<$Res, $Val extends Hotel>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? name = null,
    Object? rating = null,
    Object? address = null,
    Object? linkMap = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      hotelId: freezed == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      linkMap: null == linkMap
          ? _value.linkMap
          : linkMap // ignore: cast_nullable_to_non_nullable
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
abstract class _$$HotelImplCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$$HotelImplCopyWith(
          _$HotelImpl value, $Res Function(_$HotelImpl) then) =
      __$$HotelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'hotel_id') int? hotelId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'rating') @StringToIntConverter() int rating,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'link_map') String linkMap,
      @JsonKey(name: 'check_in') DateTime? checkIn,
      @JsonKey(name: 'check_out') DateTime? checkOut});
}

/// @nodoc
class __$$HotelImplCopyWithImpl<$Res>
    extends _$HotelCopyWithImpl<$Res, _$HotelImpl>
    implements _$$HotelImplCopyWith<$Res> {
  __$$HotelImplCopyWithImpl(
      _$HotelImpl _value, $Res Function(_$HotelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? hotelId = freezed,
    Object? name = null,
    Object? rating = null,
    Object? address = null,
    Object? linkMap = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_$HotelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      hotelId: freezed == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      linkMap: null == linkMap
          ? _value.linkMap
          : linkMap // ignore: cast_nullable_to_non_nullable
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
class _$HotelImpl implements _Hotel {
  _$HotelImpl(
      {this.id,
      @JsonKey(name: 'hotel_id') this.hotelId,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'rating') @StringToIntConverter() this.rating = 3,
      @JsonKey(name: 'address') this.address = '',
      @JsonKey(name: 'link_map') this.linkMap = '',
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_out') this.checkOut});

  factory _$HotelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'hotel_id')
  final int? hotelId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'rating')
  @StringToIntConverter()
  final int rating;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'link_map')
  final String linkMap;
  @override
  @JsonKey(name: 'check_in')
  final DateTime? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final DateTime? checkOut;

  @override
  String toString() {
    return 'Hotel(id: $id, hotelId: $hotelId, name: $name, rating: $rating, address: $address, linkMap: $linkMap, checkIn: $checkIn, checkOut: $checkOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hotelId, hotelId) || other.hotelId == hotelId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.linkMap, linkMap) || other.linkMap == linkMap) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, hotelId, name, rating,
      address, linkMap, checkIn, checkOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      __$$HotelImplCopyWithImpl<_$HotelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelImplToJson(
      this,
    );
  }
}

abstract class _Hotel implements Hotel {
  factory _Hotel(
      {final int? id,
      @JsonKey(name: 'hotel_id') final int? hotelId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'rating') @StringToIntConverter() final int rating,
      @JsonKey(name: 'address') final String address,
      @JsonKey(name: 'link_map') final String linkMap,
      @JsonKey(name: 'check_in') final DateTime? checkIn,
      @JsonKey(name: 'check_out') final DateTime? checkOut}) = _$HotelImpl;

  factory _Hotel.fromJson(Map<String, dynamic> json) = _$HotelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'hotel_id')
  int? get hotelId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'rating')
  @StringToIntConverter()
  int get rating;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'link_map')
  String get linkMap;
  @override
  @JsonKey(name: 'check_in')
  DateTime? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  DateTime? get checkOut;
  @override
  @JsonKey(ignore: true)
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
