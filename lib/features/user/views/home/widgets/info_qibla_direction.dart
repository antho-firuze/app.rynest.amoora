import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/qibla/view/qibla_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class InfoQiblaDirection extends ConsumerWidget {
  const InfoQiblaDirection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomInkWell(
      isCircle: true,
      onTap: () => context.goto(page: const QiblaView()),
      tooltip: 'Lihat Arah Kiblat'.hardcoded,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: oWhite.whenDark(oGrey70),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0x25000000).whenDark(oWhite70),
              blurRadius: 3.0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(SuperIcons.is_direct_up_bold, color: oBlack.whenDark(oGold)),
            5.height,
            Text('ARAH KIBLAT'.hardcoded).tsLabelS().bold(),
          ],
        ),
      ),
    );
  }
}
