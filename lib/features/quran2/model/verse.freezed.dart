// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Verse {
  int get id;
  int get chapter;
  int get number;
  @JsonKey(name: 'ar')
  String get ar;
  @JsonKey(name: 'tr')
  String get tr;
  @JsonKey(name: 'idn')
  String get idn;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerseCopyWith<Verse> get copyWith =>
      _$VerseCopyWithImpl<Verse>(this as Verse, _$identity);

  /// Serializes this Verse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Verse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.ar, ar) || other.ar == ar) &&
            (identical(other.tr, tr) || other.tr == tr) &&
            (identical(other.idn, idn) || other.idn == idn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, chapter, number, ar, tr, idn);

  @override
  String toString() {
    return 'Verse(id: $id, chapter: $chapter, number: $number, ar: $ar, tr: $tr, idn: $idn)';
  }
}

/// @nodoc
abstract mixin class $VerseCopyWith<$Res> {
  factory $VerseCopyWith(Verse value, $Res Function(Verse) _then) =
      _$VerseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int chapter,
      int number,
      @JsonKey(name: 'ar') String ar,
      @JsonKey(name: 'tr') String tr,
      @JsonKey(name: 'idn') String idn});
}

/// @nodoc
class _$VerseCopyWithImpl<$Res> implements $VerseCopyWith<$Res> {
  _$VerseCopyWithImpl(this._self, this._then);

  final Verse _self;
  final $Res Function(Verse) _then;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chapter = null,
    Object? number = null,
    Object? ar = null,
    Object? tr = null,
    Object? idn = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chapter: null == chapter
          ? _self.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      ar: null == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String,
      tr: null == tr
          ? _self.tr
          : tr // ignore: cast_nullable_to_non_nullable
              as String,
      idn: null == idn
          ? _self.idn
          : idn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Verse implements Verse {
  _Verse(
      {this.id = 0,
      this.chapter = 0,
      this.number = 0,
      @JsonKey(name: 'ar') this.ar = '',
      @JsonKey(name: 'tr') this.tr = '',
      @JsonKey(name: 'idn') this.idn = ''});
  factory _Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int chapter;
  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey(name: 'ar')
  final String ar;
  @override
  @JsonKey(name: 'tr')
  final String tr;
  @override
  @JsonKey(name: 'idn')
  final String idn;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerseCopyWith<_Verse> get copyWith =>
      __$VerseCopyWithImpl<_Verse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Verse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.ar, ar) || other.ar == ar) &&
            (identical(other.tr, tr) || other.tr == tr) &&
            (identical(other.idn, idn) || other.idn == idn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, chapter, number, ar, tr, idn);

  @override
  String toString() {
    return 'Verse(id: $id, chapter: $chapter, number: $number, ar: $ar, tr: $tr, idn: $idn)';
  }
}

/// @nodoc
abstract mixin class _$VerseCopyWith<$Res> implements $VerseCopyWith<$Res> {
  factory _$VerseCopyWith(_Verse value, $Res Function(_Verse) _then) =
      __$VerseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int chapter,
      int number,
      @JsonKey(name: 'ar') String ar,
      @JsonKey(name: 'tr') String tr,
      @JsonKey(name: 'idn') String idn});
}

/// @nodoc
class __$VerseCopyWithImpl<$Res> implements _$VerseCopyWith<$Res> {
  __$VerseCopyWithImpl(this._self, this._then);

  final _Verse _self;
  final $Res Function(_Verse) _then;

  /// Create a copy of Verse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? chapter = null,
    Object? number = null,
    Object? ar = null,
    Object? tr = null,
    Object? idn = null,
  }) {
    return _then(_Verse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chapter: null == chapter
          ? _self.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      ar: null == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String,
      tr: null == tr
          ? _self.tr
          : tr // ignore: cast_nullable_to_non_nullable
              as String,
      idn: null == idn
          ? _self.idn
          : idn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
