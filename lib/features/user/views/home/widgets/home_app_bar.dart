import 'package:amoora/common/widgets/app_logo.dart';
import 'package:amoora/core/app_color.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: primaryLight,
      padding: const EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogo(
            height: 35,
            color: oGold,
          ),
        ],
      ),
    );
  }
}
