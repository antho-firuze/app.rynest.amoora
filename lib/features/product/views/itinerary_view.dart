import 'package:amoora/common/exceptions/data_failed.dart';
import 'package:amoora/common/widgets/forms/left_right.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_ctrl.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ItineraryView extends ConsumerWidget {
  const ItineraryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null || item.itineraries == null || item.itineraries!.isEmpty) {
      return const DataFailed();
    }
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Itinerary')),
        body: ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: item.itineraries!.length,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              separatorBuilder: (context, index) => 5.height,
              itemBuilder: (context, index) {
                final itinerary = item.itineraries?[index];
                if (itinerary == null) return null;
                final isDone = itinerary.activityDate?.isBefore(DateTime.now()) ?? false;
                return Card(
                  color: isDone ? oGrey.withValues(alpha: .1) : null,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: isDone ? Icon(Icons.done, color: oDarkGreen.withValues(alpha: .5), size: 70) : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ListTile(),
                            LeftRight(
                              left: Text(itinerary.title).bold(),
                              right: Text(itinerary.activityDate?.custom('EEEE, d MMM yyyy') ?? '').bold(),
                            ),
                            LeftRight(
                              left: Text(itinerary.subTitle),
                              right: const Text(''),
                            ),
                            divider(padding: const EdgeInsets.symmetric(vertical: 8)),
                            HtmlWidget(itinerary.desc),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('*Catatan :').bold().clr(oRed),
                  5.height,
                  const Text('Jadwal sewaktu-waktu dapat berubah mengikuti kondisi di lapangan.'),
                ],
              ),
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
