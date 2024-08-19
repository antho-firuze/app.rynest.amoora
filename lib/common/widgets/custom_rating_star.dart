import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomRatingStar extends StatelessWidget {
  const CustomRatingStar({
    super.key,
    this.rating = 1,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            SuperIcons.mg_star_fill,
            size: 12,
            color: (index <= (rating - 1)) ? oGold : oGrey70,
          );
        },
        separatorBuilder: (context, index) => 5.width,
        itemCount: 5,
      ),
    );
  }
}
