// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recent {
  String? get id;
  int? get chapterId;
  int? get verseId;
  int? get verseNum;
  int? get juzNum;
  DateTime? get createdAt;

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentCopyWith<Recent> get copyWith =>
      _$RecentCopyWithImpl<Recent>(this as Recent, _$identity);

  /// Serializes this Recent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recent &&
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

  @override
  String toString() {
    return 'Recent(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $RecentCopyWith<$Res> {
  factory $RecentCopyWith(Recent value, $Res Function(Recent) _then) =
      _$RecentCopyWithImpl;
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
class _$RecentCopyWithImpl<$Res> implements $RecentCopyWith<$Res> {
  _$RecentCopyWithImpl(this._self, this._then);

  final Recent _self;
  final $Res Function(Recent) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _self.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseId: freezed == verseId
          ? _self.verseId
          : verseId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseNum: freezed == verseNum
          ? _self.verseNum
          : verseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNum: freezed == juzNum
          ? _self.juzNum
          : juzNum // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Recent implements Recent {
  _Recent(
      {this.id,
      this.chapterId,
      this.verseId,
      this.verseNum,
      this.juzNum,
      this.createdAt});
  factory _Recent.fromJson(Map<String, dynamic> json) => _$RecentFromJson(json);

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

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentCopyWith<_Recent> get copyWith =>
      __$RecentCopyWithImpl<_Recent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recent &&
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

  @override
  String toString() {
    return 'Recent(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$RecentCopyWith<$Res> implements $RecentCopyWith<$Res> {
  factory _$RecentCopyWith(_Recent value, $Res Function(_Recent) _then) =
      __$RecentCopyWithImpl;
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
class __$RecentCopyWithImpl<$Res> implements _$RecentCopyWith<$Res> {
  __$RecentCopyWithImpl(this._self, this._then);

  final _Recent _self;
  final $Res Function(_Recent) _then;

  /// Create a copy of Recent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? chapterId = freezed,
    Object? verseId = freezed,
    Object? verseNum = freezed,
    Object? juzNum = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_Recent(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _self.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseId: freezed == verseId
          ? _self.verseId
          : verseId // ignore: cast_nullable_to_non_nullable
              as int?,
      verseNum: freezed == verseNum
          ? _self.verseNum
          : verseNum // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNum: freezed == juzNum
          ? _self.juzNum
          : juzNum // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
