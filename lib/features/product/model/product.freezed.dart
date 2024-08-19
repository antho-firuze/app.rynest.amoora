// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_date')
  DateTime? get departureDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quota')
  int get quota => throw _privateConstructorUsedError;
  @JsonKey(name: 'including')
  String get included => throw _privateConstructorUsedError;
  @JsonKey(name: 'not_included')
  String get notIncluded => throw _privateConstructorUsedError;
  @JsonKey(name: 'terms_and_condition')
  String? get termsConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_downpayment_rupiah')
  double get downPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_total_double_rupiah')
  double get doublePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_total_triple_rupiah')
  double get triplePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_total_quad_rupiah')
  double get quadPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category_name')
  String get categoryName => throw _privateConstructorUsedError;
  List<Hotel>? get hotels => throw _privateConstructorUsedError;
  List<Airline>? get airlines => throw _privateConstructorUsedError;
  List<Itinerary>? get itineraries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'duration') int duration,
      @JsonKey(name: 'departure_date') DateTime? departureDate,
      @JsonKey(name: 'quota') int quota,
      @JsonKey(name: 'including') String included,
      @JsonKey(name: 'not_included') String notIncluded,
      @JsonKey(name: 'terms_and_condition') String? termsConditions,
      @JsonKey(name: 'price_downpayment_rupiah') double downPayment,
      @JsonKey(name: 'price_total_double_rupiah') double doublePrice,
      @JsonKey(name: 'price_total_triple_rupiah') double triplePrice,
      @JsonKey(name: 'price_total_quad_rupiah') double quadPrice,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'product_category_id') int categoryId,
      @JsonKey(name: 'product_category_name') String categoryName,
      List<Hotel>? hotels,
      List<Airline>? airlines,
      List<Itinerary>? itineraries});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? duration = null,
    Object? departureDate = freezed,
    Object? quota = null,
    Object? included = null,
    Object? notIncluded = null,
    Object? termsConditions = freezed,
    Object? downPayment = null,
    Object? doublePrice = null,
    Object? triplePrice = null,
    Object? quadPrice = null,
    Object? image = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? hotels = freezed,
    Object? airlines = freezed,
    Object? itineraries = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as String,
      notIncluded: null == notIncluded
          ? _value.notIncluded
          : notIncluded // ignore: cast_nullable_to_non_nullable
              as String,
      termsConditions: freezed == termsConditions
          ? _value.termsConditions
          : termsConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as double,
      doublePrice: null == doublePrice
          ? _value.doublePrice
          : doublePrice // ignore: cast_nullable_to_non_nullable
              as double,
      triplePrice: null == triplePrice
          ? _value.triplePrice
          : triplePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quadPrice: null == quadPrice
          ? _value.quadPrice
          : quadPrice // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      hotels: freezed == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>?,
      airlines: freezed == airlines
          ? _value.airlines
          : airlines // ignore: cast_nullable_to_non_nullable
              as List<Airline>?,
      itineraries: freezed == itineraries
          ? _value.itineraries
          : itineraries // ignore: cast_nullable_to_non_nullable
              as List<Itinerary>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'duration') int duration,
      @JsonKey(name: 'departure_date') DateTime? departureDate,
      @JsonKey(name: 'quota') int quota,
      @JsonKey(name: 'including') String included,
      @JsonKey(name: 'not_included') String notIncluded,
      @JsonKey(name: 'terms_and_condition') String? termsConditions,
      @JsonKey(name: 'price_downpayment_rupiah') double downPayment,
      @JsonKey(name: 'price_total_double_rupiah') double doublePrice,
      @JsonKey(name: 'price_total_triple_rupiah') double triplePrice,
      @JsonKey(name: 'price_total_quad_rupiah') double quadPrice,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'product_category_id') int categoryId,
      @JsonKey(name: 'product_category_name') String categoryName,
      List<Hotel>? hotels,
      List<Airline>? airlines,
      List<Itinerary>? itineraries});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? duration = null,
    Object? departureDate = freezed,
    Object? quota = null,
    Object? included = null,
    Object? notIncluded = null,
    Object? termsConditions = freezed,
    Object? downPayment = null,
    Object? doublePrice = null,
    Object? triplePrice = null,
    Object? quadPrice = null,
    Object? image = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? hotels = freezed,
    Object? airlines = freezed,
    Object? itineraries = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as String,
      notIncluded: null == notIncluded
          ? _value.notIncluded
          : notIncluded // ignore: cast_nullable_to_non_nullable
              as String,
      termsConditions: freezed == termsConditions
          ? _value.termsConditions
          : termsConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as double,
      doublePrice: null == doublePrice
          ? _value.doublePrice
          : doublePrice // ignore: cast_nullable_to_non_nullable
              as double,
      triplePrice: null == triplePrice
          ? _value.triplePrice
          : triplePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quadPrice: null == quadPrice
          ? _value.quadPrice
          : quadPrice // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      hotels: freezed == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>?,
      airlines: freezed == airlines
          ? _value._airlines
          : airlines // ignore: cast_nullable_to_non_nullable
              as List<Airline>?,
      itineraries: freezed == itineraries
          ? _value._itineraries
          : itineraries // ignore: cast_nullable_to_non_nullable
              as List<Itinerary>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {this.id,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'duration') this.duration = 9,
      @JsonKey(name: 'departure_date') this.departureDate,
      @JsonKey(name: 'quota') this.quota = 50,
      @JsonKey(name: 'including') this.included = '',
      @JsonKey(name: 'not_included') this.notIncluded = '',
      @JsonKey(name: 'terms_and_condition') this.termsConditions,
      @JsonKey(name: 'price_downpayment_rupiah') this.downPayment = 0,
      @JsonKey(name: 'price_total_double_rupiah') this.doublePrice = 0,
      @JsonKey(name: 'price_total_triple_rupiah') this.triplePrice = 0,
      @JsonKey(name: 'price_total_quad_rupiah') this.quadPrice = 0,
      @JsonKey(name: 'image') this.image = '',
      @JsonKey(name: 'product_category_id') this.categoryId = 0,
      @JsonKey(name: 'product_category_name') this.categoryName = '',
      final List<Hotel>? hotels,
      final List<Airline>? airlines,
      final List<Itinerary>? itineraries})
      : _hotels = hotels,
        _airlines = airlines,
        _itineraries = itineraries;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'duration')
  final int duration;
  @override
  @JsonKey(name: 'departure_date')
  final DateTime? departureDate;
  @override
  @JsonKey(name: 'quota')
  final int quota;
  @override
  @JsonKey(name: 'including')
  final String included;
  @override
  @JsonKey(name: 'not_included')
  final String notIncluded;
  @override
  @JsonKey(name: 'terms_and_condition')
  final String? termsConditions;
  @override
  @JsonKey(name: 'price_downpayment_rupiah')
  final double downPayment;
  @override
  @JsonKey(name: 'price_total_double_rupiah')
  final double doublePrice;
  @override
  @JsonKey(name: 'price_total_triple_rupiah')
  final double triplePrice;
  @override
  @JsonKey(name: 'price_total_quad_rupiah')
  final double quadPrice;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'product_category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'product_category_name')
  final String categoryName;
  final List<Hotel>? _hotels;
  @override
  List<Hotel>? get hotels {
    final value = _hotels;
    if (value == null) return null;
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Airline>? _airlines;
  @override
  List<Airline>? get airlines {
    final value = _airlines;
    if (value == null) return null;
    if (_airlines is EqualUnmodifiableListView) return _airlines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Itinerary>? _itineraries;
  @override
  List<Itinerary>? get itineraries {
    final value = _itineraries;
    if (value == null) return null;
    if (_itineraries is EqualUnmodifiableListView) return _itineraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, duration: $duration, departureDate: $departureDate, quota: $quota, included: $included, notIncluded: $notIncluded, termsConditions: $termsConditions, downPayment: $downPayment, doublePrice: $doublePrice, triplePrice: $triplePrice, quadPrice: $quadPrice, image: $image, categoryId: $categoryId, categoryName: $categoryName, hotels: $hotels, airlines: $airlines, itineraries: $itineraries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(other.quota, quota) || other.quota == quota) &&
            (identical(other.included, included) ||
                other.included == included) &&
            (identical(other.notIncluded, notIncluded) ||
                other.notIncluded == notIncluded) &&
            (identical(other.termsConditions, termsConditions) ||
                other.termsConditions == termsConditions) &&
            (identical(other.downPayment, downPayment) ||
                other.downPayment == downPayment) &&
            (identical(other.doublePrice, doublePrice) ||
                other.doublePrice == doublePrice) &&
            (identical(other.triplePrice, triplePrice) ||
                other.triplePrice == triplePrice) &&
            (identical(other.quadPrice, quadPrice) ||
                other.quadPrice == quadPrice) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._hotels, _hotels) &&
            const DeepCollectionEquality().equals(other._airlines, _airlines) &&
            const DeepCollectionEquality()
                .equals(other._itineraries, _itineraries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      duration,
      departureDate,
      quota,
      included,
      notIncluded,
      termsConditions,
      downPayment,
      doublePrice,
      triplePrice,
      quadPrice,
      image,
      categoryId,
      categoryName,
      const DeepCollectionEquality().hash(_hotels),
      const DeepCollectionEquality().hash(_airlines),
      const DeepCollectionEquality().hash(_itineraries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {final int? id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'duration') final int duration,
      @JsonKey(name: 'departure_date') final DateTime? departureDate,
      @JsonKey(name: 'quota') final int quota,
      @JsonKey(name: 'including') final String included,
      @JsonKey(name: 'not_included') final String notIncluded,
      @JsonKey(name: 'terms_and_condition') final String? termsConditions,
      @JsonKey(name: 'price_downpayment_rupiah') final double downPayment,
      @JsonKey(name: 'price_total_double_rupiah') final double doublePrice,
      @JsonKey(name: 'price_total_triple_rupiah') final double triplePrice,
      @JsonKey(name: 'price_total_quad_rupiah') final double quadPrice,
      @JsonKey(name: 'image') final String image,
      @JsonKey(name: 'product_category_id') final int categoryId,
      @JsonKey(name: 'product_category_name') final String categoryName,
      final List<Hotel>? hotels,
      final List<Airline>? airlines,
      final List<Itinerary>? itineraries}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'duration')
  int get duration;
  @override
  @JsonKey(name: 'departure_date')
  DateTime? get departureDate;
  @override
  @JsonKey(name: 'quota')
  int get quota;
  @override
  @JsonKey(name: 'including')
  String get included;
  @override
  @JsonKey(name: 'not_included')
  String get notIncluded;
  @override
  @JsonKey(name: 'terms_and_condition')
  String? get termsConditions;
  @override
  @JsonKey(name: 'price_downpayment_rupiah')
  double get downPayment;
  @override
  @JsonKey(name: 'price_total_double_rupiah')
  double get doublePrice;
  @override
  @JsonKey(name: 'price_total_triple_rupiah')
  double get triplePrice;
  @override
  @JsonKey(name: 'price_total_quad_rupiah')
  double get quadPrice;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'product_category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'product_category_name')
  String get categoryName;
  @override
  List<Hotel>? get hotels;
  @override
  List<Airline>? get airlines;
  @override
  List<Itinerary>? get itineraries;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
