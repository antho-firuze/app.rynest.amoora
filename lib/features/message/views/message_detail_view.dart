import 'package:amoora/features/message/repository/chat_data.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:amoora/features/message/views/message.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({super.key, this.title});

  final String? title;

  static const routeName = '/message_detail';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              5.width,
              Text(
                title ?? 'Unknown Sender',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: oWhite,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) => Message(
                    isSentByMe: chatMessages[index].isSentByMe,
                    message: chatMessages[index].message,
                    date: chatMessages[index].time ?? DateTime.now(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.whenDark(Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: TextFormField(
                          // style: tsBodyL(),
                          // keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Tulis pesan kamu di sini'.hardcoded,
                            // hintStyle: tsBodyM().clr(oBlack50),
                            // border: InputBorder.none,
                            // contentPadding: const EdgeInsets.only(bottom: 5),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
