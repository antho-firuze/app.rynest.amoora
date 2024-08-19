import 'package:amoora/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/agenda/views/widgets/agenda_header.dart';
import 'package:amoora/features/agenda/views/widgets/agenda_list.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class AgendaView extends StatelessWidget {
  const AgendaView({super.key});

  static const routeName = '/agenda';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          background: Container(
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/background_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          expandedWidget: Text(
            'Agenda Kegiatan'.hardcoded,
            style: tsHeadlineL().clr(oWhite),
            textAlign: TextAlign.center,
          ),
          collapsedWidget: Text(
            'Agenda Kegiatan'.hardcoded,
            style: tsTitleL().clr(oWhite),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          actions: const [
            // FeedbackButton(),
            // DarkModeButton(),
          ],
          sliverList: SliverList.list(
            children: [
              15.height,
              const AgendaHeader(),
              const AgendaList(),
              15.height,
            ],
          ),
        ),
      ),
    );
  }
}
