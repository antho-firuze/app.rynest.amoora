import 'package:amoora/common/widgets/spinning.dart';
import 'package:amoora/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.busy = false,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.isCircle = true,
    this.padding,
  });

  final bool busy;
  final String? tooltip;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final Widget icon;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: IconButton(
        onPressed: onPressed,
        style: isCircle
            ? IconButton.styleFrom(
                padding: padding,
                backgroundColor: primaryLight,
              )
            : null,
        icon: busy ? Spinning(child: icon) : icon,
      ),
    );
  }
}
