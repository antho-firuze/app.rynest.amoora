import 'package:amoora/common/widgets/button/custom_iconbutton.dart';
import 'package:amoora/common/widgets/custom_rating_star.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/product/controller/product_controller.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/datetime_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailHotels extends ConsumerWidget {
  const DetailHotels({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(selectedProductProvider);
    if (item == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Penginapan'.hardcoded).tsHeadlineS().bold(),
          divider(padding: const EdgeInsets.symmetric(vertical: 5)),
          10.height,
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => 10.height,
            itemCount: item.hotels?.length ?? 0,
            itemBuilder: (context, index) {
              var hotel = item.hotels?[index];
              if (hotel == null) return null;
              return Card(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 130,
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       color: Colors.brown,
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(10),
                        //         topRight: Radius.circular(10),
                        //         bottomLeft: Radius.circular(6),
                        //         bottomRight: Radius.circular(6),
                        //       ),
                        //       image: DecorationImage(
                        //         image: NetworkImage('https://dummyimage.com/512x256'),
                        //         fit: BoxFit.cover,
                        //       ),
                        //       // image: DecorationImage(
                        //       //   image: FileImage(File(data)),
                        //       //   fit: BoxFit.cover,
                        //       // ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/hotel.png',
                                    height: 40,
                                  ),
                                  15.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(hotel.name).tsTitleM().bold(),
                                        Text(hotel.address).tsTitleM(),
                                        CustomRatingStar(rating: hotel.rating),
                                      ],
                                    ),
                                  ),
                                  CustomIconButton(
                                    onPressed: () => launchUrl(
                                      mode: LaunchMode.externalApplication,
                                      Uri.parse(hotel.linkMap),
                                    ),
                                    icon: const Icon(Icons.map, color: oWhite),
                                  )
                                ],
                              ),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text('Check-in').tsTitleM(),
                                      3.height,
                                      Text(hotel.checkIn!.yMMMd()).tsTitleL().bold(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Check-out').tsTitleM(),
                                      3.height,
                                      Text(hotel.checkOut!.yMMMd()).tsTitleL().bold()
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
