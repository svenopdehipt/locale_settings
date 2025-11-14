import 'package:flutter/material.dart';

import 'package:locale_settings/locale_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _localeSettingsPlugin = const LocaleSettings();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return LocaleListener(
      builder: (final _, final locale) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Locale: $locale'),
                  TextField(controller: controller),
                  TextButton(
                    onPressed: () async {
                      final parts = controller.text.split('-');
                      _localeSettingsPlugin.setCurrentLocale(Locale(parts[0], parts[1]));
                    },
                    child: const Text('Change Language'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
