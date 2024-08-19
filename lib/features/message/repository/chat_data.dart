import 'package:amoora/features/message/model/chat_message.dart';
import 'package:amoora/features/message/model/chat_user.dart';

List<ChatUser> chatUsers = [
  ChatUser(
    name: "Muhammad Faizar",
    lastMessage: "apakah besok bisa datang ke kantor?",
    isOnline: true,
    unRead: 99,
    time: "Hari ini",
  ),
  ChatUser(
    name: "Ahmad Hertanto",
    lastMessage: "kapan kita umroh bareng lagi?",
    isOnline: false,
    unRead: 5,
    time: "Kemarin",
  ),
  ChatUser(
    name: "Kayyis Wildan Aisyah",
    lastMessage: "yuk ahh kita kumpul bareng di basecamp!",
    isOnline: true,
    unRead: 2,
    time: "Nov 2023",
  ),
];

List<ChatMessage> chatMessages = [
  ChatMessage(
    message: "Hai, sudah siap?",
    time: DateTime.now().subtract(const Duration(minutes: 10)),
    isSentByMe: false,
  ),
  ChatMessage(
    message: "Siap bagaimana yah pak?",
    time: DateTime.now().subtract(const Duration(minutes: 9)),
    isSentByMe: true,
  ),
  ChatMessage(
    message:
        "Siap untuk magang di perusahaan kami, kalau bisa besok kamu datang ke kantor yah",
    time: DateTime.now().subtract(const Duration(minutes: 8)),
    isSentByMe: false,
  ),
  ChatMessage(
    message: "Maaf pak, saya tidak pernah apply ke tempat perusahaan bapak.",
    time: DateTime.now().subtract(const Duration(minutes: 7)),
    isSentByMe: true,
  ),
  ChatMessage(
    message: "Masa sih, disini benar kok datanya",
    time: DateTime.now().subtract(const Duration(minutes: 6)),
    isSentByMe: false,
  ),
  ChatMessage(
    message: "Coba bapak lihat lagi deh",
    time: DateTime.now().subtract(const Duration(minutes: 5)),
    isSentByMe: true,
  ),
  ChatMessage(
    message: "ditunggu yah",
    time: DateTime.now().subtract(const Duration(minutes: 4)),
    isSentByMe: false,
  ),
  ChatMessage(
    message: "oke",
    time: DateTime.now().subtract(const Duration(minutes: 3)),
    isSentByMe: true,
  ),
  ChatMessage(
    message: "Ohh iya, saya salah lihat. Maaf yah",
    time: DateTime.now().subtract(const Duration(minutes: 2)),
    isSentByMe: false,
  ),
];
