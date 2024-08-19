// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call({String? id, String? name, double lat, double lng, String? image});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, double lat, double lng, String? image});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? image = freezed,
  }) {
    return _then(_$PlaceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl implements _Place {
  _$PlaceImpl({this.id, this.name, this.lat = 0.0, this.lng = 0.0, this.image});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;
  @override
  final String? image;

  @override
  String toString() {
    return 'Place(id: $id, name: $name, lat: $lat, lng: $lng, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lng, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  factory _Place(
      {final String? id,
      final String? name,
      final double lat,
      final double lng,
      final String? image}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Places _$PlacesFromJson(Map<String, dynamic> json) {
  return _Places.fromJson(json);
}

/// @nodoc
mixin _$Places {
  @JsonKey(name: "data")
  List<Place>? get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesCopyWith<Places> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesCopyWith<$Res> {
  factory $PlacesCopyWith(Places value, $Res Function(Places) then) =
      _$PlacesCopyWithImpl<$Res, Places>;
  @useResult
  $Res call({@JsonKey(name: "data") List<Place>? places});
}

/// @nodoc
class _$PlacesCopyWithImpl<$Res, $Val extends Places>
    implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_value.copyWith(
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacesImplCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$$PlacesImplCopyWith(
          _$PlacesImpl value, $Res Function(_$PlacesImpl) then) =
      __$$PlacesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<Place>? places});
}

/// @nodoc
class __$$PlacesImplCopyWithImpl<$Res>
    extends _$PlacesCopyWithImpl<$Res, _$PlacesImpl>
    implements _$$PlacesImplCopyWith<$Res> {
  __$$PlacesImplCopyWithImpl(
      _$PlacesImpl _value, $Res Function(_$PlacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_$PlacesImpl(
      places: freezed == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacesImpl implements _Places {
  _$PlacesImpl({@JsonKey(name: "data") final List<Place>? places})
      : _places = places;

  factory _$PlacesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacesImplFromJson(json);

  final List<Place>? _places;
  @override
  @JsonKey(name: "data")
  List<Place>? get places {
    final value = _places;
    if (value == null) return null;
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Places(places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesImpl &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesImplCopyWith<_$PlacesImpl> get copyWith =>
      __$$PlacesImplCopyWithImpl<_$PlacesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacesImplToJson(
      this,
    );
  }
}

abstract class _Places implements Places {
  factory _Places({@JsonKey(name: "data") final List<Place>? places}) =
      _$PlacesImpl;

  factory _Places.fromJson(Map<String, dynamic> json) = _$PlacesImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<Place>? get places;
  @override
  @JsonKey(ignore: true)
  _$$PlacesImplCopyWith<_$PlacesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
