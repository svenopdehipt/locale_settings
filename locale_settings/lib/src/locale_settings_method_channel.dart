import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

@immutable
final class MethodChannelLocaleSettings extends LocaleSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('locale_settings');

  @override
  Future<String?> getCurrentLocale() async => methodChannel.invokeMethod('getCurrentLocale');
  
  @override
  Future<void> setCurrentLocale(String locale) async {
    await methodChannel.invokeMethod('setCurrentLocale', {'locale': locale});
  }

  @override
  set localeListener(void Function(String locale) localeListener) {
    methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'localeUpdated':
          if (call.arguments is Map) {
            final locale = (call.arguments as Map)['locale'];

            if (locale is String) {
              localeListener(locale);
            }
          }
      }
    });
  }
}
