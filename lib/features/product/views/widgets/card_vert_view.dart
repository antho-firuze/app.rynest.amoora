import 'dart:io';

import 'package:amoora/common/exceptions/image_failed.dart';
import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/common/widgets/custom_rating_star.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/model/product.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardVertView extends StatelessWidget {
  const CardVertView({
    super.key,
    required this.item,
    this.onTap,
  });

  final Product item;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomInkWell(
        onTap: onTap,
        radius: 10,
        // color: oBlack.withOpacity(.05),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  HeaderUI(item: item),
                  // Body
                  getBodyUI(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBodyUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PACKAGE NAME
            7.height,
            Text(item.name).tsBodyM().bold().clr(oBlack30.whenDark(oWhite50)).ellipsis(),
            // Departure date
            10.height,
            SizedBox(
              height: 25,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
                minTileHeight: 0,
                leading: Icon(Icons.calendar_month, size: 17, color: oBlack50.whenDark(oWhite50)),
                title: Text(item.departureDate!.yMMMMd()).bold(),
              ),
            ),
            // Airline
            SizedBox(
              height: 25,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
                minTileHeight: 0,
                leading: Icon(Icons.flight_takeoff, size: 17, color: oBlack50.whenDark(oWhite50)),
                title: Text(item.airlines![0].name).bold(),
              ),
            ),
            // Travel duration
            // SizedBox(
            //   height: 25,
            //   child: ListTile(
            //     contentPadding: EdgeInsets.zero,
            //     horizontalTitleGap: 0,
            //     minVerticalPadding: 0,
            //     minTileHeight: 0,
            //     leading: Icon(Icons.access_time, size: 17, color: oBlack50.whenDark(oWhite50)),
            //     title: Text('Paket ${item.duration} Hari').bold(),
            //   ),
            // ),
            // Hotel
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              minTileHeight: 30,
              titleAlignment: ListTileTitleAlignment.top,
              leading: Icon(Icons.hotel, size: 17, color: oBlack50.whenDark(oWhite50)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.hotels![0].name).bold(),
                  CustomRatingStar(rating: item.hotels![0].rating),
                  3.height,
                  Text(item.hotels![1].name).bold(),
                  CustomRatingStar(rating: item.hotels![1].rating),
                ],
              ),
            ),
            // BOTTOM SECTION
            15.height,
            Row(
              children: [
                const Text('Mulai dari').bold(),
                5.width,
                Text("${item.quadPrice.toIDR()} juta").bold().clr(oRed50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderUI extends ConsumerWidget {
  const HeaderUI({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filename = "${item.id}_${item.categoryName}";
    final image = ref.watch(getImageProvider("${item.image}|$filename"));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail
        SizedBox(
          height: 130,
          child: image.when(
            skipLoadingOnRefresh: false,
            data: (data) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: FileImage(File(data)),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return ImageFailed(
                onTap: () => ref.refresh(getImageProvider("${item.image}|$filename")),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
