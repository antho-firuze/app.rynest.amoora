import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/message/repository/chat_data.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListMessage extends ConsumerWidget {
  const ListMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: chatUsers.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => context.push('/message_detail', extra: {'title': chatUsers[index].name}),
          leading: const CircleAvatar(),
          title: Text(
            chatUsers[index].name ?? '',
            overflow: TextOverflow.ellipsis,
            style: tsTitleM().bold(),
          ),
          subtitle: Text(
            chatUsers[index].lastMessage ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: tsTitleS().light,
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chatUsers[index].time ?? '',
                style: tsTitleS(),
              ),
              3.height,
              SizedBox(
                width: 20,
                height: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: ColoredBox(
                    color: oRed50,
                    child: Center(
                      child: Text(
                        chatUsers[index].unRead.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: oWhite),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
