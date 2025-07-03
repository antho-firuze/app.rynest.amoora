import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/features/live_streaming/controller/streaming_ctrl.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

class StreamerView extends ConsumerWidget {
  const StreamerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Siaran Live'.hardcoded)),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              shrinkWrap: true,
              children: [
                Form(
                  key: formStateKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        20.height,
                        const Text("Silahkan masukkan Judul Materi/Ceramah.").tsTitleL().center(),
                        20.height,
                        CustomInput(
                          onChanged: (val) => ref.read(labelStreamingProvider.notifier).state = val,
                          hintText: 'Judul',
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(SuperIcons.is_microphone_2_outline),
                          validator: (p0) => p0!.isEmpty ? 'Kolom Judul harap di isi'.hardcoded : null,
                        ),
                        20.height,
                        CustomButton(
                          busy: false,
                          width: double.infinity,
                          child: Text('Mulai Streaming'.hardcoded),
                          onPressed: () async {
                            if (formStateKey.currentState!.validate() == false) {
                              return;
                            }
                            bool result = await ref
                                .read(streamingCtrlProvider)
                                .startStreaming(title: ref.read(labelStreamingProvider));
                            if (result) {
                              if (context.mounted) context.pop();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
