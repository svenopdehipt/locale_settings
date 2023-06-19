import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'locale_settings_platform_interface.dart';

@immutable
final class MethodChannelLocaleSettings extends LocaleSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('locale_settings');

  @override
  Future<String?> getCurrentLocale() async => methodChannel.invokeMethod('getCurrentLocale');
  
  @override
  Future<void> setCurrentLocale(String locale) async {
    await methodChannel.invokeMethod("setCurrentLocale", {'locale': locale});
  }
}
