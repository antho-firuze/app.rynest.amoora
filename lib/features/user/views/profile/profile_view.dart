import 'package:amoora/common/widgets/button/custom_button.dart';
import 'package:amoora/common/widgets/button/darkmode_button.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/common/widgets/custom_ink_well.dart';
import 'package:amoora/common/widgets/custom_rich_text.dart';
import 'package:amoora/common/widgets/clipper/notch_clipper.dart';
import 'package:amoora/core/app_asset.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/auth/views/pwd_forgot_view.dart';
import 'package:amoora/features/auth/views/signin_view.dart';
import 'package:amoora/features/auth/views/signup_view.dart';
import 'package:amoora/features/user/controller/profile_ctrl.dart';
import 'package:amoora/features/user/views/profile/profile_edit_view.dart';
import 'package:amoora/features/user/views/user_setting/user_setting_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/theme_utils.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:amoora/utils/uuid_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

// decoration: const BoxDecoration(
//   image: DecorationImage(
//     image: AssetImage(AppAsset.imPattern),
//     repeat: ImageRepeat.repeat,
//     opacity: .2,
//   ),
// ),

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(profileProvider);

    return MyUI(
      customBackground: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAsset.imPattern),
            repeat: ImageRepeat.repeat,
            opacity: .2,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async => await ref.read(profileCtrlProvider).fetchProfile(),
            child: ListView(
              shrinkWrap: true,
              children: [
                10.height,
                Stack(
                  children: [
                    // Profile Card
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
                      child: ClipPath(
                        clipper: NotchClipper(holeRadius: 130),
                        child: Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                          decoration: BoxDecoration(
                            color: primaryLight,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: member == null
                              ? Center(
                                  child: Column(
                                    children: [
                                      10.height,
                                      Text(
                                        'Silahkan login terlebih dahulu !'.hardcoded,
                                        style: tsBodyM().clr(oWhite.whenDark(oWhite)),
                                      ),
                                      20.height,
                                      CustomButton(
                                        onPressed: () => context.goto(page: const SignInView()),
                                        child: const Text('Mari Masuk'),
                                      ),
                                      20.height,
                                      CustomRichText(
                                        text: TextSpan(
                                          text: 'Belum punya akun? '.hardcoded,
                                          style: tsBodyM().clr(oWhite.whenDark(oWhite)),
                                          children: [
                                            TextSpan(
                                              text: 'Yuk Daftar !'.hardcoded,
                                              style: tsBodyM().link(),
                                              recognizer: TapGestureRecognizer()
                                                ..onTapDown = (details) => context.goto(page: const SignUpView()),
                                            )
                                          ],
                                        ),
                                      ),
                                      10.height,
                                      CustomRichText(
                                        text: TextSpan(
                                          text: 'Lupa kode sandi? '.hardcoded,
                                          style: tsBodyM().clr(oWhite.whenDark(oWhite)),
                                          children: [
                                            TextSpan(
                                              text: 'Klik disini !'.hardcoded,
                                              style: tsBodyM().link(),
                                              recognizer: TapGestureRecognizer()
                                                ..onTapDown = (details) => context.goto(page: const PwdForgotView()),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      member.fullName,
                                      textAlign: TextAlign.center,
                                      style: tsHeadlineS().bold().clr(oGold50),
                                    ),
                                    Text(
                                      member.phone,
                                      textAlign: TextAlign.center,
                                      style: tsTitleL().clr(oGold),
                                    ),
                                    CustomInkWell(
                                      onTap: () => ref.read(authCtrlProvider).verifyPhone(),
                                      child: Text(
                                        member.isPhoneVerified ? 'Verified' : 'Belum di verifikasi !',
                                        style: ts.clr(member.isPhoneVerified ? oGreen : oRed),
                                      ),
                                    ),
                                    30.height,
                                    Text(
                                      member.email,
                                      textAlign: TextAlign.center,
                                      style: tsTitleL().clr(oGold),
                                    ),
                                    CustomInkWell(
                                      onTap: () => ref.read(authCtrlProvider).verifyEmail(),
                                      child: Text(
                                        member.isEmailVerified ? 'Verified' : 'Belum di verifikasi !',
                                        style: ts.clr(member.isEmailVerified ? oGreen : oRed),
                                      ),
                                    ),
                                    30.height,
                                    Text(
                                      member.address,
                                      textAlign: TextAlign.center,
                                      style: tsTitleS().clr(oWhite),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    // Menu Settings
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: DarkModeButton(),
                      ),
                    ),
                    // Menu Settings
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: IconButton(
                          onPressed: () => context.goto(page: const UserSettingView()),
                          color: oWhite,
                          style: IconButton.styleFrom(
                            backgroundColor: primaryLight,
                          ),
                          icon: const Icon(Icons.settings),
                        ),
                      ),
                    ),
                    // Photo profile
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CustomCircleButton(
                          size: 110,
                          child: member == null
                              ? Image.asset('assets/images/background_2.png', fit: BoxFit.cover)
                              : member.photo.isEmpty
                                  ? Image.asset('assets/images/sample/avatar.png', fit: BoxFit.cover)
                                  : Image.network(
                                      '${AppBase.prodUrl}${member.photo}?id=${uuid.v4()}',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                        'assets/images/sample/avatar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          onTap: () async {
                            if (member == null) {
                              return SnackBarService.show(message: 'Silahkan login terlebih dahulu !');
                            }

                            await Navigator.of(context, rootNavigator: true).push(
                              CupertinoPageRoute(
                                builder: (context) => const ProfileEditView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // if (member != null) ...[
                //   20.height,
                //   UpDown(
                //     up: 'NO. PASPOR',
                //     down: member.passportNo ?? '-',
                //   ),
                //   20.height,
                //   // const UpDown(
                //   //   up: 'GROUP',
                //   //   down: 'Paket Umroh Akhir Tahun',
                //   // ),
                // ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpDown extends StatelessWidget {
  const UpDown({
    super.key,
    required this.up,
    required this.down,
  });

  final String up;
  final String down;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(up).tsTitleL().bold().space(3).underline(distance: 5, line: TextDecorationStyle.dashed),
        15.height,
        Text(down).tsTitleM().bold(),
      ],
    );
  }
}
