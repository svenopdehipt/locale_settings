library locale_settings_hive;

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:locale_settings/locale_settings.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

final class LocaleSettingsHive extends LocaleSettingsPlatform {
  static void registerWith() {}

  static void initialize() {
    if (kIsWeb || Platform.isLinux || Platform.isWindows) {
      LocaleSettingsPlatform.instance = LocaleSettingsHive();
    }
  }

  void Function(Locale locale)? _localeListener;

  static Box? box;
  static var hiveKey = 'current';

  final _box = Hive.openBox('app_locale');

  @override
  Future<Locale?> getCurrentLocale() async {
    final String? locale = (box ?? await _box).get(hiveKey);
    if (locale != null) {
      return stringToLocale(locale);
    }
    return null;
  }

  @override
  Future<void> setCurrentLocale(Locale locale) async {
    await (box ?? await _box).put(hiveKey, locale.toLanguageTag());
    _localeListener?.call(locale);
  }

  @override
  set localeListener(void Function(Locale locale) localeListener) {
    _localeListener = localeListener;
  }
}
