import 'dart:developer';

import 'package:amoora/features/live_location/controller/live_maps_ctrl.dart';
import 'package:amoora/features/live_streaming/controller/streaming_ctrl.dart';
import 'package:amoora/features/user/controller/menu_ctrl.dart';
import 'package:amoora/features/user/views/home/widgets/menu_button.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MenuView extends ConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineMember = ref.watch(onlineMemberProvider);
    log(':: onlineMember => $onlineMember');

    final appMenus = ref.read(menuCtrlProvider).getAllAppMenus();
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Semua Menu')),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            16.height,
            StaggeredGrid.count(
              crossAxisCount: 4.whenLandscape(8)!.toInt(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                appMenus.length,
                (index) {
                  final item = appMenus[index];
                  if (item.code == 'streaming') {
                    return MenuButton(
                      item: item,
                      count: ref.watch(streamerCountProvider),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
