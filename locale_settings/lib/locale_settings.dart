
import 'locale_settings_platform_interface.dart';

class LocaleSettings {
  Future<String?> getCurrentLocale() async => LocaleSettingsPlatform.instance.getCurrentLocale();

  Future<void> setCurrentLocale(String locale) async {
    await LocaleSettingsPlatform.instance.setCurrentLocale(locale);
  }
}
