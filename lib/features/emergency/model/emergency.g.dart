// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyImpl _$$EmergencyImplFromJson(Map<String, dynamic> json) =>
    _$EmergencyImpl(
      title: json['title'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$EmergencyImplToJson(_$EmergencyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'enabled': instance.enabled,
    };
