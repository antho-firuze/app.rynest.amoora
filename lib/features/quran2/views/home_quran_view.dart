import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran2/views/quran_setting_view.dart';
import 'package:amoora/features/quran2/views/bookmark_tab_view.dart';
import 'package:amoora/features/quran2/views/widgets/goto_dialog.dart';
import 'package:amoora/features/quran2/views/juz_tab_view.dart';
import 'package:amoora/features/quran2/views/chapter_tab_view.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class HomeQuranView extends StatelessWidget {
  const HomeQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      showConnectivityInfo: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Al-Qur'an"),
            actions: [
              IconButton(
                icon: const Icon(SuperIcons.is_polygon_matic_outline),
                onPressed: () async => await showDialog(
                  context: context,
                  builder: (context) => const GotoDialog(),
                ),
              ),
              IconButton(
                icon: const Icon(SuperIcons.ev_settings_outline),
                onPressed: () => context.goto(page: const QuranSettingView()),
              ),
              // IconButton(
              //   icon: const Icon(SuperIcons.lc_moreVertical),
              //   onPressed: () {},
              // ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: TabBar(
                labelStyle: tsTitleL().clr(oGold200),
                unselectedLabelStyle: tsTitleL().clr(oGrey),
                indicatorColor: oGold200,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                tabs: const [
                  Tab(text: 'SURAH'),
                  Tab(text: 'JUZ'),
                  Tab(text: 'BOOKMARK'),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              ChapterTabView(),
              JuzTabView(),
              BookmarkTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
