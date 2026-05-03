// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get info => 'Information';

  @override
  String get error => 'Opss...';

  @override
  String get confirm => 'Confirmation';

  @override
  String get retry => 'Retry';

  @override
  String get inputUsernamePassword => 'Input Username and Password';

  @override
  String get inputUsername => 'Input Username';

  @override
  String get inputPassword => 'Input Password';

  @override
  String get inputFullname => 'Input Full Name';

  @override
  String get inputPhone => 'Input WhatsApp Number';

  @override
  String get anotherDeviceDetected =>
      'You just logged in on another [%s] device.';

  @override
  String get doYouWantRelogin => 'Do you want to re-login ?';
}
