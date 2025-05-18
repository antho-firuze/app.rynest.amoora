// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Carousel {
  int get id;
  @JsonKey(name: 'url')
  String get linkUrl;
  @JsonKey(name: 'image')
  String get image;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CarouselCopyWith<Carousel> get copyWith =>
      _$CarouselCopyWithImpl<Carousel>(this as Carousel, _$identity);

  /// Serializes this Carousel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Carousel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, linkUrl, image);

  @override
  String toString() {
    return 'Carousel(id: $id, linkUrl: $linkUrl, image: $image)';
  }
}

/// @nodoc
abstract mixin class $CarouselCopyWith<$Res> {
  factory $CarouselCopyWith(Carousel value, $Res Function(Carousel) _then) =
      _$CarouselCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'url') String linkUrl,
      @JsonKey(name: 'image') String image});
}

/// @nodoc
class _$CarouselCopyWithImpl<$Res> implements $CarouselCopyWith<$Res> {
  _$CarouselCopyWithImpl(this._self, this._then);

  final Carousel _self;
  final $Res Function(Carousel) _then;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? linkUrl = null,
    Object? image = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      linkUrl: null == linkUrl
          ? _self.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Carousel implements Carousel {
  _Carousel(
      {this.id = 0,
      @JsonKey(name: 'url') this.linkUrl = '',
      @JsonKey(name: 'image') this.image = ''});
  factory _Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'url')
  final String linkUrl;
  @override
  @JsonKey(name: 'image')
  final String image;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CarouselCopyWith<_Carousel> get copyWith =>
      __$CarouselCopyWithImpl<_Carousel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CarouselToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Carousel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, linkUrl, image);

  @override
  String toString() {
    return 'Carousel(id: $id, linkUrl: $linkUrl, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$CarouselCopyWith<$Res>
    implements $CarouselCopyWith<$Res> {
  factory _$CarouselCopyWith(_Carousel value, $Res Function(_Carousel) _then) =
      __$CarouselCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'url') String linkUrl,
      @JsonKey(name: 'image') String image});
}

/// @nodoc
class __$CarouselCopyWithImpl<$Res> implements _$CarouselCopyWith<$Res> {
  __$CarouselCopyWithImpl(this._self, this._then);

  final _Carousel _self;
  final $Res Function(_Carousel) _then;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? linkUrl = null,
    Object? image = null,
  }) {
    return _then(_Carousel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      linkUrl: null == linkUrl
          ? _self.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
