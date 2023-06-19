import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'locale_settings_method_channel.dart';

@immutable
abstract base class LocaleSettingsPlatform extends PlatformInterface {
  /// Constructs a LocaleSettingsPlatform.
  LocaleSettingsPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocaleSettingsPlatform _instance = MethodChannelLocaleSettings();

  /// The default instance of [LocaleSettingsPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocaleSettings].
  static LocaleSettingsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocaleSettingsPlatform] when
  /// they register themselves.
  static set instance(LocaleSettingsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getCurrentLocale();

  Future<void> setCurrentLocale(String locale);
}
