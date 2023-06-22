import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locale_settings/src/locale_settings_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelLocaleSettings platform = MethodChannelLocaleSettings();
  const MethodChannel channel = MethodChannel('locale_settings');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return switch (methodCall.method) {
          'getCurrentLocale' => 'en-US',
          _ => ''
        };
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getCurrentLocale', () async {
    expect(await platform.getCurrentLocale(), 'en-US');
  });
}
