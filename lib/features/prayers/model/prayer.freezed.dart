// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Prayer {
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "subtitle")
  String? get subTitle;
  @JsonKey(name: "arab")
  String? get arabic;
  @JsonKey(name: "transliterasi")
  String? get latin;
  @JsonKey(name: "translasi")
  String? get translate;
  bool get bookmark;
  String? get tags;
  String? get note;

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrayerCopyWith<Prayer> get copyWith =>
      _$PrayerCopyWithImpl<Prayer>(this as Prayer, _$identity);

  /// Serializes this Prayer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Prayer &&
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

  @override
  String toString() {
    return 'Prayer(title: $title, subTitle: $subTitle, arabic: $arabic, latin: $latin, translate: $translate, bookmark: $bookmark, tags: $tags, note: $note)';
  }
}

/// @nodoc
abstract mixin class $PrayerCopyWith<$Res> {
  factory $PrayerCopyWith(Prayer value, $Res Function(Prayer) _then) =
      _$PrayerCopyWithImpl;
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
class _$PrayerCopyWithImpl<$Res> implements $PrayerCopyWith<$Res> {
  _$PrayerCopyWithImpl(this._self, this._then);

  final Prayer _self;
  final $Res Function(Prayer) _then;

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
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _self.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _self.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Prayer implements Prayer {
  _Prayer(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "subtitle") this.subTitle,
      @JsonKey(name: "arab") this.arabic,
      @JsonKey(name: "transliterasi") this.latin,
      @JsonKey(name: "translasi") this.translate,
      this.bookmark = false,
      this.tags,
      this.note});
  factory _Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);

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

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrayerCopyWith<_Prayer> get copyWith =>
      __$PrayerCopyWithImpl<_Prayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrayerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Prayer &&
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

  @override
  String toString() {
    return 'Prayer(title: $title, subTitle: $subTitle, arabic: $arabic, latin: $latin, translate: $translate, bookmark: $bookmark, tags: $tags, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$PrayerCopyWith<$Res> implements $PrayerCopyWith<$Res> {
  factory _$PrayerCopyWith(_Prayer value, $Res Function(_Prayer) _then) =
      __$PrayerCopyWithImpl;
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
class __$PrayerCopyWithImpl<$Res> implements _$PrayerCopyWith<$Res> {
  __$PrayerCopyWithImpl(this._self, this._then);

  final _Prayer _self;
  final $Res Function(_Prayer) _then;

  /// Create a copy of Prayer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Prayer(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subTitle: freezed == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _self.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      translate: freezed == translate
          ? _self.translate
          : translate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
