import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class DataFailed extends StatelessWidget {
  const DataFailed({
    super.key,
    this.message,
    this.onReload,
    this.onBack,
    this.padding,
  });

  final String? message;
  final EdgeInsetsGeometry? padding;
  final Function()? onReload;
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: context.screenWidthRatio(.15, 0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'assets/images/data-not-found.png',
              width: context.screenWidthRatio(.5, .3),
            ),
          ),
          Text(message ?? 'Data belum tersedia !'.hardcoded).tsTitleM().center(),
          if (onReload != null) ...[
            10.height,
            GestureDetector(
              onTap: onReload,
              child: Opacity(
                opacity: .3,
                child: Column(
                  children: [
                    const Icon(SuperIcons.is_refresh_2_bold, size: 35),
                    const Text('Reload').size(10).clr(oBlack)
                  ],
                ),
              ),
            ),
          ],
          if (onBack != null) ...[
            10.height,
            CustomButton(
              onPressed: onBack,
              child: const Text('Tutup'),
            ),
          ],
        ],
      ),
    );
  }
}
