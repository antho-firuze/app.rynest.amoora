// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {
  int get id;
  @JsonKey(name: 'name_simple')
  String get name;
  @JsonKey(name: 'verses_count')
  int get versesCount;
  @JsonKey(name: 'bismillah_pre')
  bool get bismillahPre;
  @JsonKey(name: 'revelation_place')
  String get revelationPlace;
  @JsonKey(name: 'revelation_order')
  int get revelationOrder;
  List<int>? get pages;
  @JsonKey(name: 'translated_name')
  Map<String, dynamic>? get translatedName;
  List<Verse>? get verses;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<Chapter> get copyWith =>
      _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Chapter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.versesCount, versesCount) ||
                other.versesCount == versesCount) &&
            (identical(other.bismillahPre, bismillahPre) ||
                other.bismillahPre == bismillahPre) &&
            (identical(other.revelationPlace, revelationPlace) ||
                other.revelationPlace == revelationPlace) &&
            (identical(other.revelationOrder, revelationOrder) ||
                other.revelationOrder == revelationOrder) &&
            const DeepCollectionEquality().equals(other.pages, pages) &&
            const DeepCollectionEquality()
                .equals(other.translatedName, translatedName) &&
            const DeepCollectionEquality().equals(other.verses, verses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      versesCount,
      bismillahPre,
      revelationPlace,
      revelationOrder,
      const DeepCollectionEquality().hash(pages),
      const DeepCollectionEquality().hash(translatedName),
      const DeepCollectionEquality().hash(verses));

  @override
  String toString() {
    return 'Chapter(id: $id, name: $name, versesCount: $versesCount, bismillahPre: $bismillahPre, revelationPlace: $revelationPlace, revelationOrder: $revelationOrder, pages: $pages, translatedName: $translatedName, verses: $verses)';
  }
}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) =
      _$ChapterCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_simple') String name,
      @JsonKey(name: 'verses_count') int versesCount,
      @JsonKey(name: 'bismillah_pre') bool bismillahPre,
      @JsonKey(name: 'revelation_place') String revelationPlace,
      @JsonKey(name: 'revelation_order') int revelationOrder,
      List<int>? pages,
      @JsonKey(name: 'translated_name') Map<String, dynamic>? translatedName,
      List<Verse>? verses});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res> implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? versesCount = null,
    Object? bismillahPre = null,
    Object? revelationPlace = null,
    Object? revelationOrder = null,
    Object? pages = freezed,
    Object? translatedName = freezed,
    Object? verses = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      versesCount: null == versesCount
          ? _self.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      bismillahPre: null == bismillahPre
          ? _self.bismillahPre
          : bismillahPre // ignore: cast_nullable_to_non_nullable
              as bool,
      revelationPlace: null == revelationPlace
          ? _self.revelationPlace
          : revelationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      revelationOrder: null == revelationOrder
          ? _self.revelationOrder
          : revelationOrder // ignore: cast_nullable_to_non_nullable
              as int,
      pages: freezed == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      translatedName: freezed == translatedName
          ? _self.translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verses: freezed == verses
          ? _self.verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Chapter implements Chapter {
  _Chapter(
      {this.id = 0,
      @JsonKey(name: 'name_simple') this.name = '',
      @JsonKey(name: 'verses_count') this.versesCount = 0,
      @JsonKey(name: 'bismillah_pre') this.bismillahPre = true,
      @JsonKey(name: 'revelation_place') this.revelationPlace = '',
      @JsonKey(name: 'revelation_order') this.revelationOrder = 0,
      final List<int>? pages,
      @JsonKey(name: 'translated_name')
      final Map<String, dynamic>? translatedName,
      final List<Verse>? verses})
      : _pages = pages,
        _translatedName = translatedName,
        _verses = verses;
  factory _Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'name_simple')
  final String name;
  @override
  @JsonKey(name: 'verses_count')
  final int versesCount;
  @override
  @JsonKey(name: 'bismillah_pre')
  final bool bismillahPre;
  @override
  @JsonKey(name: 'revelation_place')
  final String revelationPlace;
  @override
  @JsonKey(name: 'revelation_order')
  final int revelationOrder;
  final List<int>? _pages;
  @override
  List<int>? get pages {
    final value = _pages;
    if (value == null) return null;
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _translatedName;
  @override
  @JsonKey(name: 'translated_name')
  Map<String, dynamic>? get translatedName {
    final value = _translatedName;
    if (value == null) return null;
    if (_translatedName is EqualUnmodifiableMapView) return _translatedName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Verse>? _verses;
  @override
  List<Verse>? get verses {
    final value = _verses;
    if (value == null) return null;
    if (_verses is EqualUnmodifiableListView) return _verses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChapterCopyWith<_Chapter> get copyWith =>
      __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChapterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Chapter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.versesCount, versesCount) ||
                other.versesCount == versesCount) &&
            (identical(other.bismillahPre, bismillahPre) ||
                other.bismillahPre == bismillahPre) &&
            (identical(other.revelationPlace, revelationPlace) ||
                other.revelationPlace == revelationPlace) &&
            (identical(other.revelationOrder, revelationOrder) ||
                other.revelationOrder == revelationOrder) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality()
                .equals(other._translatedName, _translatedName) &&
            const DeepCollectionEquality().equals(other._verses, _verses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      versesCount,
      bismillahPre,
      revelationPlace,
      revelationOrder,
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(_translatedName),
      const DeepCollectionEquality().hash(_verses));

  @override
  String toString() {
    return 'Chapter(id: $id, name: $name, versesCount: $versesCount, bismillahPre: $bismillahPre, revelationPlace: $revelationPlace, revelationOrder: $revelationOrder, pages: $pages, translatedName: $translatedName, verses: $verses)';
  }
}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) =
      __$ChapterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name_simple') String name,
      @JsonKey(name: 'verses_count') int versesCount,
      @JsonKey(name: 'bismillah_pre') bool bismillahPre,
      @JsonKey(name: 'revelation_place') String revelationPlace,
      @JsonKey(name: 'revelation_order') int revelationOrder,
      List<int>? pages,
      @JsonKey(name: 'translated_name') Map<String, dynamic>? translatedName,
      List<Verse>? verses});
}

/// @nodoc
class __$ChapterCopyWithImpl<$Res> implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? versesCount = null,
    Object? bismillahPre = null,
    Object? revelationPlace = null,
    Object? revelationOrder = null,
    Object? pages = freezed,
    Object? translatedName = freezed,
    Object? verses = freezed,
  }) {
    return _then(_Chapter(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      versesCount: null == versesCount
          ? _self.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      bismillahPre: null == bismillahPre
          ? _self.bismillahPre
          : bismillahPre // ignore: cast_nullable_to_non_nullable
              as bool,
      revelationPlace: null == revelationPlace
          ? _self.revelationPlace
          : revelationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      revelationOrder: null == revelationOrder
          ? _self.revelationOrder
          : revelationOrder // ignore: cast_nullable_to_non_nullable
              as int,
      pages: freezed == pages
          ? _self._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      translatedName: freezed == translatedName
          ? _self._translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verses: freezed == verses
          ? _self._verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>?,
    ));
  }
}

// dart format on
