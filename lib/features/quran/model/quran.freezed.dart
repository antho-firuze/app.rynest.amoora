// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quran {
  int get page;
  List<int> get markPage;
  int? get surahNumber;
  String? get surahName;
  int? get juz;
  int? get hizb;
  int? get hizbQuarter;
  bool? get isRightPage;
  String? get hizbText;
  String? get surahData;
  bool get isMarkPage;
  String? get lang;

  /// Create a copy of Quran
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuranCopyWith<Quran> get copyWith =>
      _$QuranCopyWithImpl<Quran>(this as Quran, _$identity);

  /// Serializes this Quran to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quran &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.markPage, markPage) &&
            (identical(other.surahNumber, surahNumber) ||
                other.surahNumber == surahNumber) &&
            (identical(other.surahName, surahName) ||
                other.surahName == surahName) &&
            (identical(other.juz, juz) || other.juz == juz) &&
            (identical(other.hizb, hizb) || other.hizb == hizb) &&
            (identical(other.hizbQuarter, hizbQuarter) ||
                other.hizbQuarter == hizbQuarter) &&
            (identical(other.isRightPage, isRightPage) ||
                other.isRightPage == isRightPage) &&
            (identical(other.hizbText, hizbText) ||
                other.hizbText == hizbText) &&
            (identical(other.surahData, surahData) ||
                other.surahData == surahData) &&
            (identical(other.isMarkPage, isMarkPage) ||
                other.isMarkPage == isMarkPage) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      const DeepCollectionEquality().hash(markPage),
      surahNumber,
      surahName,
      juz,
      hizb,
      hizbQuarter,
      isRightPage,
      hizbText,
      surahData,
      isMarkPage,
      lang);

  @override
  String toString() {
    return 'Quran(page: $page, markPage: $markPage, surahNumber: $surahNumber, surahName: $surahName, juz: $juz, hizb: $hizb, hizbQuarter: $hizbQuarter, isRightPage: $isRightPage, hizbText: $hizbText, surahData: $surahData, isMarkPage: $isMarkPage, lang: $lang)';
  }
}

/// @nodoc
abstract mixin class $QuranCopyWith<$Res> {
  factory $QuranCopyWith(Quran value, $Res Function(Quran) _then) =
      _$QuranCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      List<int> markPage,
      int? surahNumber,
      String? surahName,
      int? juz,
      int? hizb,
      int? hizbQuarter,
      bool? isRightPage,
      String? hizbText,
      String? surahData,
      bool isMarkPage,
      String? lang});
}

/// @nodoc
class _$QuranCopyWithImpl<$Res> implements $QuranCopyWith<$Res> {
  _$QuranCopyWithImpl(this._self, this._then);

  final Quran _self;
  final $Res Function(Quran) _then;

  /// Create a copy of Quran
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? markPage = null,
    Object? surahNumber = freezed,
    Object? surahName = freezed,
    Object? juz = freezed,
    Object? hizb = freezed,
    Object? hizbQuarter = freezed,
    Object? isRightPage = freezed,
    Object? hizbText = freezed,
    Object? surahData = freezed,
    Object? isMarkPage = null,
    Object? lang = freezed,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      markPage: null == markPage
          ? _self.markPage
          : markPage // ignore: cast_nullable_to_non_nullable
              as List<int>,
      surahNumber: freezed == surahNumber
          ? _self.surahNumber
          : surahNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      surahName: freezed == surahName
          ? _self.surahName
          : surahName // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _self.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as int?,
      hizb: freezed == hizb
          ? _self.hizb
          : hizb // ignore: cast_nullable_to_non_nullable
              as int?,
      hizbQuarter: freezed == hizbQuarter
          ? _self.hizbQuarter
          : hizbQuarter // ignore: cast_nullable_to_non_nullable
              as int?,
      isRightPage: freezed == isRightPage
          ? _self.isRightPage
          : isRightPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hizbText: freezed == hizbText
          ? _self.hizbText
          : hizbText // ignore: cast_nullable_to_non_nullable
              as String?,
      surahData: freezed == surahData
          ? _self.surahData
          : surahData // ignore: cast_nullable_to_non_nullable
              as String?,
      isMarkPage: null == isMarkPage
          ? _self.isMarkPage
          : isMarkPage // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Quran implements Quran {
  _Quran(
      {this.page = 1,
      final List<int> markPage = const [],
      this.surahNumber,
      this.surahName,
      this.juz,
      this.hizb,
      this.hizbQuarter,
      this.isRightPage,
      this.hizbText,
      this.surahData,
      this.isMarkPage = false,
      this.lang})
      : _markPage = markPage;
  factory _Quran.fromJson(Map<String, dynamic> json) => _$QuranFromJson(json);

  @override
  @JsonKey()
  final int page;
  final List<int> _markPage;
  @override
  @JsonKey()
  List<int> get markPage {
    if (_markPage is EqualUnmodifiableListView) return _markPage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markPage);
  }

  @override
  final int? surahNumber;
  @override
  final String? surahName;
  @override
  final int? juz;
  @override
  final int? hizb;
  @override
  final int? hizbQuarter;
  @override
  final bool? isRightPage;
  @override
  final String? hizbText;
  @override
  final String? surahData;
  @override
  @JsonKey()
  final bool isMarkPage;
  @override
  final String? lang;

  /// Create a copy of Quran
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuranCopyWith<_Quran> get copyWith =>
      __$QuranCopyWithImpl<_Quran>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuranToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quran &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._markPage, _markPage) &&
            (identical(other.surahNumber, surahNumber) ||
                other.surahNumber == surahNumber) &&
            (identical(other.surahName, surahName) ||
                other.surahName == surahName) &&
            (identical(other.juz, juz) || other.juz == juz) &&
            (identical(other.hizb, hizb) || other.hizb == hizb) &&
            (identical(other.hizbQuarter, hizbQuarter) ||
                other.hizbQuarter == hizbQuarter) &&
            (identical(other.isRightPage, isRightPage) ||
                other.isRightPage == isRightPage) &&
            (identical(other.hizbText, hizbText) ||
                other.hizbText == hizbText) &&
            (identical(other.surahData, surahData) ||
                other.surahData == surahData) &&
            (identical(other.isMarkPage, isMarkPage) ||
                other.isMarkPage == isMarkPage) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      const DeepCollectionEquality().hash(_markPage),
      surahNumber,
      surahName,
      juz,
      hizb,
      hizbQuarter,
      isRightPage,
      hizbText,
      surahData,
      isMarkPage,
      lang);

  @override
  String toString() {
    return 'Quran(page: $page, markPage: $markPage, surahNumber: $surahNumber, surahName: $surahName, juz: $juz, hizb: $hizb, hizbQuarter: $hizbQuarter, isRightPage: $isRightPage, hizbText: $hizbText, surahData: $surahData, isMarkPage: $isMarkPage, lang: $lang)';
  }
}

/// @nodoc
abstract mixin class _$QuranCopyWith<$Res> implements $QuranCopyWith<$Res> {
  factory _$QuranCopyWith(_Quran value, $Res Function(_Quran) _then) =
      __$QuranCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int page,
      List<int> markPage,
      int? surahNumber,
      String? surahName,
      int? juz,
      int? hizb,
      int? hizbQuarter,
      bool? isRightPage,
      String? hizbText,
      String? surahData,
      bool isMarkPage,
      String? lang});
}

/// @nodoc
class __$QuranCopyWithImpl<$Res> implements _$QuranCopyWith<$Res> {
  __$QuranCopyWithImpl(this._self, this._then);

  final _Quran _self;
  final $Res Function(_Quran) _then;

  /// Create a copy of Quran
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? markPage = null,
    Object? surahNumber = freezed,
    Object? surahName = freezed,
    Object? juz = freezed,
    Object? hizb = freezed,
    Object? hizbQuarter = freezed,
    Object? isRightPage = freezed,
    Object? hizbText = freezed,
    Object? surahData = freezed,
    Object? isMarkPage = null,
    Object? lang = freezed,
  }) {
    return _then(_Quran(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      markPage: null == markPage
          ? _self._markPage
          : markPage // ignore: cast_nullable_to_non_nullable
              as List<int>,
      surahNumber: freezed == surahNumber
          ? _self.surahNumber
          : surahNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      surahName: freezed == surahName
          ? _self.surahName
          : surahName // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _self.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as int?,
      hizb: freezed == hizb
          ? _self.hizb
          : hizb // ignore: cast_nullable_to_non_nullable
              as int?,
      hizbQuarter: freezed == hizbQuarter
          ? _self.hizbQuarter
          : hizbQuarter // ignore: cast_nullable_to_non_nullable
              as int?,
      isRightPage: freezed == isRightPage
          ? _self.isRightPage
          : isRightPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      hizbText: freezed == hizbText
          ? _self.hizbText
          : hizbText // ignore: cast_nullable_to_non_nullable
              as String?,
      surahData: freezed == surahData
          ? _self.surahData
          : surahData // ignore: cast_nullable_to_non_nullable
              as String?,
      isMarkPage: null == isMarkPage
          ? _self.isMarkPage
          : isMarkPage // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
