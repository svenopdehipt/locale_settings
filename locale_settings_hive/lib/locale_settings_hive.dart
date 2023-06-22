library locale_settings_hive;

import 'package:hive/hive.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

final class LocaleSettingsHive extends LocaleSettingsPlatform {
  static void registerWith() {
    LocaleSettingsPlatform.instance = LocaleSettingsHive();
  }

  void Function(String locale)? _localeListener;

  static Box? box;
  static var hiveKey = 'current';

  final _box = Hive.openBox('app_locale');

  @override
  Future<String?> getCurrentLocale() async => (box ?? await _box).get(hiveKey);

  @override
  Future<void> setCurrentLocale(String locale) async {
    await (box ?? await _box).put(hiveKey, locale);
    _localeListener?.call(locale);
  }

  @override
  set localeListener(void Function(String locale) localeListener) {
    _localeListener = localeListener;
  }
}
