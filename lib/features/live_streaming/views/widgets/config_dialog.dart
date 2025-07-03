import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/features/live_streaming/controller/streaming_ctrl.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfigDialog extends ConsumerWidget {
  const ConfigDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDialog(
      title: const Text('Server Config').bold(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Rynest (default)').bold(),
            subtitle: const Text('Internal STUN/TURN Server Rynest.').tsLabelL(),
            value: IceServers.rynest,
            groupValue: ref.watch(iceServersProvider),
            onChanged: (value) {
              ref.read(iceServersProvider.notifier).state = value!;
              context.pop();
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Google').bold(),
            subtitle: const Text('Open STUN/TURN Server Google (free).').tsLabelL(),
            value: IceServers.google,
            groupValue: ref.watch(iceServersProvider),
            onChanged: (value) {
              ref.read(iceServersProvider.notifier).state = value!;
              context.pop();
            },
          ),
          // RadioListTile(
          //   contentPadding: EdgeInsets.zero,
          //   title: const Text('Dark Mode').bold(),
          //   subtitle: const Text('Tampilan dengan warna gelap, cocok digunakan untuk malam hari atau tempat gelap.')
          //       .tsLabelL(),
          //   value: ThemeMode.dark,
          //   groupValue: ref.watch(themeModeProvider),
          //   onChanged: (value) {
          //     ref.read(themeModeProvider.notifier).state = value!;
          //     context.pop();
          //   },
          // ),
        ],
      ),
      actions: [
        CustomButton(
          child: const Text('TUTUP'),
          onPressed: () => context.popz(),
        ),
      ],
    );
  }
}
