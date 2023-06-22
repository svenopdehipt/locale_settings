library locale_settings_hive;

import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocaleSettingsPreferences extends LocaleSettingsPlatform {
  static void registerWith() {
    LocaleSettingsPlatform.instance = LocaleSettingsPreferences();
  }

  void Function(String locale)? _localeListener;

  static var preferenceKey = 'app_locale';

  final _preferences = SharedPreferences.getInstance();

  @override
  Future<String?> getCurrentLocale() async => (await _preferences).getString(preferenceKey);

  @override
  Future<void> setCurrentLocale(String locale) async {
    await (await _preferences).setString(preferenceKey, locale);
    _localeListener?.call(locale);
  }

  @override
  set localeListener(void Function(String locale) localeListener) {
    _localeListener = localeListener;
  }
}
