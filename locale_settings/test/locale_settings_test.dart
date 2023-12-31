import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locale_settings/locale_settings.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';
import 'package:locale_settings/src/locale_settings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

@immutable
final class MockLocaleSettingsPlatform
    extends LocaleSettingsPlatform
    with MockPlatformInterfaceMixin {

  @override
  Future<Locale?> getCurrentLocale() => Future.value(const Locale('en', 'US'));

  @override
  Future<void> setCurrentLocale(Locale locale) async {
  }

  @override
  set localeListener(void Function(Locale locale) localeListener) {
  }
}

void main() {
  final LocaleSettingsPlatform initialPlatform = LocaleSettingsPlatform.instance;

  test('$MethodChannelLocaleSettings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocaleSettings>());
  });

  test('getCurrentLocale', () async {
    LocaleSettings localeSettingsPlugin = const LocaleSettings();
    MockLocaleSettingsPlatform fakePlatform = MockLocaleSettingsPlatform();
    LocaleSettingsPlatform.instance = fakePlatform;

    expect(await localeSettingsPlugin.getCurrentLocale(), 'en-US');
  });
}
