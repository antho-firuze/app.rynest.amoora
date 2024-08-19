import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/quran/controller/quran_experience.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomContainer extends ConsumerWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.offsetY = 1,
  });

  final Widget child;
  final EdgeInsets padding;
  final double offsetY;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(quranOverlayProvider);

    // debugPrint('isShowOverlay: $isShowOverlay');
    return AnimatedSlide(
      offset: Offset(0, isShowOverlay ? 0 : offsetY),
      duration: const Duration(milliseconds: 200),
      child: AnimatedOpacity(
        opacity: isShowOverlay ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          padding: padding,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: oBlack.withOpacity(.8).whenDark(oBlack.withOpacity(.9)),
            border: context.isDarkMode ? Border.all(width: 2, color: oWhite70) : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
