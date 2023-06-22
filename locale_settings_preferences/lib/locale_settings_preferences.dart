library locale_settings_hive;

import 'dart:ui';

import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocaleSettingsPreferences extends LocaleSettingsPlatform {
  static void registerWith() {
    LocaleSettingsPlatform.instance = LocaleSettingsPreferences();
  }

  void Function(Locale locale)? _localeListener;

  static var preferenceKey = 'app_locale';

  final _preferences = SharedPreferences.getInstance();

  @override
  Future<Locale?> getCurrentLocale() async {
    final locale = (await _preferences).getString(preferenceKey);
    if (locale != null) {
      return stringToLocale(locale);
    }
    return null;
  }

  @override
  Future<void> setCurrentLocale(Locale locale) async {
    await (await _preferences).setString(preferenceKey, locale.toLanguageTag());
    _localeListener?.call(locale);
  }

  @override
  set localeListener(void Function(Locale locale) localeListener) {
    _localeListener = localeListener;
  }
}
