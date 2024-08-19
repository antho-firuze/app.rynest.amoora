import 'package:flutter/material.dart';
import 'package:amoora/core/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.busy = false,
    this.onPressed,
    this.enabled = true,
    this.color,
    this.width,
  });

  final bool busy;
  final Widget? child;
  final void Function()? onPressed;
  final bool enabled;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);

    if (width == double.infinity) {
      return SizedBox(
        width: double.infinity,
        child: button(onPressed: onPressed),
      );
    }

    return button(onPressed: onPressed);
  }

  ElevatedButton button({Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? primaryLight,
      ),
      child: busy
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )
          : child,
    );
  }
}
