import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:locale_settings/locale_settings.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

@immutable
final class MethodChannelLocaleSettings extends LocaleSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('locale_settings');

  @override
  Future<Locale?> getCurrentLocale() async {
    try {
      final locale = await methodChannel.invokeMethod('getCurrentLocale');
      if (locale != null) {
        return stringToLocale(locale);
      }
      return null;
    }
    catch (e) {
      // TODO(sven): handle
      return null;
    }
  }
  
  @override
  Future<void> setCurrentLocale(Locale locale) async {
    await methodChannel.invokeMethod('setCurrentLocale', {'locale': locale.toLanguageTag()});
  }

  @override
  set localeListener(void Function(Locale locale) localeListener) {
    methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'localeUpdated':
          if (call.arguments is Map) {
            final locale = (call.arguments as Map)['locale'];

            if (locale is String) {
              localeListener(stringToLocale(locale));
            }
          }
      }
    });
  }
}
