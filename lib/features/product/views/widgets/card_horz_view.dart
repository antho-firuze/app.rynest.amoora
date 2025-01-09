import 'dart:io';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/widgets/cross_paint.dart';
import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/common/widgets/custom_rating_star.dart';
import 'package:amoora/common/widgets/custom_rich_text.dart';
import 'package:amoora/common/widgets/forms/left_right.dart';
import 'package:amoora/features/product/model/product.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/currency_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/download_utils.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double paddingHorizontal = 4;

class CardHorzView extends StatelessWidget {
  const CardHorzView({
    super.key,
    required this.item,
    this.onTap,
  });

  final Product item;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Card(
        child: CustomInkWell(
          onTap: onTap,
          radius: 10,
          child: Stack(
            children: [
              // Image
              LeftSideUI(item: item),
              Padding(
                padding: EdgeInsets.only(
                  left: (context.screenWidth / 2.3) - 14,
                  bottom: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    getHeaderUI(context),
                    // Body
                    getBodyUI(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeaderUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(item.name).tsBodyM().bold().clr(oBlack30.whenDark(oWhite50)),
          ),
          3.height,
        ],
      ),
    );
  }

  Widget getBodyUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          // Departure date
          LeftRight(
            left: Row(
              children: [
                Icon(Icons.calendar_month, size: 17, color: oBlack50.whenDark(oWhite50)),
                5.width,
                Text(
                  'Berangkat ${item.departureDate!.yMMMd()}',
                  style: tsBodyM(),
                ),
              ],
            ),
          ),
          3.height,
          // Departure Place
          // LeftRight(
          //   left: Row(
          //     children: [
          //       Icon(Icons.near_me, size: 17, color: oBlack50.whenDark(oWhite50)),
          //       5.width,
          //       Text(
          //         'Dari ${item.departurePlace.first} dan +12 Kota',
          //         style: tsBodyM(),
          //       ),
          //     ],
          //   ),
          // ),
          // 3.height,
          // Travel duration
          LeftRight(
            left: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.access_time, size: 17, color: oBlack50.whenDark(oWhite50)),
                5.width,
                SizedBox(
                  width: 150,
                  child: Text(
                    'Paket ${item.duration} Hari',
                    style: tsBodyM(),
                  ),
                ),
              ],
            ),
          ),
          3.height,
          // Hotel & Travel Duration
          LeftRight(
            left: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.hotel, size: 17, color: oBlack50.whenDark(oWhite50)),
                5.width,
                CustomRatingStar(rating: item.hotels?[0].rating ?? 3),
              ],
            ),
          ),
          5.height,
          // Remaining seats
          // Tooltip(
          //   message: 'sisa ${item.remainingSeat} seat',
          //   child: SizedBox(
          //     height: 20,
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(4),
          //       child: LiquidLinearProgressIndicator(
          //         value: item.remainingSeat / item.totalSeat,
          //         valueColor: const AlwaysStoppedAnimation(Colors.cyan),
          //         backgroundColor: Colors.grey,
          //         center: Text(
          //           'sisa ${item.remainingSeat} kursi',
          //           style: tsBodyS().bold().clr(oWhite),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class LeftSideUI extends ConsumerWidget {
  const LeftSideUI({
    super.key,
    required this.item,
  });

  final Product item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filename = "${item.id}_${item.categoryName}";
    final fetchImage = ref.watch(fetchImageProvider(Reqs(url: item.image, fileKey: filename)));
    return Positioned.fill(
      right: context.screenWidth - (context.screenWidth / 2.3),
      child: fetchImage.when(
        data: (data) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: FileImage(File(data)),
                    fit: context.isLandscape() ? BoxFit.fitWidth : BoxFit.fitHeight,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    color: oWhite.whenDark(oBlack)!,
                    child: CustomRichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Mulai ',
                        style: tsLabelL().bold(),
                        children: [
                          // const TextSpan(text: "\n"),
                          TextSpan(
                            text: "${item.quadPrice.toIDR()} juta",
                            style: tsLabelL().bold().clr(oRed50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return Stack(
            children: [
              SizedBox.expand(
                child: CustomPaint(
                  painter: CrossPaint(color: oBlack50),
                  child: Center(
                    child: Text(
                      'Image Not Available',
                      textAlign: TextAlign.center,
                      style: tsCaption(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    color: oWhite,
                    child: CustomRichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Mulai ',
                        style: tsBodyM().bold(),
                        children: [
                          TextSpan(
                            text: "Rp ${item.quadPrice} juta",
                            style: tsBodyL().bold().clr(oRed50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      // child: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.brown,
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(10),
      //       bottomLeft: Radius.circular(10),
      //     ),
      //     image: DecorationImage(
      //       image: AssetImage(item.icon ?? ''),
      //       fit: BoxFit.fitHeight,
      //     ),
      //   ),
      // ),
    );
  }
}

// class LeftSideUI2 extends StatelessWidget {
//   const LeftSideUI2({
//     super.key,
//     required this.item,
//   });

//   final Product item;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       right: context.screenWidth - (context.screenWidth / 2.3),
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.brown,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 topRight: Radius.circular(6),
//                 bottomRight: Radius.circular(6),
//               ),
//               image: DecorationImage(
//                 image: NetworkImage(item.image),
//                 fit: context.isLandscape() ? BoxFit.fitWidth : BoxFit.fitHeight,
//                 onError: (exception, stackTrace) => const Text('Image Not Available !'),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               width: double.infinity,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 2),
//                 color: oWhite.whenDark(oBlack).withValues(alpha: .8),
//                 child: CustomRichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: 'Mulai ',
//                     style: tsBodyM().bold(),
//                     children: [
//                       // const TextSpan(text: "\n"),
//                       TextSpan(
//                         text: "Rp ${item.quadPrice} juta",
//                         style: tsBodyL().bold().clr(oRed50),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
