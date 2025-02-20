import 'package:amoora/common/widgets/cross_paint.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class ImageFailedLayout extends StatelessWidget {
  const ImageFailedLayout({
    super.key,
    this.title = 'Image Not Available',
    this.reload = 'Reload',
    this.foregroundColor,
    this.child,
    this.onTap,
  });

  final String title;
  final String reload;
  final Color? foregroundColor;
  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrossPaint(color: foregroundColor ?? oBlack50.withValues(alpha: .3)),
      child: Center(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                35.height,
                child ?? Text(title).center().clr(foregroundColor),
                GestureDetector(
                  onTap: onTap,
                  child: Opacity(
                    opacity: .3,
                    child: Column(
                      children: [
                        Icon(SuperIcons.is_refresh_2_bold, size: 35, color: foregroundColor),
                        Text(reload).size(10).clr(oBlack),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
