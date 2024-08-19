import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/user/controller/user_setting_controller.dart';
import 'package:amoora/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({
    super.key,
    this.color = oWhite,
  });

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        tooltip: context.isDarkMode ? 'Light Style' : 'Dark Style',
        style: IconButton.styleFrom(backgroundColor: primaryLight),
        onPressed: () {
          ref.read(themeModeProvider.notifier).state = switch (ref.watch(themeModeProvider)) {
            ThemeMode.system => ThemeMode.light,
            ThemeMode.light => ThemeMode.dark,
            ThemeMode.dark => ThemeMode.system,
          };
        },
        icon: switch (ref.watch(themeModeProvider)) {
          ThemeMode.system => Icon(SuperIcons.mg_sun_fog_fill, color: color),
          ThemeMode.light => Icon(Icons.dark_mode, color: color),
          ThemeMode.dark => Icon(Icons.light_mode, color: color),
        });
  }
}
