import 'package:amoora/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/views/widgets/prayer_list.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class PrayersView extends StatelessWidget {
  const PrayersView({super.key});

  static const routeName = '/prayers';

  @override
  Widget build(BuildContext context) {
    WakelockPlus.enable();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        WakelockPlus.disable();
        context.pop();
      },
      child: MyUI(
        enabledSafeArea: false,
        child: Scaffold(
          body: OneUINestedScrollView(
            foregroundColor: oWhite,
            background: Container(
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                image: DecorationImage(image: AssetImage('assets/images/background_2.png'), fit: BoxFit.cover),
              ),
            ),
            expandedWidget: Text('Panduan Haji & Umroh'.hardcoded).tsHeadlineL().center().clr(oWhite),
            collapsedWidget: Text('Panduan Haji & Umroh'.hardcoded).tsTitleL().ellipsis().clr(oWhite).maxLn(1),
            actions: const [
              // FeedbackButton(),
              // DarkModeButton(),
            ],
            sliverList: SliverList.list(
              children: const [
                PrayerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
