import 'package:amoora/localization/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}