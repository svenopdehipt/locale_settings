library locale_settings_hive;

import 'package:flutter/cupertino.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
final class LocaleSettingsPreferences extends LocaleSettingsPlatform {
  static void registerWith() {
    LocaleSettingsPlatform.instance = LocaleSettingsPreferences();
  }

  static var preferenceKey = 'app_locale';

  final _preferences = SharedPreferences.getInstance();

  @override
  Future<String?> getCurrentLocale() async => (await _preferences).getString(preferenceKey);

  @override
  Future<void> setCurrentLocale(String locale) async {
    await (await _preferences).setString(preferenceKey, locale);
  }
}
