import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppearanceDialog extends ConsumerWidget {
  const AppearanceDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDialog(
      title: const Text('Tampilan Aplikasi').bold(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Gunakan Pengaturan HP-mu').bold(),
            subtitle: const Text('Sesuaikan tampilan dengan mengikuti pengaturan di HP.').tsLabelL(),
            value: ThemeMode.system,
            groupValue: ref.watch(themeModeProvider),
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).state = value!;
              context.pop();
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Light Mode').bold(),
            subtitle: const Text('Tampilan dengan warna cerah, cocok digunakan untuk siang hari atau tempat terang.')
                .tsLabelL(),
            value: ThemeMode.light,
            groupValue: ref.watch(themeModeProvider),
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).state = value!;
              context.pop();
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode').bold(),
            subtitle: const Text('Tampilan dengan warna gelap, cocok digunakan untuk malam hari atau tempat gelap.')
                .tsLabelL(),
            value: ThemeMode.dark,
            groupValue: ref.watch(themeModeProvider),
            onChanged: (value) {
              ref.read(themeModeProvider.notifier).state = value!;
              context.pop();
            },
          ),
        ],
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
