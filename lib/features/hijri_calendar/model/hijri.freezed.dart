// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hijri.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hijri {
  String? get date;
  String? get format;
  HijriWeekday? get weekday;
  @JsonIntConverter()
  int? get day;
  @JsonIntConverter()
  int? get year;
  HijriMonth? get month;

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HijriCopyWith<Hijri> get copyWith =>
      _$HijriCopyWithImpl<Hijri>(this as Hijri, _$identity);

  /// Serializes this Hijri to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Hijri &&
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

  @override
  String toString() {
    return 'Hijri(date: $date, format: $format, weekday: $weekday, day: $day, year: $year, month: $month)';
  }
}

/// @nodoc
abstract mixin class $HijriCopyWith<$Res> {
  factory $HijriCopyWith(Hijri value, $Res Function(Hijri) _then) =
      _$HijriCopyWithImpl;
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
class _$HijriCopyWithImpl<$Res> implements $HijriCopyWith<$Res> {
  _$HijriCopyWithImpl(this._self, this._then);

  final Hijri _self;
  final $Res Function(Hijri) _then;

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
    return _then(_self.copyWith(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      weekday: freezed == weekday
          ? _self.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as HijriWeekday?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as HijriMonth?,
    ));
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
      return null;
    }

    return $HijriWeekdayCopyWith<$Res>(_self.weekday!, (value) {
      return _then(_self.copyWith(weekday: value));
    });
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
      return null;
    }

    return $HijriMonthCopyWith<$Res>(_self.month!, (value) {
      return _then(_self.copyWith(month: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Hijri implements Hijri {
  _Hijri(
      {this.date,
      this.format,
      this.weekday,
      @JsonIntConverter() this.day,
      @JsonIntConverter() this.year,
      this.month});
  factory _Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

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

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HijriCopyWith<_Hijri> get copyWith =>
      __$HijriCopyWithImpl<_Hijri>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HijriToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Hijri &&
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

  @override
  String toString() {
    return 'Hijri(date: $date, format: $format, weekday: $weekday, day: $day, year: $year, month: $month)';
  }
}

/// @nodoc
abstract mixin class _$HijriCopyWith<$Res> implements $HijriCopyWith<$Res> {
  factory _$HijriCopyWith(_Hijri value, $Res Function(_Hijri) _then) =
      __$HijriCopyWithImpl;
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
class __$HijriCopyWithImpl<$Res> implements _$HijriCopyWith<$Res> {
  __$HijriCopyWithImpl(this._self, this._then);

  final _Hijri _self;
  final $Res Function(_Hijri) _then;

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = freezed,
    Object? format = freezed,
    Object? weekday = freezed,
    Object? day = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_Hijri(
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      weekday: freezed == weekday
          ? _self.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as HijriWeekday?,
      day: freezed == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as HijriMonth?,
    ));
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
      return null;
    }

    return $HijriWeekdayCopyWith<$Res>(_self.weekday!, (value) {
      return _then(_self.copyWith(weekday: value));
    });
  }

  /// Create a copy of Hijri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HijriMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
      return null;
    }

    return $HijriMonthCopyWith<$Res>(_self.month!, (value) {
      return _then(_self.copyWith(month: value));
    });
  }
}

/// @nodoc
mixin _$HijriWeekday {
  String? get en;
  String? get ar;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HijriWeekdayCopyWith<HijriWeekday> get copyWith =>
      _$HijriWeekdayCopyWithImpl<HijriWeekday>(
          this as HijriWeekday, _$identity);

  /// Serializes this HijriWeekday to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HijriWeekday &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en, ar);

  @override
  String toString() {
    return 'HijriWeekday(en: $en, ar: $ar)';
  }
}

/// @nodoc
abstract mixin class $HijriWeekdayCopyWith<$Res> {
  factory $HijriWeekdayCopyWith(
          HijriWeekday value, $Res Function(HijriWeekday) _then) =
      _$HijriWeekdayCopyWithImpl;
  @useResult
  $Res call({String? en, String? ar});
}

/// @nodoc
class _$HijriWeekdayCopyWithImpl<$Res> implements $HijriWeekdayCopyWith<$Res> {
  _$HijriWeekdayCopyWithImpl(this._self, this._then);

  final HijriWeekday _self;
  final $Res Function(HijriWeekday) _then;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_self.copyWith(
      en: freezed == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HijriWeekday implements HijriWeekday {
  _HijriWeekday({this.en, this.ar});
  factory _HijriWeekday.fromJson(Map<String, dynamic> json) =>
      _$HijriWeekdayFromJson(json);

  @override
  final String? en;
  @override
  final String? ar;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HijriWeekdayCopyWith<_HijriWeekday> get copyWith =>
      __$HijriWeekdayCopyWithImpl<_HijriWeekday>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HijriWeekdayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HijriWeekday &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en, ar);

  @override
  String toString() {
    return 'HijriWeekday(en: $en, ar: $ar)';
  }
}

/// @nodoc
abstract mixin class _$HijriWeekdayCopyWith<$Res>
    implements $HijriWeekdayCopyWith<$Res> {
  factory _$HijriWeekdayCopyWith(
          _HijriWeekday value, $Res Function(_HijriWeekday) _then) =
      __$HijriWeekdayCopyWithImpl;
  @override
  @useResult
  $Res call({String? en, String? ar});
}

/// @nodoc
class __$HijriWeekdayCopyWithImpl<$Res>
    implements _$HijriWeekdayCopyWith<$Res> {
  __$HijriWeekdayCopyWithImpl(this._self, this._then);

  final _HijriWeekday _self;
  final $Res Function(_HijriWeekday) _then;

  /// Create a copy of HijriWeekday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_HijriWeekday(
      en: freezed == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$HijriMonth {
  int? get number;
  String? get en;
  String? get ar;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HijriMonthCopyWith<HijriMonth> get copyWith =>
      _$HijriMonthCopyWithImpl<HijriMonth>(this as HijriMonth, _$identity);

  /// Serializes this HijriMonth to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HijriMonth &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, en, ar);

  @override
  String toString() {
    return 'HijriMonth(number: $number, en: $en, ar: $ar)';
  }
}

/// @nodoc
abstract mixin class $HijriMonthCopyWith<$Res> {
  factory $HijriMonthCopyWith(
          HijriMonth value, $Res Function(HijriMonth) _then) =
      _$HijriMonthCopyWithImpl;
  @useResult
  $Res call({int? number, String? en, String? ar});
}

/// @nodoc
class _$HijriMonthCopyWithImpl<$Res> implements $HijriMonthCopyWith<$Res> {
  _$HijriMonthCopyWithImpl(this._self, this._then);

  final HijriMonth _self;
  final $Res Function(HijriMonth) _then;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_self.copyWith(
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      en: freezed == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HijriMonth implements HijriMonth {
  _HijriMonth({this.number, this.en, this.ar});
  factory _HijriMonth.fromJson(Map<String, dynamic> json) =>
      _$HijriMonthFromJson(json);

  @override
  final int? number;
  @override
  final String? en;
  @override
  final String? ar;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HijriMonthCopyWith<_HijriMonth> get copyWith =>
      __$HijriMonthCopyWithImpl<_HijriMonth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HijriMonthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HijriMonth &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, en, ar);

  @override
  String toString() {
    return 'HijriMonth(number: $number, en: $en, ar: $ar)';
  }
}

/// @nodoc
abstract mixin class _$HijriMonthCopyWith<$Res>
    implements $HijriMonthCopyWith<$Res> {
  factory _$HijriMonthCopyWith(
          _HijriMonth value, $Res Function(_HijriMonth) _then) =
      __$HijriMonthCopyWithImpl;
  @override
  @useResult
  $Res call({int? number, String? en, String? ar});
}

/// @nodoc
class __$HijriMonthCopyWithImpl<$Res> implements _$HijriMonthCopyWith<$Res> {
  __$HijriMonthCopyWithImpl(this._self, this._then);

  final _HijriMonth _self;
  final $Res Function(_HijriMonth) _then;

  /// Create a copy of HijriMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = freezed,
    Object? en = freezed,
    Object? ar = freezed,
  }) {
    return _then(_HijriMonth(
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      en: freezed == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      ar: freezed == ar
          ? _self.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
