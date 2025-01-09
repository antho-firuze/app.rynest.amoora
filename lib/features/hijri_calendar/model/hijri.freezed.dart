// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hijri.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hijri _$HijriFromJson(Map<String, dynamic> json) {
  return _Hijri.fromJson(json);
}

/// @nodoc
mixin _$Hijri {
  String? get date => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  HijriWeekday? get weekday => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int? get day => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int? get year => throw _privateConstructorUsedError;
  HijriMonth? get month => throw _privateConstructorUsedError;

  /// Serializes this Hijri to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HijriCopyWith<Hijri> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HijriCopyWith<$Res> {
  factory $HijriCopyWith(Hijri value, $Res Function(Hijri) then) =
      _$HijriCopyWithImpl<$Res, Hijri>;
  @useResult
  $Res call(
      {String? date,
      String? format,
      HijriWeekday? weekday,
      @JsonIntConverter() int? day,
      @JsonIntConverter() int? year,
      HijriMonth? month});

  $HijriWeekdayCopyWith<$Res>? get weekday;
  $HijriMonthCopyWith<$Res>? get month;
}

/// @nodoc
class _$HijriCopyWithImpl<$Res, $Val extends Hijri>
    implements $HijriCopyWith<$Res> {
  _$HijriCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? format = freezed,
    Object? weekday = freezed,
    Object? day = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      weekday: freezed == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as HijriWeekday?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as HijriMonth?,
    ) as $Val);
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriWeekdayCopyWith<$Res>? get weekday {
    if (_value.weekday == null) {
      return null;
    }

    return $HijriWeekdayCopyWith<$Res>(_value.weekday!, (value) {
      return _then(_value.copyWith(weekday: value) as $Val);
    });
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriMonthCopyWith<$Res>? get month {
    if (_value.month == null) {
      return null;
    }

    return $HijriMonthCopyWith<$Res>(_value.month!, (value) {
      return _then(_value.copyWith(month: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HijriImplCopyWith<$Res> implements $HijriCopyWith<$Res> {
  factory _$$HijriImplCopyWith(
          _$HijriImpl value, $Res Function(_$HijriImpl) then) =
      __$$HijriImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      String? format,
      HijriWeekday? weekday,
      @JsonIntConverter() int? day,
      @JsonIntConverter() int? year,
      HijriMonth? month});

  @override
  $HijriWeekdayCopyWith<$Res>? get weekday;
  @override
  $HijriMonthCopyWith<$Res>? get month;
}

/// @nodoc
class __$$HijriImplCopyWithImpl<$Res>
    extends _$HijriCopyWithImpl<$Res, _$HijriImpl>
    implements _$$HijriImplCopyWith<$Res> {
  __$$HijriImplCopyWithImpl(
      _$HijriImpl _value, $Res Function(_$HijriImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? format = freezed,
    Object? weekday = freezed,
    Object? day = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_$HijriImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      weekday: freezed == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as HijriWeekday?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as HijriMonth?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HijriImpl implements _Hijri {
  _$HijriImpl(
      {this.date,
      this.format,
      this.weekday,
      @JsonIntConverter() this.day,
      @JsonIntConverter() this.year,
      this.month});

  factory _$HijriImpl.fromJson(Map<String, dynamic> json) =>
      _$$HijriImplFromJson(json);

  @override
  final String? date;
  @override
  final String? format;
  @override
  final HijriWeekday? weekday;
  @override
  @JsonIntConverter()
  final int? day;
  @override
  @JsonIntConverter()
  final int? year;
  @override
  final HijriMonth? month;

  @override
  String toString() {
    return 'Hijri(date: $date, format: $format, weekday: $weekday, day: $day, year: $year, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HijriImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, format, weekday, day, year, month);

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HijriImplCopyWith<_$HijriImpl> get copyWith =>
      __$$HijriImplCopyWithImpl<_$HijriImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HijriImplToJson(
      this,
    );
  }
}

abstract class _Hijri implements Hijri {
  factory _Hijri(
      {final String? date,
      final String? format,
      final HijriWeekday? weekday,
      @JsonIntConverter() final int? day,
      @JsonIntConverter() final int? year,
      final HijriMonth? month}) = _$HijriImpl;

  factory _Hijri.fromJson(Map<String, dynamic> json) = _$HijriImpl.fromJson;

  @override
  String? get date;
  @override
  String? get format;
  @override
  HijriWeekday? get weekday;
  @override
  @JsonIntConverter()
  int? get day;
  @override
  @JsonIntConverter()
  int? get year;
  @override
  HijriMonth? get month;

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HijriImplCopyWith<_$HijriImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HijriWeekday _$HijriWeekdayFromJson(Map<String, dynamic> json) {
  return _HijriWeekday.fromJson(json);
}

/// @nodoc
mixin _$HijriWeekday {
  String? get en => throw _privateConstructorUsedError;
  String? get ar => throw _privateConstructorUsedError;

  /// Serializes this HijriWeekday to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HijriWeekdayCopyWith<HijriWeekday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HijriWeekdayCopyWith<$Res> {
  factory $HijriWeekdayCopyWith(
          HijriWeekday value, $Res Function(HijriWeekday) then) =
      _$HijriWeekdayCopyWithImpl<$Res, HijriWeekday>;
  @useResult
  $Res call({String? en, String? ar});
}

/// @nodoc
class _$HijriWeekdayCopyWithImpl<$Res, $Val extends HijriWeekday>
    implements $HijriWeekdayCopyWith<$Res> {
  _$HijriWeekdayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_value.copyWith(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HijriWeekdayImplCopyWith<$Res>
    implements $HijriWeekdayCopyWith<$Res> {
  factory _$$HijriWeekdayImplCopyWith(
          _$HijriWeekdayImpl value, $Res Function(_$HijriWeekdayImpl) then) =
      __$$HijriWeekdayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? en, String? ar});
}

/// @nodoc
class __$$HijriWeekdayImplCopyWithImpl<$Res>
    extends _$HijriWeekdayCopyWithImpl<$Res, _$HijriWeekdayImpl>
    implements _$$HijriWeekdayImplCopyWith<$Res> {
  __$$HijriWeekdayImplCopyWithImpl(
      _$HijriWeekdayImpl _value, $Res Function(_$HijriWeekdayImpl) _then)
      : super(_value, _then);

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_$HijriWeekdayImpl(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HijriWeekdayImpl implements _HijriWeekday {
  _$HijriWeekdayImpl({this.en, this.ar});

  factory _$HijriWeekdayImpl.fromJson(Map<String, dynamic> json) =>
      _$$HijriWeekdayImplFromJson(json);

  @override
  final String? en;
  @override
  final String? ar;

  @override
  String toString() {
    return 'HijriWeekday(en: $en, ar: $ar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HijriWeekdayImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en, ar);

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HijriWeekdayImplCopyWith<_$HijriWeekdayImpl> get copyWith =>
      __$$HijriWeekdayImplCopyWithImpl<_$HijriWeekdayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HijriWeekdayImplToJson(
      this,
    );
  }
}

abstract class _HijriWeekday implements HijriWeekday {
  factory _HijriWeekday({final String? en, final String? ar}) =
      _$HijriWeekdayImpl;

  factory _HijriWeekday.fromJson(Map<String, dynamic> json) =
      _$HijriWeekdayImpl.fromJson;

  @override
  String? get en;
  @override
  String? get ar;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HijriWeekdayImplCopyWith<_$HijriWeekdayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) {
  return _HijriMonth.fromJson(json);
}

/// @nodoc
mixin _$HijriMonth {
  int? get number => throw _privateConstructorUsedError;
  String? get en => throw _privateConstructorUsedError;
  String? get ar => throw _privateConstructorUsedError;

  /// Serializes this HijriMonth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HijriMonthCopyWith<HijriMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HijriMonthCopyWith<$Res> {
  factory $HijriMonthCopyWith(
          HijriMonth value, $Res Function(HijriMonth) then) =
      _$HijriMonthCopyWithImpl<$Res, HijriMonth>;
  @useResult
  $Res call({int? number, String? en, String? ar});
}

/// @nodoc
class _$HijriMonthCopyWithImpl<$Res, $Val extends HijriMonth>
    implements $HijriMonthCopyWith<$Res> {
  _$HijriMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HijriMonthImplCopyWith<$Res>
    implements $HijriMonthCopyWith<$Res> {
  factory _$$HijriMonthImplCopyWith(
          _$HijriMonthImpl value, $Res Function(_$HijriMonthImpl) then) =
      __$$HijriMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? number, String? en, String? ar});
}

/// @nodoc
class __$$HijriMonthImplCopyWithImpl<$Res>
    extends _$HijriMonthCopyWithImpl<$Res, _$HijriMonthImpl>
    implements _$$HijriMonthImplCopyWith<$Res> {
  __$$HijriMonthImplCopyWithImpl(
      _$HijriMonthImpl _value, $Res Function(_$HijriMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_$HijriMonthImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HijriMonthImpl implements _HijriMonth {
  _$HijriMonthImpl({this.number, this.en, this.ar});

  factory _$HijriMonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$HijriMonthImplFromJson(json);

  @override
  final int? number;
  @override
  final String? en;
  @override
  final String? ar;

  @override
  String toString() {
    return 'HijriMonth(number: $number, en: $en, ar: $ar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HijriMonthImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, en, ar);

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HijriMonthImplCopyWith<_$HijriMonthImpl> get copyWith =>
      __$$HijriMonthImplCopyWithImpl<_$HijriMonthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HijriMonthImplToJson(
      this,
    );
  }
}

abstract class _HijriMonth implements HijriMonth {
  factory _HijriMonth({final int? number, final String? en, final String? ar}) =
      _$HijriMonthImpl;

  factory _HijriMonth.fromJson(Map<String, dynamic> json) =
      _$HijriMonthImpl.fromJson;

  @override
  int? get number;
  @override
  String? get en;
  @override
  String? get ar;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HijriMonthImplCopyWith<_$HijriMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
