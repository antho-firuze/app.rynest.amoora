import 'package:amoora/cff/widgets/forms/group_list.dart';
import 'package:amoora/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:amoora/cff/utils/ui_helper.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Pengaturan')),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              const GroupList(
                children: [
                  ListTile(
                    title: Text('Keluar Akun'),
                  ),
                ],
              ),
              5.height,
            ],
          ),
        ),
      ),
    );
  }
}
