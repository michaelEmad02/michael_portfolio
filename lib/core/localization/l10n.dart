import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw FlutterError('AppLocalizations not found in context.');
    }
    return localizations;
  }

  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';
}
