// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  String? get id => throw _privateConstructorUsedError;
  int? get chapterId => throw _privateConstructorUsedError;
  int? get verseId => throw _privateConstructorUsedError;
  int? get verseNum => throw _privateConstructorUsedError;
  int? get juzNum => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get folder => throw _privateConstructorUsedError;

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call(
      {String? id,
      int? chapterId,
      int? verseId,
      int? verseNum,
      int? juzNum,
      DateTime? createdAt,
      String? note,
      String? folder});
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bookmark
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
    Object? note = freezed,
    Object? folder = freezed,
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkImplCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$$BookmarkImplCopyWith(
          _$BookmarkImpl value, $Res Function(_$BookmarkImpl) then) =
      __$$BookmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int? chapterId,
      int? verseId,
      int? verseNum,
      int? juzNum,
      DateTime? createdAt,
      String? note,
      String? folder});
}

/// @nodoc
class __$$BookmarkImplCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$BookmarkImpl>
    implements _$$BookmarkImplCopyWith<$Res> {
  __$$BookmarkImplCopyWithImpl(
      _$BookmarkImpl _value, $Res Function(_$BookmarkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bookmark
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
    Object? note = freezed,
    Object? folder = freezed,
  }) {
    return _then(_$BookmarkImpl(
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      folder: freezed == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkImpl implements _Bookmark {
  _$BookmarkImpl(
      {this.id,
      this.chapterId,
      this.verseId,
      this.verseNum,
      this.juzNum,
      this.createdAt,
      this.note,
      this.folder});

  factory _$BookmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkImplFromJson(json);

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
  final String? note;
  @override
  final String? folder;

  @override
  String toString() {
    return 'Bookmark(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt, note: $note, folder: $folder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.verseId, verseId) || other.verseId == verseId) &&
            (identical(other.verseNum, verseNum) ||
                other.verseNum == verseNum) &&
            (identical(other.juzNum, juzNum) || other.juzNum == juzNum) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.folder, folder) || other.folder == folder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, chapterId, verseId, verseNum,
      juzNum, createdAt, note, folder);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      __$$BookmarkImplCopyWithImpl<_$BookmarkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkImplToJson(
      this,
    );
  }
}

abstract class _Bookmark implements Bookmark {
  factory _Bookmark(
      {final String? id,
      final int? chapterId,
      final int? verseId,
      final int? verseNum,
      final int? juzNum,
      final DateTime? createdAt,
      final String? note,
      final String? folder}) = _$BookmarkImpl;

  factory _Bookmark.fromJson(Map<String, dynamic> json) =
      _$BookmarkImpl.fromJson;

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
  @override
  String? get note;
  @override
  String? get folder;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
