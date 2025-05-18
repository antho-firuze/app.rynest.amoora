// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Place {
  String? get id;
  String? get name;
  double get lat;
  double get lng;
  String? get image;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceCopyWith<Place> get copyWith =>
      _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Place &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lng, image);

  @override
  String toString() {
    return 'Place(id: $id, name: $name, lat: $lat, lng: $lng, image: $image)';
  }
}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) =
      _$PlaceCopyWithImpl;
  @useResult
  $Res call({String? id, String? name, double lat, double lng, String? image});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res> implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Place implements Place {
  _Place({this.id, this.name, this.lat = 0.0, this.lng = 0.0, this.image});
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

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

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceCopyWith<_Place> get copyWith =>
      __$PlaceCopyWithImpl<_Place>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Place &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lng, image);

  @override
  String toString() {
    return 'Place(id: $id, name: $name, lat: $lat, lng: $lng, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) =
      __$PlaceCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String? name, double lat, double lng, String? image});
}

/// @nodoc
class __$PlaceCopyWithImpl<$Res> implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? image = freezed,
  }) {
    return _then(_Place(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Places {
  @JsonKey(name: "data")
  List<Place>? get places;

  /// Create a copy of Places
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlacesCopyWith<Places> get copyWith =>
      _$PlacesCopyWithImpl<Places>(this as Places, _$identity);

  /// Serializes this Places to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Places &&
            const DeepCollectionEquality().equals(other.places, places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(places));

  @override
  String toString() {
    return 'Places(places: $places)';
  }
}

/// @nodoc
abstract mixin class $PlacesCopyWith<$Res> {
  factory $PlacesCopyWith(Places value, $Res Function(Places) _then) =
      _$PlacesCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: "data") List<Place>? places});
}

/// @nodoc
class _$PlacesCopyWithImpl<$Res> implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._self, this._then);

  final Places _self;
  final $Res Function(Places) _then;

  /// Create a copy of Places
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_self.copyWith(
      places: freezed == places
          ? _self.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Places implements Places {
  _Places({@JsonKey(name: "data") final List<Place>? places})
      : _places = places;
  factory _Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);

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

  /// Create a copy of Places
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlacesCopyWith<_Places> get copyWith =>
      __$PlacesCopyWithImpl<_Places>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlacesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Places &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @override
  String toString() {
    return 'Places(places: $places)';
  }
}

/// @nodoc
abstract mixin class _$PlacesCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$PlacesCopyWith(_Places value, $Res Function(_Places) _then) =
      __$PlacesCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<Place>? places});
}

/// @nodoc
class __$PlacesCopyWithImpl<$Res> implements _$PlacesCopyWith<$Res> {
  __$PlacesCopyWithImpl(this._self, this._then);

  final _Places _self;
  final $Res Function(_Places) _then;

  /// Create a copy of Places
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_Places(
      places: freezed == places
          ? _self._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
    ));
  }
}

// dart format on
