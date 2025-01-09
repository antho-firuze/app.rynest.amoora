import 'package:amoora/common/widgets/forms/group_list.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/features/prayers/controller/prayers_ctrl.dart';
import 'package:amoora/features/prayers/views/widgets/arabic_font_dialog.dart';
import 'package:amoora/features/prayers/views/widgets/latin_font_dialog.dart';
import 'package:amoora/features/prayers/views/widgets/trans_font_dialog.dart';
import 'package:amoora/common/widgets/appearance_dialog.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Pengaturan')),
        body: ListView(
          shrinkWrap: true,
          children: [
            GroupList(
              header: ListTile(title: const Text("Arabic").bold().clr(oGold300)),
              children: [
                ListTile(
                  title: const Text('Ukuran Font Arabic').bold(),
                  subtitle: Text('${ref.watch(arabicFontSizeProvider).toInt()} px'),
                  onTap: () async {
                    return await showDialog(
                      context: context,
                      builder: (context) => const ArabicFontDialog(),
                    );
                  },
                ),
              ],
            ),
            GroupList(
              header: ListTile(title: const Text("Bahasa Latin (Transliterasi)").bold().clr(oGold300)),
              children: [
                ListTile(
                  title: const Text('Tampilkan Bahasa Latin').bold(),
                  subtitle: const Text("Tampilkan transliterasi Qur'an Bahasa Latin"),
                  trailing: Switch(
                    value: ref.watch(showLatinProvider),
                    onChanged: (_) => ref.read(prayersCtrlProvider).setShowLatin(!ref.watch(showLatinProvider)),
                  ),
                ),
                ListTile(
                  title: const Text('Ukuran Font Latin').bold(),
                  subtitle: Text('${ref.watch(latinFontSizeProvider).toInt()} px'),
                  onTap: () async {
                    return await showDialog(
                      context: context,
                      builder: (context) => const LatinFontDialog(),
                    );
                  },
                ),
              ],
            ),
            GroupList(
              header: ListTile(title: const Text("Terjemahan").bold().clr(oGold300)),
              children: [
                ListTile(
                  title: const Text('Tampilkan Terjemahan').bold(),
                  subtitle: const Text("Tampilkan terjemahan Qur'an Bahasa Indonesia"),
                  trailing: Switch(
                    value: ref.watch(showTransProvider),
                    onChanged: (_) => ref.read(prayersCtrlProvider).setShowTrans(!ref.watch(showTransProvider)),
                  ),
                ),
                ListTile(
                  title: const Text('Ukuran Font Terjemahan').bold(),
                  subtitle: Text('${ref.watch(transFontSizeProvider).toInt()} px'),
                  onTap: () async {
                    return await showDialog(
                      context: context,
                      builder: (context) => const TransFontDialog(),
                    );
                  },
                ),
              ],
            ),
            GroupList(
              header: ListTile(title: const Text("Umum").bold().clr(oGold300)),
              children: [
                ListTile(
                  title: const Text('Tampilan Aplikasi').bold(),
                  subtitle: Text('Atur tampilan warna di Aplikasi'.hardcoded).tsLabelL(),
                  onTap: () async => await showDialog(
                    context: context,
                    builder: (context) => const AppearanceDialog(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
