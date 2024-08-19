import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user.freezed.dart';
part 'chat_user.g.dart';

@freezed
class ChatUser with _$ChatUser {
  factory ChatUser({
    String? id,
    String? name,
    String? imageUrl,
    String? lastMessage,
    String? time,
    @Default(0) int unRead,
    @Default(false) bool isOnline,
  }) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) => _$ChatUserFromJson(json);
}
