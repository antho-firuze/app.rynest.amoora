// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => _ChatUser(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lastMessage: json['lastMessage'] as String?,
      time: json['time'] as String?,
      unRead: (json['unRead'] as num?)?.toInt() ?? 0,
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatUserToJson(_ChatUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'lastMessage': instance.lastMessage,
      'time': instance.time,
      'unRead': instance.unRead,
      'isOnline': instance.isOnline,
    };
