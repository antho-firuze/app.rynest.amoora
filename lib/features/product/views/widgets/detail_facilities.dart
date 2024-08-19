import 'package:amoora/common/widgets/custom_card.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/orientation_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class DetailFacilities extends StatelessWidget {
  const DetailFacilities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Fasilitas'.hardcoded).tsHeadlineS().bold(),
          divider(padding: const EdgeInsets.symmetric(vertical: 5)),
          10.height,
          

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     GridView.count(
          //       shrinkWrap: true,
          //       padding: EdgeInsets.zero,
          //       crossAxisCount: context.isLandscape() ? 4 : 2,
          //       mainAxisSpacing: 5,
          //       crossAxisSpacing: 5,
          //       childAspectRatio: 1.3,
          //       physics: const ClampingScrollPhysics(),
          //       children: [
          //         facilityCard(
          //           context,
          //           title: 'Itinerary',
          //           icon: Icons.format_line_spacing_sharp,
          //           color: oBasilGreen,
          //           onTap: () => context.push('/travel_itinerary'),
          //         ),
          //         facilityCard(
          //           context,
          //           title: 'Hotel',
          //           icon: Icons.hotel,
          //           color: oDarkBrown,
          //           onTap: () => context.push('/travel_hotel'),
          //         ),
          //         facilityCard(
          //           context,
          //           title: 'Penerbangan',
          //           icon: Icons.flight_takeoff,
          //           color: oLightBrown,
          //           onTap: () => context.push('/travel_flight'),
          //         ),
          //         facilityCard(
          //           context,
          //           title: 'Transportasi',
          //           icon: Icons.train,
          //           color: oGold200,
          //           onTap: () => context.push('/travel_transportation'),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget facilityCard(
    BuildContext context, {
    String? title,
    Color? color,
    IconData? icon,
    void Function()? onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon ?? Icons.insert_invitation,
              size: context.isLandscape() ? 40 : 50,
              color: oWhite50,
            ),
            10.height,
            Expanded(
              child: Text(
                title ?? '',
                style: tsTitleL().bold().clr(oWhite50),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
