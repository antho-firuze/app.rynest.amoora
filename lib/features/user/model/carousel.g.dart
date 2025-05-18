// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Carousel _$CarouselFromJson(Map<String, dynamic> json) => _Carousel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      linkUrl: json['url'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$CarouselToJson(_Carousel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.linkUrl,
      'image': instance.image,
    };
