import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/core/app_config.dart';
import 'package:amoora/features/auth/model/jwt_token.dart';
import 'package:amoora/features/auth/model/user.dart';
import 'package:amoora/features/auth/service/auth_service.dart';
import 'package:amoora/features/auth/views/code_verify_view.dart';
import 'package:amoora/features/user/controller/profile_controller.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = StateProvider<JwtToken?>((ref) => null);
final authUserProvider = StateProvider<User?>((ref) => null);

final textIdentifierProvider = StateProvider<String>((ref) => '');
final textPasswordOldProvider = StateProvider<String>((ref) => '');
final textPasswordProvider = StateProvider<String>((ref) => '');
final textPasswordConfirmProvider = StateProvider<String>((ref) => '');
final textEmailProvider = StateProvider<String>((ref) => '');
final textNameProvider = StateProvider<String>((ref) => '');
final textFullNameProvider = StateProvider<String>((ref) => '');
final textPhoneProvider = StateProvider<String>((ref) => '');

final verifyCodeProvider = StateProvider<String>((ref) => '');
final verifyTypeProvider = StateProvider<String>((ref) => 'email');
final countdownTimerProvider = StateProvider<int>((ref) => 60 * 3);
final isCountdownExpiredProvider = StateProvider<bool>((ref) => false);

class AuthCtrl {
  final Ref ref;
  AuthCtrl(this.ref);

  final String tokenKey = 'COOKIE_TOKEN';
  final String userKey = 'CURRENT_USER';

  void initialize() {
    log('Initialize User & Token !');

    ref.read(authUserProvider.notifier).state = getCurrUser();
    ref.read(authTokenProvider.notifier).state = getToken();
  }

  Future setRemember() async {}

  Future getRemember() async {}

  Future<JwtToken?> refreshToken() async {
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).refreshToken());

    if (state.hasError) return null;

    final jwtToken = JwtToken.fromJson(state.value);
    setToken(jwtToken);

    return jwtToken;
  }

  Future<void> signOut({bool force = false}) async {
    if (force) {
      setCurrUser(null);
      setToken(null);
      return;
    }

    await AlertService.confirm(
      body: "Anda yakin ingin keluar ?",
      onOk: () {
        setCurrUser(null);
        setToken(null);
        ref.read(goRouterProvider).pop();
      },
    );
  }

  Future<void> signUp() async {
    final data = {
      "identifier": ref.watch(textEmailProvider),
      "email": ref.watch(textEmailProvider),
      "password": ref.watch(textPasswordProvider),
      "name": ref.watch(textNameProvider),
      "full_name": ref.watch(textFullNameProvider),
      "phone": ref.watch(textPhoneProvider),
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).signUp(data: data));

    if (state.hasError) return;

    final jwtToken = JwtToken.fromJson(state.value);
    final user = User.fromJson(state.value['user']);

    setToken(jwtToken);
    setCurrUser(user);

    await AlertService.showOk(
      body: 'Perdaftaran Akun Berhasil !',
      onOk: () => ref.read(goRouterProvider).pop(),
    );
  }

  Future<bool> signIn() async {
    final data = {
      "identifier": ref.watch(textIdentifierProvider),
      "password": ref.watch(textPasswordProvider),
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).signIn(data: data));

    if (state.hasError) return false;

    final jwtToken = JwtToken.fromJson(state.value);
    final user = User.fromJson(state.value['user']);

    setToken(jwtToken);
    setCurrUser(user);

    return true;
    // ref.read(goRouterProvider).pop(true);
  }

  User? getCurrUser() {
    final data = ref.read(sharedPrefProvider).getString(userKey);
    return data != null ? User.fromJson(jsonDecode(data)) : null;
  }

  void setCurrUser(User? user) {
    if (user == null) {
      ref.read(authUserProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(userKey);
    } else {
      ref.read(authUserProvider.notifier).state = user;
      ref.read(sharedPrefProvider).setString(userKey, jsonEncode(user.toJson()));
    }
  }

  JwtToken? getToken() {
    final data = ref.read(sharedPrefProvider).getString(tokenKey);
    return data != null ? JwtToken.fromJson(jsonDecode(data)) : null;
  }

  void setToken(JwtToken? token) {
    if (token == null) {
      ref.read(authTokenProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(tokenKey);
    } else {
      ref.read(authTokenProvider.notifier).state = token;
      ref.read(sharedPrefProvider).setString(tokenKey, jsonEncode(token.toJson()));
    }
  }

  Future<void> sendCode() async {
    final data = {
      "email": ref.watch(textEmailProvider),
      "send_via": "sms",
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendCode(data: data));

    if (state.hasError) return;

    log(state.value['verification_code']);
    ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
    ref.read(verifyTypeProvider.notifier).state = 'forgot_password';
    ref.read(isCountdownExpiredProvider.notifier).state = false;
    ref.read(countdownTimerProvider.notifier).state = 60 * 3;

    await AlertService.showOk(
      body: 'Kode verifikasi telah dikirimkan silahkan anda cek !',
      onOk: () async {
        final result = await ref.read(goRouterProvider).push('/code_verify');
        if (result == true) {
          ref.read(goRouterProvider).pop(true);
        }
      },
    );
  }

  Future<void> resendCode() async {
    if (ref.read(isCountdownExpiredProvider) == false) {
      return SnackBarService.show(message: 'Hitung mundur masih berlaku !');
    }

    switch (ref.read(verifyTypeProvider)) {
      case 'email':
        final data = {
          "type": "email",
          "is_testing": AppConfig.isTesting,
        };
        final state =
            await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendVerificationCode(data: data));
        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      case 'phone':
        final data = {
          "type": "phone",
          "is_testing": AppConfig.isTesting,
        };
        final state =
            await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendVerificationCode(data: data));
        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      default:
        final data = {
          "email": ref.watch(textEmailProvider),
          "send_via": "sms",
        };
        final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendCode(data: data));
        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
    }

    await AlertService.showOk(
      body: 'Kode verifikasi telah dikirimkan ulang silahkan anda cek kembali !',
      onOk: () async {
        ref.read(isCountdownExpiredProvider.notifier).state = false;
      },
    );
  }

  Future<void> resetPwd() async {
    final data = {
      "email": ref.watch(textEmailProvider),
      "password": ref.watch(textPasswordProvider),
      "need_confirm": false,
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).resetPwd(data: data));

    if (state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, silahkan anda coba masuk dengan kode sandi terbaru !'.hardcoded,
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> changePwd() async {
    final data = {
      "old_password": ref.watch(textPasswordOldProvider),
      "new_password": ref.watch(textPasswordProvider),
      "need_confirm": false,
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).changePwd(data: data));

    if (state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, kode sandi sudah berubah !'.hardcoded,
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> verifyEmail() async {
    await AlertService.confirm(
      body: 'Apakah anda ingin verifikasi email sekarang?'.hardcoded,
      onYes: () async {
        final data = {
          "type": "email",
          "is_testing": AppConfig.isTesting,
        };
        final state =
            await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendVerificationCode(data: data));

        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        ref.read(verifyTypeProvider.notifier).state = 'email';
        ref.read(isCountdownExpiredProvider.notifier).state = false;
        ref.read(countdownTimerProvider.notifier).state = 60 * 3;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan cek email anda !'.hardcoded,
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              await confirmVerificationCode();
              return await AlertService.showOk(
                body: 'Alamat Email telah ter-verifikasi.',
              );
            }
          },
        );
      },
    );
  }

  Future<void> verifyPhone() async {
    await AlertService.confirm(
      body: 'Apakah anda ingin verifikasi nomor telepon sekarang?'.hardcoded,
      onYes: () async {
        final data = {
          "type": "phone",
          "is_testing": AppConfig.isTesting,
        };
        final state =
            await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendVerificationCode(data: data));

        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        ref.read(verifyTypeProvider.notifier).state = 'phone';
        ref.read(isCountdownExpiredProvider.notifier).state = false;
        ref.read(countdownTimerProvider.notifier).state = 60 * 5;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan anda cek !'.hardcoded,
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              await confirmVerificationCode();
              return await AlertService.showOk(
                body: 'Nomor HP telah ter-verifikasi.',
              );
            }
          },
        );
      },
    );
  }

  Future<void> confirmVerificationCode() async {
    final data = {
      "type": ref.read(verifyTypeProvider),
    };
    final state =
        await AsyncValue.guard(() async => await ref.read(authServiceProvider).confirmVerificationCode(data: data));

    if (state.hasError) return;

    if (ref.read(verifyTypeProvider) == 'email') {
      ref.read(profileCtrlProvider).updateCurrProfileLocal({'is_email_verified': 1});
      return;
    }
    if (ref.read(verifyTypeProvider) == 'phone') {
      ref.read(profileCtrlProvider).updateCurrProfileLocal({'is_phone_verified': 1});
      return;
    }
  }

  Future<void> unregister() async {
    await AlertService.confirm(
      body: 'Anda yakin ingin menutup Akun ?'.hardcoded,
      onYes: () async {
        final data = {
          "type": "unregister",
          "is_testing": AppConfig.isTesting,
        };
        final state =
            await AsyncValue.guard(() async => await ref.read(authServiceProvider).sendVerificationCode(data: data));

        if (state.hasError) return;

        log(state.value['verification_code']);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        ref.read(verifyTypeProvider.notifier).state = 'unregister';
        ref.read(isCountdownExpiredProvider.notifier).state = false;
        ref.read(countdownTimerProvider.notifier).state = 60 * 3;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan cek email anda !'.hardcoded,
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              if (ref.read(goRouterProvider).canPop()) ref.read(goRouterProvider).pop();
              await closingAccount();
              return await AlertService.showOk(
                body: 'Akun anda telah berhasil di TUTUP !.',
                onOk: () => ref.read(goRouterProvider).pop(true),
              );
            }
          },
        );
      },
    );
  }

  Future<void> closingAccount() async {
    final data = {
      "is_send_email_info": true,
      "is_testing": AppConfig.isTesting,
    };
    final state = await AsyncValue.guard(() async => await ref.read(authServiceProvider).closingAccount(data: data));

    if (state.hasError) return;

    await signOut(force: true);
  }
}

final authCtrlProvider = Provider(AuthCtrl.new);
