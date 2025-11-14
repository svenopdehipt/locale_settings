import 'dart:ui';

import 'package:locale_settings/locale_settings_platform_interface.dart';
export 'package:locale_settings/src/locale_listener.dart';

class LocaleSettings {
  const LocaleSettings();

  Future<Locale?> getCurrentLocale() async => LocaleSettingsPlatform.instance.getCurrentLocale();

  Future<void> setCurrentLocale(Locale locale) async {
    await LocaleSettingsPlatform.instance.setCurrentLocale(locale);
  }
}

Locale stringToLocale(final String locale) {
  final [language, country] = locale.replaceAll('_', '-').split('-');
  return Locale(language, country);
}
