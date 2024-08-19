import 'package:amoora/features/live_location/controller/live_maps_controller.dart';
import 'package:amoora/features/live_streaming/controller/signaling_controller.dart';
import 'package:amoora/features/user/controller/menu_controller.dart';
import 'package:amoora/features/user/views/home/widgets/menu_button.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuList extends ConsumerWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineHost = ref.watch(onlineHostProvider);
    final presenter = ref.watch(presenterProvider);
    final onlineMember = ref.watch(onlineMemberProvider);
    final appMenus = ref.read(menuCtrlProvider).getHomeAppMenus();

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      separatorBuilder: (context, index) => 12.width,
      itemCount: appMenus.length,
      itemBuilder: (context, index) {
        final item = appMenus[index];
        if (item.code == 'listener') {
          return MenuButton(
            item: item,
            count: onlineHost.length,
            iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
            onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
          );
        }
        if (item.code == 'presenter') {
          return MenuButton(
            item: item,
            count: presenter == null ? 0 : 1,
            iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
            onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
          );
        }
        if (item.code == 'liveLocation') {
          return MenuButton(
            item: item,
            count: onlineMember.length,
            iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
            onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
          );
        }
        return MenuButton(
          item: item,
          iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
          onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
        );
      },
    );
  }
}
