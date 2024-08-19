// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirlineImpl _$$AirlineImplFromJson(Map<String, dynamic> json) =>
    _$AirlineImpl(
      id: json['id'] as int?,
      airlineId: json['airline_id'] as int?,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      image: json['image'] as String? ?? '',
      checkIn: json['check_in'] == null
          ? null
          : DateTime.parse(json['check_in'] as String),
      checkOut: json['check_out'] == null
          ? null
          : DateTime.parse(json['check_out'] as String),
    );

Map<String, dynamic> _$$AirlineImplToJson(_$AirlineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airline_id': instance.airlineId,
      'name': instance.name,
      'code': instance.code,
      'image': instance.image,
      'check_in': instance.checkIn?.toIso8601String(),
      'check_out': instance.checkOut?.toIso8601String(),
    };
