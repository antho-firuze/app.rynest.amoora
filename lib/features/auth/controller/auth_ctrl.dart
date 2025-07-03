import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/core/app_config.dart';
import 'package:amoora/features/auth/model/jwt_token.dart';
import 'package:amoora/features/auth/model/user.dart';
import 'package:amoora/features/auth/views/code_verify_view.dart';
import 'package:amoora/features/auth/views/signin_view.dart';
import 'package:amoora/features/user/controller/profile_ctrl.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/common/services/alert_service.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = 'AUTH-CTRL';

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
final isRememberProvider = StateProvider<bool>((ref) => false);

final verifyCodeProvider = StateProvider<String>((ref) => '');
final verifyTypeProvider = StateProvider<String>((ref) => 'email');
final countdownTimerProvider = StateProvider<int>((ref) => 60 * 3);
final isCountdownExpiredProvider = StateProvider<bool>((ref) => false);

class AuthCtrl {
  final Ref ref;
  AuthCtrl(this.ref);

  final _tokenKey = 'COOKIE_TOKEN';
  final _userKey = 'COOKIE_USER';
  final _rememberKey = 'COOKIE_REMEMBER';

  void initialize() {
    log('Initialize User & Token !');

    loadUser();
    loadToken();
    loadRemember();
  }

  void loadRemember() {
    final data = ref.read(sharedPrefProvider).getString(_rememberKey);
    if (data != null) {
      final remember = jsonDecode(data);
      ref.read(textIdentifierProvider.notifier).state = remember['identifier'];
      ref.read(textPasswordProvider.notifier).state = remember['password'];
      ref.read(isRememberProvider.notifier).state = true;
    } else {
      ref.read(textIdentifierProvider.notifier).state = '';
      ref.read(textPasswordProvider.notifier).state = '';
      ref.read(isRememberProvider.notifier).state = false;
    }
  }

  void setRemember(bool value) {
    if (ref.read(isRememberProvider)) {
      final remember = {"identifier": ref.read(textIdentifierProvider), "password": ref.read(textPasswordProvider)};
      ref.read(sharedPrefProvider).setString(_rememberKey, jsonEncode(remember));
    } else {
      ref.read(textIdentifierProvider.notifier).state = '';
      ref.read(textPasswordProvider.notifier).state = '';
      ref.read(sharedPrefProvider).remove(_rememberKey);
    }
  }

  String get roleName => switch (ref.read(authUserProvider)?.roleId) {
        1 => "Jama'ah",
        2 => "Muthowwif",
        int() => 'Admin',
        null => 'Umum',
      };

  Future<JwtToken?> refreshToken() async {
    final reqs = Reqs(path: '/api/v1/auth/refresh_token', data: {});
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).refreshToken(
          reqs: reqs,
          refreshToken: ref.read(authTokenProvider)?.refreshToken,
        ));

    if (state.hasError) return null;

    final jwtToken = JwtToken.fromJson(state.value);
    setToken(jwtToken);

    return jwtToken;
  }

  Future<void> signOut({bool silence = false}) async {
    if (silence) {
      setUser(null);
      setToken(null);
      return;
    }

    await AlertService.confirm(
      body: "Anda yakin ingin keluar ?",
      onYes: () {
        setUser(null);
        setToken(null);
      },
    );
  }

  Future<void> signUp() async {
    final reqs = Reqs(path: '/api/v1/auth/signup', data: {
      "identifier": ref.read(textEmailProvider),
      "email": ref.read(textEmailProvider),
      "password": ref.read(textPasswordProvider),
      "name": ref.read(textNameProvider),
      "full_name": ref.read(textFullNameProvider),
      "phone": ref.read(textPhoneProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;

    final jwtToken = JwtToken.fromJson(state.value);
    final user = User.fromJson(state.value['user']);

    setToken(jwtToken);
    setUser(user);

    await AlertService.showOk(
      body: 'Perdaftaran Akun Berhasil !',
      onOk: () => ref.read(goRouterProvider).pop(),
    );
  }

  Future<bool> signIn() async {
    final reqs = Reqs(path: '/api/v1/auth/signin', data: {
      "identifier": ref.read(textIdentifierProvider),
      "password": ref.read(textPasswordProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return false;

    final jwtToken = JwtToken.fromJson(state.value);
    final user = User.fromJson(state.value['user']);

    setToken(jwtToken);
    setUser(user);
    setRemember(ref.read(isRememberProvider));

    return true;
  }

  void loadUser() {
    final data = ref.read(sharedPrefProvider).getString(_userKey);
    if (data != null) {
      final user = User.fromJson(jsonDecode(data));
      ref.read(authUserProvider.notifier).state = user;
    } else {
      ref.read(authUserProvider.notifier).state = null;
    }
  }

  void setUser(User? user) {
    if (user == null) {
      ref.read(authUserProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_userKey);
    } else {
      ref.read(authUserProvider.notifier).state = user;
      ref.read(sharedPrefProvider).setString(_userKey, jsonEncode(user.toJson()));
    }
  }

  void loadToken() {
    final data = ref.read(sharedPrefProvider).getString(_tokenKey);
    if (data != null) {
      final token = JwtToken.fromJson(jsonDecode(data));
      ref.read(authTokenProvider.notifier).state = token;
    } else {
      ref.read(authTokenProvider.notifier).state = null;
    }
  }

  void setToken(JwtToken? token) {
    if (token == null) {
      ref.read(authTokenProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_tokenKey);
    } else {
      ref.read(authTokenProvider.notifier).state = token;
      ref.read(sharedPrefProvider).setString(_tokenKey, jsonEncode(token.toJson()));
    }
  }

  Future<void> sendCode() async {
    final reqs = Reqs(path: '/api/v1/auth/send_code', data: {
      "email": ref.read(textEmailProvider),
      "send_via": "sms",
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;

    log("sendCode => verification_code : ${state.value['verification_code']}", name: _kLogName);
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
        final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
          "type": "email",
          "is_testing": AppConfig.isTesting,
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("resendCode => verification_code : ${state.value['verification_code']}", name: _kLogName);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      case 'phone':
        final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
          "type": "phone",
          "is_testing": AppConfig.isTesting,
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("resendCode => verification_code : ${state.value['verification_code']}", name: _kLogName);
        ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      default:
        final reqs = Reqs(path: '/api/v1/auth/send_code', data: {
          "email": ref.read(textEmailProvider),
          "send_via": "sms",
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("resendCode => verification_code : ${state.value['verification_code']}", name: _kLogName);
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
    final reqs = Reqs(path: '/api/v1/auth/reset_pwd', data: {
      "email": ref.read(textEmailProvider),
      "password": ref.read(textPasswordProvider),
      "need_confirm": false,
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, silahkan anda coba masuk dengan kode sandi terbaru !'.hardcoded,
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> changePwd() async {
    final reqs = Reqs(path: '/api/v1/auth/change_pwd', data: {
      "old_password": ref.read(textPasswordOldProvider),
      "new_password": ref.read(textPasswordProvider),
      "need_confirm": false,
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

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
        final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
          "type": "email",
          "is_testing": AppConfig.isTesting,
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("verifyEmail => verification_code : ${state.value['verification_code']}", name: _kLogName);
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
        final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
          "type": "phone",
          "is_testing": AppConfig.isTesting,
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("verifyPhone => verification_code : ${state.value['verification_code']}", name: _kLogName);
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
    final reqs = Reqs(path: '/api/v1/auth/confirm_verification_code', data: {
      "type": ref.read(verifyTypeProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

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
      body: 'Anda yakin ingin menutup Akun Anda di Amoora ?'.hardcoded,
      onYes: () async {
        final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
          "type": "unregister",
          "is_testing": AppConfig.isTesting,
        });
        final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (state.hasError) return;

        log("unregister => verification_code : ${state.value['verification_code']}", name: _kLogName);
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
    final reqs = Reqs(path: '/api/v1/auth/closing_account', data: {
      "is_send_email_info": true,
      "is_testing": AppConfig.isTesting,
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;

    await signOut(silence: true);
  }

  Future signInCallback({required VoidCallback next}) async {
    if (ref.read(authTokenProvider) == null) {
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return next();
      }
    } else {
      return next();
    }
  }

  Future signInGoto({required Widget page}) async {
    if (ref.read(authTokenProvider) == null) {
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return await ref.read(pageUtilsProvider).goto(page: page);
      }
    } else {
      return await ref.read(pageUtilsProvider).goto(page: page);
    }
  }
}

final authCtrlProvider = Provider(AuthCtrl.new);
