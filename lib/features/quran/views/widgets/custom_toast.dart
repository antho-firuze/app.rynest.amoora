import 'package:amoora/features/quran/controller/quran_notifier.dart';
import 'package:amoora/features/quran/controller/quran_experience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomToast extends ConsumerWidget {
  const CustomToast({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quran = ref.watch(quranNotifierProvider);
    var toast = ref.watch(quranToastProvider);

    return IgnorePointer(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: toast ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black87,
          ),
          child: Text(
            quran.hizbText ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
