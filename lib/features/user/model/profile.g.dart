// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      memberId: (json['member_id'] as num?)?.toInt(),
      identifier: json['identifier'] as String? ?? '',
      name: json['name'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      isPhoneVerified: json['is_phone_verified'] == null
          ? false
          : const IntToBoolConverter()
              .fromJson((json['is_phone_verified'] as num).toInt()),
      isEmailVerified: json['is_email_verified'] == null
          ? false
          : const IntToBoolConverter()
              .fromJson((json['is_email_verified'] as num).toInt()),
      address: json['address'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      passportNo: json['passport_no'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'member_id': instance.memberId,
      'identifier': instance.identifier,
      'name': instance.name,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'is_phone_verified':
          const IntToBoolConverter().toJson(instance.isPhoneVerified),
      'is_email_verified':
          const IntToBoolConverter().toJson(instance.isEmailVerified),
      'address': instance.address,
      'photo': instance.photo,
      'passport_no': instance.passportNo,
    };
