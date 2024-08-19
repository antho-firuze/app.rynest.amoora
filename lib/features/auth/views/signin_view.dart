import 'package:amoora/common/widgets/button/custom_button.dart';
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
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/localization/string_hardcoded.dart';
// import 'package:amoora/utils/async_value_ui.dart';
import 'package:amoora/utils/ui_helper.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formStateKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Selamat datang !'.hardcoded,
                      style: tsHeadlineL(),
                    ),
                    Text(
                      'Masukkan email dan sandi anda'.hardcoded,
                      style: tsBodyL(),
                    ),
                    40.height,
                    CustomInput(
                      // initialValue: ref.read(textIdentifierProvider),
                      onChanged: (val) => ref.read(textIdentifierProvider.notifier).state = val,
                      hintText: 'Email/Phone/Username',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom email harap di isi'.hardcoded : null,
                      // validator: (p0) => p0!.isEmpty
                      //     ? 'Kolom email harap di isi'.hardcoded
                      //     : !p0.isEmail()
                      //         ? 'Harap di isi dengan email yang benar'.hardcoded
                      //         : null,
                    ),
                    20.height,
                    CustomInput(
                      // initialValue: ref.read(textPasswordProvider),
                      onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                      hintText: 'Sandi'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0!.isEmpty ? 'Kolom sandi harap di isi'.hardcoded : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Expanded(
                        //   child: CheckboxMee(
                        //     captionW: Text(
                        //       'Remember me',
                        //       style: tsLabelM(context),
                        //     ),
                        //     value: false,
                        //     onChanged: (bool val) {},
                        //   ),
                        // ),
                        InkWell(
                          onTap: () async {
                            var result = await context.goto(page: const PwdForgotView());
                            // var result = await context.push('/pwd_forgot');
                            if (result == true) {
                              // ignore: use_build_context_synchronously
                              context.pop();
                            }
                          },
                          child: Text(
                            'Lupa kode sandi?'.hardcoded,
                            style: tsBodyM().link(),
                          ),
                        ),
                      ],
                    ),
                    40.height,
                    CustomButton(
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
                    20.height,
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
            ),
          )),
        ),
      ),
    );
  }
}
