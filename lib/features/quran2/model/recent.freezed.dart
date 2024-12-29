// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recent _$RecentFromJson(Map<String, dynamic> json) {
  return _Recent.fromJson(json);
}

/// @nodoc
mixin _$Recent {
  String? get id => throw _privateConstructorUsedError;
  int? get chapterId => throw _privateConstructorUsedError;
  int? get verseId => throw _privateConstructorUsedError;
  int? get verseNum => throw _privateConstructorUsedError;
  int? get juzNum => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Recent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentCopyWith<Recent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentCopyWith<$Res> {
  factory $RecentCopyWith(Recent value, $Res Function(Recent) then) =
      _$RecentCopyWithImpl<$Res, Recent>;
  @useResult
  $Res call(
      {String? id,
      int? chapterId,
      int? verseId,
      int? verseNum,
      int? juzNum,
      DateTime? createdAt});
}

/// @nodoc
class _$RecentCopyWithImpl<$Res, $Val extends Recent>
    implements $RecentCopyWith<$Res> {
  _$RecentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterId = freezed,
    Object? verseId = freezed,
    Object? verseNum = freezed,
    Object? juzNum = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseId: freezed == verseId
          ? _value.verseId
          : verseId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseNum: freezed == verseNum
          ? _value.verseNum
          : verseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNum: freezed == juzNum
          ? _value.juzNum
          : juzNum // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentImplCopyWith<$Res> implements $RecentCopyWith<$Res> {
  factory _$$RecentImplCopyWith(
          _$RecentImpl value, $Res Function(_$RecentImpl) then) =
      __$$RecentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int? chapterId,
      int? verseId,
      int? verseNum,
      int? juzNum,
      DateTime? createdAt});
}

/// @nodoc
class __$$RecentImplCopyWithImpl<$Res>
    extends _$RecentCopyWithImpl<$Res, _$RecentImpl>
    implements _$$RecentImplCopyWith<$Res> {
  __$$RecentImplCopyWithImpl(
      _$RecentImpl _value, $Res Function(_$RecentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterId = freezed,
    Object? verseId = freezed,
    Object? verseNum = freezed,
    Object? juzNum = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$RecentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseId: freezed == verseId
          ? _value.verseId
          : verseId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseNum: freezed == verseNum
          ? _value.verseNum
          : verseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNum: freezed == juzNum
          ? _value.juzNum
          : juzNum // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentImpl implements _Recent {
  _$RecentImpl(
      {this.id,
      this.chapterId,
      this.verseId,
      this.verseNum,
      this.juzNum,
      this.createdAt});

  factory _$RecentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentImplFromJson(json);

  @override
  final String? id;
  @override
  final int? chapterId;
  @override
  final int? verseId;
  @override
  final int? verseNum;
  @override
  final int? juzNum;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Recent(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.verseId, verseId) || other.verseId == verseId) &&
            (identical(other.verseNum, verseNum) ||
                other.verseNum == verseNum) &&
            (identical(other.juzNum, juzNum) || other.juzNum == juzNum) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, chapterId, verseId, verseNum, juzNum, createdAt);

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentImplCopyWith<_$RecentImpl> get copyWith =>
      __$$RecentImplCopyWithImpl<_$RecentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentImplToJson(
      this,
    );
  }
}

abstract class _Recent implements Recent {
  factory _Recent(
      {final String? id,
      final int? chapterId,
      final int? verseId,
      final int? verseNum,
      final int? juzNum,
      final DateTime? createdAt}) = _$RecentImpl;

  factory _Recent.fromJson(Map<String, dynamic> json) = _$RecentImpl.fromJson;

  @override
  String? get id;
  @override
  int? get chapterId;
  @override
  int? get verseId;
  @override
  int? get verseNum;
  @override
  int? get juzNum;
  @override
  DateTime? get createdAt;

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentImplCopyWith<_$RecentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
