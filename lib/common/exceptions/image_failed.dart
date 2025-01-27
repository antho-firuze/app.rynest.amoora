import 'package:amoora/common/widgets/cross_paint.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class ImageFailed extends StatelessWidget {
  const ImageFailed({
    super.key,
    this.foregroundColor,
    this.child,
    this.onTap,
  });

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
                child ?? const Text('Image Not Available').center().clr(foregroundColor),
                GestureDetector(
                  onTap: onTap,
                  child: Opacity(
                    opacity: .3,
                    child: Column(
                      children: [const Icon(SuperIcons.is_refresh_2_bold, size: 35), const Text('Reload').size(10).clr(oBlack)],
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
