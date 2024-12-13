// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) {
  return _Itinerary.fromJson(json);
}

/// @nodoc
mixin _$Itinerary {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_title')
  String get subTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'detail_itinerary')
  String get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_date')
  DateTime? get activityDate => throw _privateConstructorUsedError;

  /// Serializes this Itinerary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryCopyWith<Itinerary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryCopyWith<$Res> {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) then) =
      _$ItineraryCopyWithImpl<$Res, Itinerary>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'sub_title') String subTitle,
      @JsonKey(name: 'detail_itinerary') String desc,
      @JsonKey(name: 'activity_date') DateTime? activityDate});
}

/// @nodoc
class _$ItineraryCopyWithImpl<$Res, $Val extends Itinerary>
    implements $ItineraryCopyWith<$Res> {
  _$ItineraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? subTitle = null,
    Object? desc = null,
    Object? activityDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItineraryImplCopyWith<$Res>
    implements $ItineraryCopyWith<$Res> {
  factory _$$ItineraryImplCopyWith(
          _$ItineraryImpl value, $Res Function(_$ItineraryImpl) then) =
      __$$ItineraryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'sub_title') String subTitle,
      @JsonKey(name: 'detail_itinerary') String desc,
      @JsonKey(name: 'activity_date') DateTime? activityDate});
}

/// @nodoc
class __$$ItineraryImplCopyWithImpl<$Res>
    extends _$ItineraryCopyWithImpl<$Res, _$ItineraryImpl>
    implements _$$ItineraryImplCopyWith<$Res> {
  __$$ItineraryImplCopyWithImpl(
      _$ItineraryImpl _value, $Res Function(_$ItineraryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? subTitle = null,
    Object? desc = null,
    Object? activityDate = freezed,
  }) {
    return _then(_$ItineraryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryImpl implements _Itinerary {
  _$ItineraryImpl(
      {this.id,
      @JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'sub_title') this.subTitle = '',
      @JsonKey(name: 'detail_itinerary') this.desc = '',
      @JsonKey(name: 'activity_date') this.activityDate});

  factory _$ItineraryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'sub_title')
  final String subTitle;
  @override
  @JsonKey(name: 'detail_itinerary')
  final String desc;
  @override
  @JsonKey(name: 'activity_date')
  final DateTime? activityDate;

  @override
  String toString() {
    return 'Itinerary(id: $id, title: $title, subTitle: $subTitle, desc: $desc, activityDate: $activityDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subTitle, desc, activityDate);

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryImplCopyWith<_$ItineraryImpl> get copyWith =>
      __$$ItineraryImplCopyWithImpl<_$ItineraryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryImplToJson(
      this,
    );
  }
}

abstract class _Itinerary implements Itinerary {
  factory _Itinerary(
          {final int? id,
          @JsonKey(name: 'title') final String title,
          @JsonKey(name: 'sub_title') final String subTitle,
          @JsonKey(name: 'detail_itinerary') final String desc,
          @JsonKey(name: 'activity_date') final DateTime? activityDate}) =
      _$ItineraryImpl;

  factory _Itinerary.fromJson(Map<String, dynamic> json) =
      _$ItineraryImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'sub_title')
  String get subTitle;
  @override
  @JsonKey(name: 'detail_itinerary')
  String get desc;
  @override
  @JsonKey(name: 'activity_date')
  DateTime? get activityDate;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryImplCopyWith<_$ItineraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
