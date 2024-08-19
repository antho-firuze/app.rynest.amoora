import 'package:amoora/features/notification/views/widgets/custom_list_tile.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ListNotification extends StatelessWidget {
  const ListNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                'Terbaru'.hardcoded,
                style: tsTitleL(),
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const [
                CustomListTile(
                  topic: 'Info',
                  message: 'Proposalmu sedang di review!',
                  date: '1 jam',
                ),
                CustomListTile(
                  topic: 'Info',
                  message: 'Ayo lengkapi data penghargaan yang kamu punya!',
                  date: '2 jam',
                ),
                CustomListTile(
                  topic: 'Info',
                  message: 'Apakah saat ini kamu masih pelajar?',
                  date: '3 jam',
                ),
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Sebelumnya'.hardcoded,
                style: tsTitleL(),
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const [
                CustomListTile(
                  topic: 'Info',
                  message: 'Proposalmu sedang di review!',
                  date: '1 hari lalu',
                ),
                CustomListTile(
                  topic: 'Info',
                  message: 'Ayo upgrade skill mu!',
                  date: '2 hari lalu',
                ),
                CustomListTile(
                  topic: 'Info',
                  message: 'Apakah kamu masih tertarik untuk magang?',
                  date: '3 hari lalu',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
