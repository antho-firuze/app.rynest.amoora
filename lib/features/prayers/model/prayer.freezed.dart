// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prayer _$PrayerFromJson(Map<String, dynamic> json) {
  return _Prayer.fromJson(json);
}

/// @nodoc
mixin _$Prayer {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "subtitle")
  String? get subTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "arab")
  String? get arabic => throw _privateConstructorUsedError;
  @JsonKey(name: "transliterasi")
  String? get latin => throw _privateConstructorUsedError;
  @JsonKey(name: "translasi")
  String? get translate => throw _privateConstructorUsedError;
  bool get bookmark => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this Prayer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerCopyWith<Prayer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerCopyWith<$Res> {
  factory $PrayerCopyWith(Prayer value, $Res Function(Prayer) then) =
      _$PrayerCopyWithImpl<$Res, Prayer>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "subtitle") String? subTitle,
      @JsonKey(name: "arab") String? arabic,
      @JsonKey(name: "transliterasi") String? latin,
      @JsonKey(name: "translasi") String? translate,
      bool bookmark,
      String? tags,
      String? note});
}

/// @nodoc
class _$PrayerCopyWithImpl<$Res, $Val extends Prayer>
    implements $PrayerCopyWith<$Res> {
  _$PrayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? arabic = freezed,
    Object? latin = freezed,
    Object? translate = freezed,
    Object? bookmark = null,
    Object? tags = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerImplCopyWith<$Res> implements $PrayerCopyWith<$Res> {
  factory _$$PrayerImplCopyWith(
          _$PrayerImpl value, $Res Function(_$PrayerImpl) then) =
      __$$PrayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "subtitle") String? subTitle,
      @JsonKey(name: "arab") String? arabic,
      @JsonKey(name: "transliterasi") String? latin,
      @JsonKey(name: "translasi") String? translate,
      bool bookmark,
      String? tags,
      String? note});
}

/// @nodoc
class __$$PrayerImplCopyWithImpl<$Res>
    extends _$PrayerCopyWithImpl<$Res, _$PrayerImpl>
    implements _$$PrayerImplCopyWith<$Res> {
  __$$PrayerImplCopyWithImpl(
      _$PrayerImpl _value, $Res Function(_$PrayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subTitle = freezed,
    Object? arabic = freezed,
    Object? latin = freezed,
    Object? translate = freezed,
    Object? bookmark = null,
    Object? tags = freezed,
    Object? note = freezed,
  }) {
    return _then(_$PrayerImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _value.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerImpl implements _Prayer {
  _$PrayerImpl(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "subtitle") this.subTitle,
      @JsonKey(name: "arab") this.arabic,
      @JsonKey(name: "transliterasi") this.latin,
      @JsonKey(name: "translasi") this.translate,
      this.bookmark = false,
      this.tags,
      this.note});

  factory _$PrayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "subtitle")
  final String? subTitle;
  @override
  @JsonKey(name: "arab")
  final String? arabic;
  @override
  @JsonKey(name: "transliterasi")
  final String? latin;
  @override
  @JsonKey(name: "translasi")
  final String? translate;
  @override
  @JsonKey()
  final bool bookmark;
  @override
  final String? tags;
  @override
  final String? note;

  @override
  String toString() {
    return 'Prayer(title: $title, subTitle: $subTitle, arabic: $arabic, latin: $latin, translate: $translate, bookmark: $bookmark, tags: $tags, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.latin, latin) || other.latin == latin) &&
            (identical(other.translate, translate) ||
                other.translate == translate) &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, arabic, latin,
      translate, bookmark, tags, note);

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerImplCopyWith<_$PrayerImpl> get copyWith =>
      __$$PrayerImplCopyWithImpl<_$PrayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerImplToJson(
      this,
    );
  }
}

abstract class _Prayer implements Prayer {
  factory _Prayer(
      {@JsonKey(name: "title") final String? title,
      @JsonKey(name: "subtitle") final String? subTitle,
      @JsonKey(name: "arab") final String? arabic,
      @JsonKey(name: "transliterasi") final String? latin,
      @JsonKey(name: "translasi") final String? translate,
      final bool bookmark,
      final String? tags,
      final String? note}) = _$PrayerImpl;

  factory _Prayer.fromJson(Map<String, dynamic> json) = _$PrayerImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "subtitle")
  String? get subTitle;
  @override
  @JsonKey(name: "arab")
  String? get arabic;
  @override
  @JsonKey(name: "transliterasi")
  String? get latin;
  @override
  @JsonKey(name: "translasi")
  String? get translate;
  @override
  bool get bookmark;
  @override
  String? get tags;
  @override
  String? get note;

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerImplCopyWith<_$PrayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
