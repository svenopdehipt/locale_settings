import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:locale_settings_preferences/locale_settings_preferences.dart';

final class LocaleSettingsHive {
  static void registerWith(Registrar registrar) {
    LocaleSettingsPlatform.instance = LocaleSettingsPreferences();
  }
}