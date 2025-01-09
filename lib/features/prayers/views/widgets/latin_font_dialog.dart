import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LatinFontDialog extends ConsumerWidget {
  const LatinFontDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDialog(
      title: const Text('Set Ukuran Font Latin'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5,
          (index) => RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${(index * 2) + 22}').bold(),
            value: (index.toDouble() * 2) + 22,
            groupValue: ref.watch(latinFontSizeProvider),
            onChanged: (value) {
              ref.read(prayersCtrlProvider).setFontSize(FontType.latin, value!);
              context.pop();
            },
          ),
        ),
      ),
      actions: [
        CustomButton(
          child: const Text('BATAL'),
          onPressed: () => context.popz(),
        ),
      ],
    );
  }
}
