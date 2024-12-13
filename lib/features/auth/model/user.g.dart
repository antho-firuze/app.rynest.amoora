// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      roleId: (json['role_id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role_id': instance.roleId,
      'name': instance.name,
      'email': instance.email,
    };
