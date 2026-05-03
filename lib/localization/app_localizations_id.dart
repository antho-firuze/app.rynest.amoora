// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get info => 'Informasi';

  @override
  String get error => 'Opss...';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get retry => 'Coba lagi';

  @override
  String get inputUsernamePassword => 'Masukkan Username dan Password';

  @override
  String get inputUsername => 'Masukkan Username';

  @override
  String get inputPassword => 'Masukkan Password';

  @override
  String get inputFullname => 'Masukkan Nama Lengkap';

  @override
  String get inputPhone => 'Masukkan No WhatsApp';

  @override
  String get anotherDeviceDetected =>
      'Kamu baru saja login di perangkat [%s] yang lain.';

  @override
  String get doYouWantRelogin => 'Apakah kamu ingin login ulang ?';
}
