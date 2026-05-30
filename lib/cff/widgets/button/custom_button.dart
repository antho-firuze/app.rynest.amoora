import 'package:amoora/cff/core/app_color.dart';
import 'package:amoora/cff/utils/orientation_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.busy = false,
    this.enabled = true,
    this.color,
    this.minWidth,
    this.tooltip,
    this.child,
    this.flat = false,
    this.onPressed,
  });

  final bool busy;
  final bool enabled;
  final Color? color;
  final double? minWidth;
  final String? tooltip;
  final Widget? child;
  final bool flat;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    final buttonStyleNormal = ElevatedButton.styleFrom(
      backgroundColor: color,
      iconColor: oWhite,
      iconSize: 15,
    );
    final buttonStyleFlat = ElevatedButton.styleFrom(
      foregroundColor: primaryLight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: oGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      iconColor: primaryLight,
      iconSize: 15,
    );

    return SizedBox(
      width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
      child: Tooltip(
        message: tooltip ?? "",
        child: ElevatedButton(
          onPressed: onPressed,
          style: flat ? buttonStyleFlat : buttonStyleNormal,
          child: busy
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
