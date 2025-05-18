// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {
  String? get id;
  int? get chapterId;
  int? get verseId;
  int? get verseNum;
  int? get juzNum;
  DateTime? get createdAt;
  String? get note;
  String? get folder;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkCopyWith<Bookmark> get copyWith =>
      _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bookmark &&
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

  @override
  String toString() {
    return 'Bookmark(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt, note: $note, folder: $folder)';
  }
}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) =
      _$BookmarkCopyWithImpl;
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
class _$BookmarkCopyWithImpl<$Res> implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

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
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      folder: freezed == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Bookmark implements Bookmark {
  _Bookmark(
      {this.id,
      this.chapterId,
      this.verseId,
      this.verseNum,
      this.juzNum,
      this.createdAt,
      this.note,
      this.folder});
  factory _Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);

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

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookmarkCopyWith<_Bookmark> get copyWith =>
      __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookmarkToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bookmark &&
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

  @override
  String toString() {
    return 'Bookmark(id: $id, chapterId: $chapterId, verseId: $verseId, verseNum: $verseNum, juzNum: $juzNum, createdAt: $createdAt, note: $note, folder: $folder)';
  }
}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) =
      __$BookmarkCopyWithImpl;
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
class __$BookmarkCopyWithImpl<$Res> implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

  /// Create a copy of Bookmark
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
    Object? note = freezed,
    Object? folder = freezed,
  }) {
    return _then(_Bookmark(
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
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      folder: freezed == folder
          ? _self.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
