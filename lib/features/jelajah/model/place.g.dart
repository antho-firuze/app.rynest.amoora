// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'image': instance.image,
    };

_$PlacesImpl _$$PlacesImplFromJson(Map<String, dynamic> json) => _$PlacesImpl(
      places: (json['data'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlacesImplToJson(_$PlacesImpl instance) =>
    <String, dynamic>{
      'data': instance.places,
    };
