import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/ui_helper.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Daftar baru'.hardcoded),
        ),
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formStateKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.height,
                    Text(
                      'Silahkan lengkapi data diri anda dibawah ini'.hardcoded,
                      style: tsBodyL(),
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textEmailProvider),
                      onChanged: (val) => ref.read(textEmailProvider.notifier).state = val,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom email harus di isi'.hardcoded : null,
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textPasswordProvider),
                      onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                      hintText: 'Kode Sandi'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0!.isEmpty
                          ? 'Kolom kode sandi harus di isi'.hardcoded
                          : p0.length < 5
                              ? 'Minimum 5 karakter'.hardcoded
                              : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textPasswordConfirmProvider),
                      onChanged: (val) => ref.read(textPasswordConfirmProvider.notifier).state = val,
                      hintText: 'Konfirmasi kode sandi'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0! != ref.read(textPasswordProvider)
                          ? 'Kolom ini harus sama dengan kolom kode sandi'.hardcoded
                          : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textNameProvider),
                      onChanged: (val) => ref.read(textNameProvider.notifier).state = val,
                      hintText: 'Nama Panggilan',
                      prefixIcon: const Icon(Icons.face_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom nama panggilan harus di isi'.hardcoded : null,
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textFullNameProvider),
                      onChanged: (val) => ref.read(textFullNameProvider.notifier).state = val,
                      hintText: 'Nama Lengkap',
                      prefixIcon: const Icon(Icons.person_outline),
                      validator: (p0) => p0!.isEmpty ? 'Kolom nama lengkap harus di isi'.hardcoded : null,
                    ),
                    20.height,
                    CustomInput(
                      initialValue: ref.read(textPhoneProvider),
                      onChanged: (val) => ref.read(textPhoneProvider.notifier).state = val,
                      hintText: 'Nomor Telpon',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom nomor telpon harus di isi'.hardcoded : null,
                    ),
                    40.height,
                    CustomButton(
                      // busy: state.isLoading,
                      width: double.infinity,
                      child: Text('Daftar'.hardcoded),
                      onPressed: () async {
                        if (formStateKey.currentState!.validate() == false) {
                          return;
                        }
                        // Submit
                        ref.read(authCtrlProvider).signUp();
                      },
                    ),
                    20.height,
                    // CustomRichText(
                    //   text: TextSpan(
                    //     text: 'Sudah punya akun? '.hardcoded,
                    //     style: tsBodyM(),
                    //     children: [
                    //       TextSpan(
                    //         text: 'Yuk masuk !'.hardcoded,
                    //         style: tsBodyM().link(),
                    //         recognizer: TapGestureRecognizer()..onTapDown = (details) => context.pop(),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // 20.height,
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
