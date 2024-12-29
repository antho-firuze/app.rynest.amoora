// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_simple')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'verses_count')
  int get versesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bismillah_pre')
  bool get bismillahPre => throw _privateConstructorUsedError;
  @JsonKey(name: 'revelation_place')
  String get revelationPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'revelation_order')
  int get revelationOrder => throw _privateConstructorUsedError;
  List<int>? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'translated_name')
  Map<String, dynamic>? get translatedName =>
      throw _privateConstructorUsedError;
  List<Verse>? get verses => throw _privateConstructorUsedError;

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
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
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      versesCount: null == versesCount
          ? _value.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      bismillahPre: null == bismillahPre
          ? _value.bismillahPre
          : bismillahPre // ignore: cast_nullable_to_non_nullable
              as bool,
      revelationPlace: null == revelationPlace
          ? _value.revelationPlace
          : revelationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      revelationOrder: null == revelationOrder
          ? _value.revelationOrder
          : revelationOrder // ignore: cast_nullable_to_non_nullable
              as int,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      translatedName: freezed == translatedName
          ? _value.translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verses: freezed == verses
          ? _value.verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
          _$ChapterImpl value, $Res Function(_$ChapterImpl) then) =
      __$$ChapterImplCopyWithImpl<$Res>;
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
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
      _$ChapterImpl _value, $Res Function(_$ChapterImpl) _then)
      : super(_value, _then);

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
    return _then(_$ChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      versesCount: null == versesCount
          ? _value.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      bismillahPre: null == bismillahPre
          ? _value.bismillahPre
          : bismillahPre // ignore: cast_nullable_to_non_nullable
              as bool,
      revelationPlace: null == revelationPlace
          ? _value.revelationPlace
          : revelationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      revelationOrder: null == revelationOrder
          ? _value.revelationOrder
          : revelationOrder // ignore: cast_nullable_to_non_nullable
              as int,
      pages: freezed == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      translatedName: freezed == translatedName
          ? _value._translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verses: freezed == verses
          ? _value._verses
          : verses // ignore: cast_nullable_to_non_nullable
              as List<Verse>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImpl implements _Chapter {
  _$ChapterImpl(
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

  factory _$ChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImplFromJson(json);

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

  @override
  String toString() {
    return 'Chapter(id: $id, name: $name, versesCount: $versesCount, bismillahPre: $bismillahPre, revelationPlace: $revelationPlace, revelationOrder: $revelationOrder, pages: $pages, translatedName: $translatedName, verses: $verses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
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

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImplToJson(
      this,
    );
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter(
      {final int id,
      @JsonKey(name: 'name_simple') final String name,
      @JsonKey(name: 'verses_count') final int versesCount,
      @JsonKey(name: 'bismillah_pre') final bool bismillahPre,
      @JsonKey(name: 'revelation_place') final String revelationPlace,
      @JsonKey(name: 'revelation_order') final int revelationOrder,
      final List<int>? pages,
      @JsonKey(name: 'translated_name')
      final Map<String, dynamic>? translatedName,
      final List<Verse>? verses}) = _$ChapterImpl;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$ChapterImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name_simple')
  String get name;
  @override
  @JsonKey(name: 'verses_count')
  int get versesCount;
  @override
  @JsonKey(name: 'bismillah_pre')
  bool get bismillahPre;
  @override
  @JsonKey(name: 'revelation_place')
  String get revelationPlace;
  @override
  @JsonKey(name: 'revelation_order')
  int get revelationOrder;
  @override
  List<int>? get pages;
  @override
  @JsonKey(name: 'translated_name')
  Map<String, dynamic>? get translatedName;
  @override
  List<Verse>? get verses;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
