import 'package:amoora/common/controllers/developer_ctrl.dart';
import 'package:amoora/common/controllers/version_ctrl.dart';
import 'package:amoora/common/widgets/skelton.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VersionInfo extends ConsumerWidget {
  const VersionInfo({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchVersionProvider).when(
          loading: () => const Skelton(),
          error: (Object error, StackTrace stackTrace) => Container(),
          data: (String data) => GestureDetector(
            onTap: () => ref.read(developerCtrlProvider).devModeProcess(),
            child: Text('Version $data').tsTitleM().clr(ref.watch(devModeProvider) ? Colors.indigo : color).center(),
          ),
        );
  }
}
