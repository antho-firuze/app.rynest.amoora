import 'package:flutter/material.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    this.isSentByMe = true,
    this.message = '',
    required this.date,
  });

  final bool isSentByMe;
  final String? message;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.screenWidth - 60),
          child: Container(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blue.shade100 : Colors.white70,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft:
                    isSentByMe ? const Radius.circular(20) : Radius.zero,
                bottomRight:
                    isSentByMe ? Radius.zero : const Radius.circular(20),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x23000000),
                  blurRadius: 3.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 70, 8),
                  child: Text(message!),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        '13:30',
                        style: tsBodyS().clr(oBlack50),
                      ),
                      5.width,
                      const Icon(
                        Icons.done_all,
                        size: 20,
                        color: oBlack50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
