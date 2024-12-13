import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/common/widgets/entry_page/entry_page.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formStateKey = GlobalKey<FormState>();

class TypeTextBox extends ConsumerWidget {
  const TypeTextBox({
    super.key,
    this.hint,
    this.description,
    this.initialValue,
    this.inputType = TextInputType.text,
    this.allowEmpty = false,
    this.onSubmit,
  });

  final String? hint;
  final String? description;
  final String? initialValue;
  final TextInputType inputType;
  final bool allowEmpty;
  final Function(dynamic val)? onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      formStateKey.currentState?.validate();
    });
    var newVal = initialValue;

    return Form(
      key: formStateKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            if (description != null) ...[
              Text(description!).tsTitleM(),
              20.height,
            ],
            CustomInput(
              initialValue: newVal,
              onChanged: (val) {
                if (allowEmpty) {
                  ref.read(isFormValidated.notifier).state = formStateKey.currentState!.validate();
                } else {
                  ref.read(isFormValidated.notifier).state =
                      formStateKey.currentState!.validate() && (val!.trim() != initialValue!.trim());
                }
                return newVal = val;
              },
              keyboardType: inputType,
              maxLines: inputType == TextInputType.multiline || inputType == TextInputType.streetAddress ? 3 : 1,
              hintText: hint,
              helperText: hint,
              validator: (p0) => p0!.isEmpty && !allowEmpty ? 'Kolom harus di isi'.hardcoded : null,
            ),
            30.height,
            CustomButton(
              width: double.infinity,
              onPressed: ref.watch(isFormValidated) ? () => onSubmit!(newVal) : null,
              child: Text('Simpan'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
