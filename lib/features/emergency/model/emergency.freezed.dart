// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Emergency {
  String? get title;
  String? get phone;
  String? get whatsapp;
  bool get enabled;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmergencyCopyWith<Emergency> get copyWith =>
      _$EmergencyCopyWithImpl<Emergency>(this as Emergency, _$identity);

  /// Serializes this Emergency to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Emergency &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, phone, whatsapp, enabled);

  @override
  String toString() {
    return 'Emergency(title: $title, phone: $phone, whatsapp: $whatsapp, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $EmergencyCopyWith<$Res> {
  factory $EmergencyCopyWith(Emergency value, $Res Function(Emergency) _then) =
      _$EmergencyCopyWithImpl;
  @useResult
  $Res call({String? title, String? phone, String? whatsapp, bool enabled});
}

/// @nodoc
class _$EmergencyCopyWithImpl<$Res> implements $EmergencyCopyWith<$Res> {
  _$EmergencyCopyWithImpl(this._self, this._then);

  final Emergency _self;
  final $Res Function(Emergency) _then;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? phone = freezed,
    Object? whatsapp = freezed,
    Object? enabled = null,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _self.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Emergency implements Emergency {
  _Emergency({this.title, this.phone, this.whatsapp, this.enabled = true});
  factory _Emergency.fromJson(Map<String, dynamic> json) =>
      _$EmergencyFromJson(json);

  @override
  final String? title;
  @override
  final String? phone;
  @override
  final String? whatsapp;
  @override
  @JsonKey()
  final bool enabled;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmergencyCopyWith<_Emergency> get copyWith =>
      __$EmergencyCopyWithImpl<_Emergency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmergencyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Emergency &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, phone, whatsapp, enabled);

  @override
  String toString() {
    return 'Emergency(title: $title, phone: $phone, whatsapp: $whatsapp, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class _$EmergencyCopyWith<$Res>
    implements $EmergencyCopyWith<$Res> {
  factory _$EmergencyCopyWith(
          _Emergency value, $Res Function(_Emergency) _then) =
      __$EmergencyCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? phone, String? whatsapp, bool enabled});
}

/// @nodoc
class __$EmergencyCopyWithImpl<$Res> implements _$EmergencyCopyWith<$Res> {
  __$EmergencyCopyWithImpl(this._self, this._then);

  final _Emergency _self;
  final $Res Function(_Emergency) _then;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? phone = freezed,
    Object? whatsapp = freezed,
    Object? enabled = null,
  }) {
    return _then(_Emergency(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _self.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
