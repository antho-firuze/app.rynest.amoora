import 'package:amoora/common/controllers/permission_controller.dart';
import 'package:amoora/common/exceptions/warning_exeption.dart';
import 'package:amoora/common/widgets/connectivity_wrapper.dart';
import 'package:amoora/common/widgets/button/settings_button.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/notification/views/notification_setting_view.dart';
import 'package:amoora/features/notification/views/widgets/empty_notification.dart';
import 'package:amoora/features/notification/views/widgets/list_notification.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAnyAlertProvider = StateProvider<bool>((ref) => false);

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  static const routeName = '/notification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(allowAlertProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            title: Text('Notifikasi'.hardcoded),
          ),
          body: ListView(
            children: [
              WarningException(
                title: 'Saat ini notifikasi belum aktif !',
                child: ElevatedButton(
                  onPressed: () => context.goto(page: const NotificationSettingView()),
                  child: Text('Aktifkan Notifikasi'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyUI(
      child: ConnectivityWrapper(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            title: Text('Notifikasi'.hardcoded),
            actions: [
              IconButton(
                onPressed: () => ref.read(isAnyAlertProvider.notifier).state = !ref.watch(isAnyAlertProvider),
                icon: Icon(
                  Icons.search,
                  color: oWhite.whenDark(oWhite),
                ),
              ),
              SettingsButton(onPressed: () => context.goto(page: const NotificationSettingView())),
              // SettingsButton(
              //   onPressed: ref.read(notificationCtrlProvider).goSettingPage,
              // ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: oWhite.whenDark(oWhite),
                ),
              ),
            ],
          ),
          body: ref.watch(isAnyAlertProvider) ? const EmptyNotification() : const ListNotification(),
        ),
      ),
    );
  }
}
