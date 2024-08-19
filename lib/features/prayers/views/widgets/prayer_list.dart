import 'package:amoora/features/prayers/controller/prayer_controller.dart';
import 'package:amoora/features/prayers/views/prayers_detail_view.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/string_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrayerList extends ConsumerWidget {
  const PrayerList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayers = ref.watch(prayersCtrlProvider);

    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: prayers.length,
      separatorBuilder: (context, index) => 3.height,
      itemBuilder: (context, index) {
        var title = prayers[index].title?.toCamelCase() ?? '';
        var subTitle = prayers[index].subTitle ?? '';
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: ListTile(
            title: Text(title, style: ts.bold()),
            subtitle: subTitle.isNotEmpty ? Text(subTitle) : null,
            onTap: () async {
              ref.read(prayerIndexProvider.notifier).state = index;
              // ref.read(goRouterProvider).push('/prayers_detail');
              await ref.read(pageUtilsProvider).goto(page: const PrayersDetailView());
            },
          ),
        );
      },
    );
  }
}
