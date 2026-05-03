import 'package:amoora/cff/widgets/custom_image.dart';
import 'package:amoora/cff/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.image,
    this.initial,
    this.size = 45,
    this.borderRadius,
    this.ratio = 1.0,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.circle,
    this.onTap,
  });

  final String? image;
  final String? initial;
  final double size;
  final BoxFit fit;
  final double ratio;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final imageSrc = image ?? 'assets/images/avatar.png';
    final errorWidget = CustomImage(src: 'assets/images/avatar-broken.png', fit: fit);

    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: primaryLight,
          borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(12),
          shape: shape,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            child: shape == BoxShape.circle
                ? Center(
                    child: OverflowBox(
                      maxWidth: size * ratio,
                      maxHeight: size * ratio,
                      child: CustomImage(src: imageSrc, fit: fit, errorWidget: errorWidget),
                    ),
                  )
                : Center(
                    child: OverflowBox(
                      maxWidth: size * ratio,
                      maxHeight: size * ratio,
                      child: CustomImage(src: imageSrc, fit: fit, errorWidget: errorWidget),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
