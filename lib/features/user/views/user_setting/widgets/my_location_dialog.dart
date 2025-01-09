import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_dialog.dart';
import 'package:amoora/features/user/controller/user_setting_ctrl.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyLocationDialog extends ConsumerWidget {
  const MyLocationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDialog(
      title: const Text('Pantau Lokasi Saya'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Digunakan untuk monitoring Jama'ah khususnya jama'ah lansia agar tidak tersesat."),
          20.height,
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Pantau lokasi saya').bold(),
            subtitle: const Text('Monitoring saat aplikasi aktif').tsLabelL(),
            value: TrackingMyLocation.allowed,
            groupValue: ref.watch(trackingLocationProvider),
            onChanged: (value) {
              ref.read(trackingLocationProvider.notifier).state = value!;
              context.pop();
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Pantau lokasi hanya di Arab Saudi').bold(),
            subtitle: const Text('Monitoring tidak aktif di luar Arab Saudi').tsLabelL(),
            value: TrackingMyLocation.onlyInSaudiArabia,
            groupValue: ref.watch(trackingLocationProvider),
            onChanged: (value) {
              ref.read(trackingLocationProvider.notifier).state = value!;
              context.pop();
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Jangan pantau lokasi saya').bold(),
            subtitle: const Text('Tidak disarankan').tsLabelL(),
            value: TrackingMyLocation.notAllowed,
            groupValue: ref.watch(trackingLocationProvider),
            onChanged: (value) {
              ref.read(trackingLocationProvider.notifier).state = value!;
              context.pop();
            },
          ),
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   title: const Text('Pantau saat aplikasi aktif').bold(),
          //   trailing: Switch(
          //     value: ref.watch(allowMonitorLocationProvider),
          //     onChanged: (_) =>
          //         ref.read(allowMonitorLocationProvider.notifier).state = !ref.read(allowMonitorLocationProvider),
          //   ),
          // ),
          // 20.height,
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   title: const Text('Pantau hanya saat di Arab Saudi').bold(),
          //   subtitle: const Text('Monitoring tidak aktif di luar Arab Saudi').thin,
          //   trailing: Switch(
          //     value: ref.watch(allowMonitorInArabOnlyProvider),
          //     onChanged: (_) =>
          //         ref.read(allowMonitorInArabOnlyProvider.notifier).state = !ref.read(allowMonitorInArabOnlyProvider),
          //   ),
          // ),
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
