import 'package:locale_settings/locale_settings_platform_interface.dart';
export 'package:locale_settings/src/locale_listener.dart';

class LocaleSettings {
  const LocaleSettings();

  Future<String?> getCurrentLocale() async => LocaleSettingsPlatform.instance.getCurrentLocale();

  Future<void> setCurrentLocale(String locale) async {
    await LocaleSettingsPlatform.instance.setCurrentLocale(locale);
  }
}
