import 'package:amoora/features/user/views/menu_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class BlogList extends StatelessWidget {
  const BlogList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Blog'.hardcoded).tsTitleL().bold(),
            Text('Lihat Semua'.hardcoded).tsTitleM().link(onTap: () => context.goto(page: const MenuView())),
          ],
        ),
        // 10.height,
        // SizedBox(
        //   height: 100.whenLandscape(100),
        //   child: ListView.separated(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     padding: const EdgeInsets.only(left: 16, right: 16),
        //     separatorBuilder: (context, index) => 12.width,
        //     itemCount: 0,
        //     itemBuilder: (context, index) {},
        //   ),
        // ),
      ],
    );
  }
}
