import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/custom_checkbox.dart';
import 'package:amoora/common/widgets/custom_rich_text.dart';
import 'package:amoora/features/auth/views/pwd_forgot_view.dart';
import 'package:amoora/features/auth/views/signup_view.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora/common/widgets/custom_input.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/localization/string_hardcoded.dart';
// import 'package:amoora/utils/async_value_ui.dart';
import 'package:amoora/utils/ui_helper.dart';

class SignInView extends ConsumerWidget {
  const SignInView({
    super.key,
    this.isEmbed = false,
  });

  final bool isEmbed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          titleSpacing: 20,
          title: Text('Masuk ke akun anda'.hardcoded),
        ),
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child: Form(
              key: formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text('Selamat datang !'.hardcoded).tsHeadlineL(),
                        Text('Masukkan email dan sandi anda'.hardcoded).tsBodyL(),
                      ],
                    ),
                  ),
                  40.height,
                  // FORM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomInput(
                          initialValue: ref.read(textIdentifierProvider),
                          onChanged: (val) => ref.read(textIdentifierProvider.notifier).state = val,
                          hintText: 'Email/Phone/Username',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: (p0) => p0!.isEmpty ? 'Kolom email harap di isi'.hardcoded : null,
                        ),
                        10.height,
                        CustomInput(
                          initialValue: ref.read(textPasswordProvider),
                          onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                          hintText: 'Sandi'.hardcoded,
                          isPassword: true,
                          validator: (p0) => p0!.isEmpty ? 'Kolom sandi harap di isi'.hardcoded : null,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                      ],
                    ),
                  ),
                  10.height,
                  // REMEMBER ME & FORGOT
                  Consumer(
                    builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomCheckBox(
                                caption: const Text('Remember me').link(),
                                value: ref.watch(isRememberProvider),
                                onChanged: (bool val) =>
                                    ref.read(isRememberProvider.notifier).state = !ref.read(isRememberProvider),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var result = await context.goto(page: const PwdForgotView());
                                // var result = await context.push('/pwd_forgot');
                                if (result == true) {
                                  // ignore: use_build_context_synchronously
                                  context.pop();
                                }
                              },
                              child: Text('Lupa kode sandi?'.hardcoded).tsBodyM().link(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  40.height,
                  // SUBMIT BUTTON
                  Center(
                    child: CustomButton(
                      width: double.infinity,
                      child: Text('Mari masuk'.hardcoded),
                      onPressed: () async {
                        if (formStateKey.currentState!.validate() == false) {
                          return;
                        }

                        bool result = await ref.read(authCtrlProvider).signIn();
                        if (result && !isEmbed) {
                          if (context.mounted) context.pop();
                        }
                      },
                    ),
                  ),
                  20.height,
                  // REGISTRATION LINK
                  CustomRichText(
                    text: TextSpan(
                      text: 'Belum punya akun? '.hardcoded,
                      style: tsBodyM(),
                      children: [
                        TextSpan(
                          text: 'Yuk Daftar !'.hardcoded,
                          style: tsBodyM().link(),
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (details) async {
                              var result = await context.goto(page: const SignUpView());
                              if (result == true) {
                                // ignore: use_build_context_synchronously
                                context.pop();
                              }
                            },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
