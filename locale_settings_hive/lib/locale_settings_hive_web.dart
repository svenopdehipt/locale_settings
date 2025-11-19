import 'package:flutter/cupertino.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:locale_settings_hive/locale_settings_hive.dart';

@immutable
final class LocaleSettingsHiveWeb {
  static void registerWith(Registrar registrar) {
      LocaleSettingsPlatform.instance = LocaleSettingsHive();
  }
}
