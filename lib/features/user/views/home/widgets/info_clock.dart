import 'package:amoora/cff/widgets/icon_text.dart';
import 'package:amoora/cff/widgets/skelton.dart';
import 'package:amoora/cff/core/app_color.dart';
import 'package:amoora/cff/utils/clock_utils.dart';
import 'package:amoora/cff/utils/datetime_utils.dart';
import 'package:amoora/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoClock extends ConsumerWidget {
  const InfoClock({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockStream = ref.watch(clockStreamProvider);

    return clockStream.when(
      data: (data) => IconText(
        icon: const Icon(Icons.access_time, color: oGold200),
        text: Text(
          data.hm(),
          style: ts.clr(oGold200),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const Skelton(),
    );
  }
}
