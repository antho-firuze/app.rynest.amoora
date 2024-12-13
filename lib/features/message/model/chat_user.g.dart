// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatUserImpl _$$ChatUserImplFromJson(Map<String, dynamic> json) =>
    _$ChatUserImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lastMessage: json['lastMessage'] as String?,
      time: json['time'] as String?,
      unRead: (json['unRead'] as num?)?.toInt() ?? 0,
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatUserImplToJson(_$ChatUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'lastMessage': instance.lastMessage,
      'time': instance.time,
      'unRead': instance.unRead,
      'isOnline': instance.isOnline,
    };
