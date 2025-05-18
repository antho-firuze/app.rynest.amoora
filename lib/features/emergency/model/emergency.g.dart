// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Emergency _$EmergencyFromJson(Map<String, dynamic> json) => _Emergency(
      title: json['title'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$EmergencyToJson(_Emergency instance) =>
    <String, dynamic>{
      'title': instance.title,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'enabled': instance.enabled,
    };
