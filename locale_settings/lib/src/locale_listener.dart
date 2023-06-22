import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

class LocaleListener extends StatelessWidget {
  const LocaleListener({required this.builder, super.key});

  final Widget Function(BuildContext context, Locale? locale) builder;

  @override
  Widget build(BuildContext context) {
    final controller = StreamController<String>();
    LocaleSettingsPlatform.instance.getCurrentLocale().then((final locale) async {
      if (locale != null) {
        controller.add(locale);
      }
      LocaleSettingsPlatform.instance.localeListener = (locale) {
        controller.add(locale);
      };
    });
    return StreamBuilder(
      stream: controller.stream,
      builder: (final context, final snapshot) {
        print("t2: ${snapshot.data}");
        if (snapshot.hasData) {
          final [language, country] = snapshot.data!.replaceAll('_', '-').split('-');
          return builder(context, Locale(language, country));
        }
        return builder(context, null);
      },
    );
  }
}
