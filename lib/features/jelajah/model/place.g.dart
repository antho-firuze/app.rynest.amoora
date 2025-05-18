// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'image': instance.image,
    };

_Places _$PlacesFromJson(Map<String, dynamic> json) => _Places(
      places: (json['data'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlacesToJson(_Places instance) => <String, dynamic>{
      'data': instance.places,
    };
