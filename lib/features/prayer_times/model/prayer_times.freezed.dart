// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_times.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrayerTimes {
  @JsonKey(name: 'Fajr')
  @JsonTimeConverter()
  DateTime? get fajr;
  @JsonKey(name: 'Sunrise')
  @JsonTimeConverter()
  DateTime? get sunrise;
  @JsonKey(name: 'Dhuhr')
  @JsonTimeConverter()
  DateTime? get dhuhr;
  @JsonKey(name: 'Asr')
  @JsonTimeConverter()
  DateTime? get asr;
  @JsonKey(name: 'Sunset')
  @JsonTimeConverter()
  DateTime? get sunset;
  @JsonKey(name: 'Maghrib')
  @JsonTimeConverter()
  DateTime? get maghrib;
  @JsonKey(name: 'Isha')
  @JsonTimeConverter()
  DateTime? get isha;
  @JsonKey(name: 'Imsak')
  @JsonTimeConverter()
  DateTime? get imsak;
  @JsonKey(name: 'Midnight')
  @JsonTimeConverter()
  DateTime? get midnight;
  @JsonKey(name: 'Firstthird')
  @JsonTimeConverter()
  DateTime? get firstthird;
  @JsonKey(name: 'Lastthird')
  @JsonTimeConverter()
  DateTime? get lastthird;

  /// Create a copy of PrayerTimes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrayerTimesCopyWith<PrayerTimes> get copyWith =>
      _$PrayerTimesCopyWithImpl<PrayerTimes>(this as PrayerTimes, _$identity);

  /// Serializes this PrayerTimes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrayerTimes &&
            (identical(other.fajr, fajr) || other.fajr == fajr) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr) &&
            (identical(other.asr, asr) || other.asr == asr) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.maghrib, maghrib) || other.maghrib == maghrib) &&
            (identical(other.isha, isha) || other.isha == isha) &&
            (identical(other.imsak, imsak) || other.imsak == imsak) &&
            (identical(other.midnight, midnight) ||
                other.midnight == midnight) &&
            (identical(other.firstthird, firstthird) ||
                other.firstthird == firstthird) &&
            (identical(other.lastthird, lastthird) ||
                other.lastthird == lastthird));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fajr, sunrise, dhuhr, asr,
      sunset, maghrib, isha, imsak, midnight, firstthird, lastthird);

  @override
  String toString() {
    return 'PrayerTimes(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
  }
}

/// @nodoc
abstract mixin class $PrayerTimesCopyWith<$Res> {
  factory $PrayerTimesCopyWith(
          PrayerTimes value, $Res Function(PrayerTimes) _then) =
      _$PrayerTimesCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Fajr') @JsonTimeConverter() DateTime? fajr,
      @JsonKey(name: 'Sunrise') @JsonTimeConverter() DateTime? sunrise,
      @JsonKey(name: 'Dhuhr') @JsonTimeConverter() DateTime? dhuhr,
      @JsonKey(name: 'Asr') @JsonTimeConverter() DateTime? asr,
      @JsonKey(name: 'Sunset') @JsonTimeConverter() DateTime? sunset,
      @JsonKey(name: 'Maghrib') @JsonTimeConverter() DateTime? maghrib,
      @JsonKey(name: 'Isha') @JsonTimeConverter() DateTime? isha,
      @JsonKey(name: 'Imsak') @JsonTimeConverter() DateTime? imsak,
      @JsonKey(name: 'Midnight') @JsonTimeConverter() DateTime? midnight,
      @JsonKey(name: 'Firstthird') @JsonTimeConverter() DateTime? firstthird,
      @JsonKey(name: 'Lastthird') @JsonTimeConverter() DateTime? lastthird});
}

/// @nodoc
class _$PrayerTimesCopyWithImpl<$Res> implements $PrayerTimesCopyWith<$Res> {
  _$PrayerTimesCopyWithImpl(this._self, this._then);

  final PrayerTimes _self;
  final $Res Function(PrayerTimes) _then;

  /// Create a copy of PrayerTimes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fajr = freezed,
    Object? sunrise = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? sunset = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
    Object? imsak = freezed,
    Object? midnight = freezed,
    Object? firstthird = freezed,
    Object? lastthird = freezed,
  }) {
    return _then(_self.copyWith(
      fajr: freezed == fajr
          ? _self.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dhuhr: freezed == dhuhr
          ? _self.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      asr: freezed == asr
          ? _self.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunset: freezed == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maghrib: freezed == maghrib
          ? _self.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isha: freezed == isha
          ? _self.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imsak: freezed == imsak
          ? _self.imsak
          : imsak // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      midnight: freezed == midnight
          ? _self.midnight
          : midnight // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstthird: freezed == firstthird
          ? _self.firstthird
          : firstthird // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastthird: freezed == lastthird
          ? _self.lastthird
          : lastthird // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PrayerTimes implements PrayerTimes {
  _PrayerTimes(
      {@JsonKey(name: 'Fajr') @JsonTimeConverter() this.fajr,
      @JsonKey(name: 'Sunrise') @JsonTimeConverter() this.sunrise,
      @JsonKey(name: 'Dhuhr') @JsonTimeConverter() this.dhuhr,
      @JsonKey(name: 'Asr') @JsonTimeConverter() this.asr,
      @JsonKey(name: 'Sunset') @JsonTimeConverter() this.sunset,
      @JsonKey(name: 'Maghrib') @JsonTimeConverter() this.maghrib,
      @JsonKey(name: 'Isha') @JsonTimeConverter() this.isha,
      @JsonKey(name: 'Imsak') @JsonTimeConverter() this.imsak,
      @JsonKey(name: 'Midnight') @JsonTimeConverter() this.midnight,
      @JsonKey(name: 'Firstthird') @JsonTimeConverter() this.firstthird,
      @JsonKey(name: 'Lastthird') @JsonTimeConverter() this.lastthird});
  factory _PrayerTimes.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesFromJson(json);

  @override
  @JsonKey(name: 'Fajr')
  @JsonTimeConverter()
  final DateTime? fajr;
  @override
  @JsonKey(name: 'Sunrise')
  @JsonTimeConverter()
  final DateTime? sunrise;
  @override
  @JsonKey(name: 'Dhuhr')
  @JsonTimeConverter()
  final DateTime? dhuhr;
  @override
  @JsonKey(name: 'Asr')
  @JsonTimeConverter()
  final DateTime? asr;
  @override
  @JsonKey(name: 'Sunset')
  @JsonTimeConverter()
  final DateTime? sunset;
  @override
  @JsonKey(name: 'Maghrib')
  @JsonTimeConverter()
  final DateTime? maghrib;
  @override
  @JsonKey(name: 'Isha')
  @JsonTimeConverter()
  final DateTime? isha;
  @override
  @JsonKey(name: 'Imsak')
  @JsonTimeConverter()
  final DateTime? imsak;
  @override
  @JsonKey(name: 'Midnight')
  @JsonTimeConverter()
  final DateTime? midnight;
  @override
  @JsonKey(name: 'Firstthird')
  @JsonTimeConverter()
  final DateTime? firstthird;
  @override
  @JsonKey(name: 'Lastthird')
  @JsonTimeConverter()
  final DateTime? lastthird;

  /// Create a copy of PrayerTimes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrayerTimesCopyWith<_PrayerTimes> get copyWith =>
      __$PrayerTimesCopyWithImpl<_PrayerTimes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrayerTimesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrayerTimes &&
            (identical(other.fajr, fajr) || other.fajr == fajr) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr) &&
            (identical(other.asr, asr) || other.asr == asr) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.maghrib, maghrib) || other.maghrib == maghrib) &&
            (identical(other.isha, isha) || other.isha == isha) &&
            (identical(other.imsak, imsak) || other.imsak == imsak) &&
            (identical(other.midnight, midnight) ||
                other.midnight == midnight) &&
            (identical(other.firstthird, firstthird) ||
                other.firstthird == firstthird) &&
            (identical(other.lastthird, lastthird) ||
                other.lastthird == lastthird));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fajr, sunrise, dhuhr, asr,
      sunset, maghrib, isha, imsak, midnight, firstthird, lastthird);

  @override
  String toString() {
    return 'PrayerTimes(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
  }
}

/// @nodoc
abstract mixin class _$PrayerTimesCopyWith<$Res>
    implements $PrayerTimesCopyWith<$Res> {
  factory _$PrayerTimesCopyWith(
          _PrayerTimes value, $Res Function(_PrayerTimes) _then) =
      __$PrayerTimesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Fajr') @JsonTimeConverter() DateTime? fajr,
      @JsonKey(name: 'Sunrise') @JsonTimeConverter() DateTime? sunrise,
      @JsonKey(name: 'Dhuhr') @JsonTimeConverter() DateTime? dhuhr,
      @JsonKey(name: 'Asr') @JsonTimeConverter() DateTime? asr,
      @JsonKey(name: 'Sunset') @JsonTimeConverter() DateTime? sunset,
      @JsonKey(name: 'Maghrib') @JsonTimeConverter() DateTime? maghrib,
      @JsonKey(name: 'Isha') @JsonTimeConverter() DateTime? isha,
      @JsonKey(name: 'Imsak') @JsonTimeConverter() DateTime? imsak,
      @JsonKey(name: 'Midnight') @JsonTimeConverter() DateTime? midnight,
      @JsonKey(name: 'Firstthird') @JsonTimeConverter() DateTime? firstthird,
      @JsonKey(name: 'Lastthird') @JsonTimeConverter() DateTime? lastthird});
}

/// @nodoc
class __$PrayerTimesCopyWithImpl<$Res> implements _$PrayerTimesCopyWith<$Res> {
  __$PrayerTimesCopyWithImpl(this._self, this._then);

  final _PrayerTimes _self;
  final $Res Function(_PrayerTimes) _then;

  /// Create a copy of PrayerTimes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fajr = freezed,
    Object? sunrise = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? sunset = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
    Object? imsak = freezed,
    Object? midnight = freezed,
    Object? firstthird = freezed,
    Object? lastthird = freezed,
  }) {
    return _then(_PrayerTimes(
      fajr: freezed == fajr
          ? _self.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dhuhr: freezed == dhuhr
          ? _self.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      asr: freezed == asr
          ? _self.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunset: freezed == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maghrib: freezed == maghrib
          ? _self.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isha: freezed == isha
          ? _self.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imsak: freezed == imsak
          ? _self.imsak
          : imsak // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      midnight: freezed == midnight
          ? _self.midnight
          : midnight // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      firstthird: freezed == firstthird
          ? _self.firstthird
          : firstthird // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastthird: freezed == lastthird
          ? _self.lastthird
          : lastthird // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$PrayerMethod {
  int? get id;
  String? get name;

  /// Create a copy of PrayerMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrayerMethodCopyWith<PrayerMethod> get copyWith =>
      _$PrayerMethodCopyWithImpl<PrayerMethod>(
          this as PrayerMethod, _$identity);

  /// Serializes this PrayerMethod to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrayerMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PrayerMethod(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $PrayerMethodCopyWith<$Res> {
  factory $PrayerMethodCopyWith(
          PrayerMethod value, $Res Function(PrayerMethod) _then) =
      _$PrayerMethodCopyWithImpl;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$PrayerMethodCopyWithImpl<$Res> implements $PrayerMethodCopyWith<$Res> {
  _$PrayerMethodCopyWithImpl(this._self, this._then);

  final PrayerMethod _self;
  final $Res Function(PrayerMethod) _then;

  /// Create a copy of PrayerMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PrayerMethod implements PrayerMethod {
  _PrayerMethod({this.id, this.name});
  factory _PrayerMethod.fromJson(Map<String, dynamic> json) =>
      _$PrayerMethodFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  /// Create a copy of PrayerMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrayerMethodCopyWith<_PrayerMethod> get copyWith =>
      __$PrayerMethodCopyWithImpl<_PrayerMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrayerMethodToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrayerMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PrayerMethod(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$PrayerMethodCopyWith<$Res>
    implements $PrayerMethodCopyWith<$Res> {
  factory _$PrayerMethodCopyWith(
          _PrayerMethod value, $Res Function(_PrayerMethod) _then) =
      __$PrayerMethodCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$PrayerMethodCopyWithImpl<$Res>
    implements _$PrayerMethodCopyWith<$Res> {
  __$PrayerMethodCopyWithImpl(this._self, this._then);

  final _PrayerMethod _self;
  final $Res Function(_PrayerMethod) _then;

  /// Create a copy of PrayerMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_PrayerMethod(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
