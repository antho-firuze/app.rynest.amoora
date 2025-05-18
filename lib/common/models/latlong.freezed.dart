// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latlong.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LatLong {
  double get lat;
  double get lng;

  /// Create a copy of LatLong
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LatLongCopyWith<LatLong> get copyWith =>
      _$LatLongCopyWithImpl<LatLong>(this as LatLong, _$identity);

  /// Serializes this LatLong to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LatLong &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'LatLong(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $LatLongCopyWith<$Res> {
  factory $LatLongCopyWith(LatLong value, $Res Function(LatLong) _then) =
      _$LatLongCopyWithImpl;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatLongCopyWithImpl<$Res> implements $LatLongCopyWith<$Res> {
  _$LatLongCopyWithImpl(this._self, this._then);

  final LatLong _self;
  final $Res Function(LatLong) _then;

  /// Create a copy of LatLong
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LatLong implements LatLong {
  _LatLong(this.lat, this.lng);
  factory _LatLong.fromJson(Map<String, dynamic> json) =>
      _$LatLongFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  /// Create a copy of LatLong
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LatLongCopyWith<_LatLong> get copyWith =>
      __$LatLongCopyWithImpl<_LatLong>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LatLongToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LatLong &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'LatLong(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$LatLongCopyWith<$Res> implements $LatLongCopyWith<$Res> {
  factory _$LatLongCopyWith(_LatLong value, $Res Function(_LatLong) _then) =
      __$LatLongCopyWithImpl;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$LatLongCopyWithImpl<$Res> implements _$LatLongCopyWith<$Res> {
  __$LatLongCopyWithImpl(this._self, this._then);

  final _LatLong _self;
  final $Res Function(_LatLong) _then;

  /// Create a copy of LatLong
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_LatLong(
      null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
