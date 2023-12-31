// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:locale_settings/locale_settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getCurrentLocale test', (WidgetTester tester) async {
    const LocaleSettings plugin = LocaleSettings();
    final Locale? version = await plugin.getCurrentLocale();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    await expectLater(version?.toLanguageTag().isNotEmpty, true);
  });
}
