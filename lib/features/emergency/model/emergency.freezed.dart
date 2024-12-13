// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Emergency _$EmergencyFromJson(Map<String, dynamic> json) {
  return _Emergency.fromJson(json);
}

/// @nodoc
mixin _$Emergency {
  String? get title => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get whatsapp => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  /// Serializes this Emergency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyCopyWith<Emergency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyCopyWith<$Res> {
  factory $EmergencyCopyWith(Emergency value, $Res Function(Emergency) then) =
      _$EmergencyCopyWithImpl<$Res, Emergency>;
  @useResult
  $Res call({String? title, String? phone, String? whatsapp, bool enabled});
}

/// @nodoc
class _$EmergencyCopyWithImpl<$Res, $Val extends Emergency>
    implements $EmergencyCopyWith<$Res> {
  _$EmergencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyImplCopyWith<$Res>
    implements $EmergencyCopyWith<$Res> {
  factory _$$EmergencyImplCopyWith(
          _$EmergencyImpl value, $Res Function(_$EmergencyImpl) then) =
      __$$EmergencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? phone, String? whatsapp, bool enabled});
}

/// @nodoc
class __$$EmergencyImplCopyWithImpl<$Res>
    extends _$EmergencyCopyWithImpl<$Res, _$EmergencyImpl>
    implements _$$EmergencyImplCopyWith<$Res> {
  __$$EmergencyImplCopyWithImpl(
      _$EmergencyImpl _value, $Res Function(_$EmergencyImpl) _then)
      : super(_value, _then);

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
    return _then(_$EmergencyImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyImpl implements _Emergency {
  _$EmergencyImpl({this.title, this.phone, this.whatsapp, this.enabled = true});

  factory _$EmergencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyImplFromJson(json);

  @override
  final String? title;
  @override
  final String? phone;
  @override
  final String? whatsapp;
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'Emergency(title: $title, phone: $phone, whatsapp: $whatsapp, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, phone, whatsapp, enabled);

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyImplCopyWith<_$EmergencyImpl> get copyWith =>
      __$$EmergencyImplCopyWithImpl<_$EmergencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyImplToJson(
      this,
    );
  }
}

abstract class _Emergency implements Emergency {
  factory _Emergency(
      {final String? title,
      final String? phone,
      final String? whatsapp,
      final bool enabled}) = _$EmergencyImpl;

  factory _Emergency.fromJson(Map<String, dynamic> json) =
      _$EmergencyImpl.fromJson;

  @override
  String? get title;
  @override
  String? get phone;
  @override
  String? get whatsapp;
  @override
  bool get enabled;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyImplCopyWith<_$EmergencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
