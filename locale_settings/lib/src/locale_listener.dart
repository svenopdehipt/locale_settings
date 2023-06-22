import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locale_settings/locale_settings_platform_interface.dart';

class LocaleListener extends StatefulWidget {
  const LocaleListener({required this.builder, super.key});

  final Widget Function(BuildContext context, Locale? locale) builder;

  @override
  State<LocaleListener> createState() => _LocaleListenerState();
}

class _LocaleListenerState extends State<LocaleListener> {
  late final StreamController<Locale> controller;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.stream,
      builder: (final context, final snapshot) {
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data);
        }
        return widget.builder(context, null);
      },
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  Future<void> _initController() async {
    controller = StreamController<Locale>();
    final locale = await LocaleSettingsPlatform.instance.getCurrentLocale();
    if (locale != null) {
      controller.add(locale);
    }
    LocaleSettingsPlatform.instance.localeListener = (locale) {
      controller.add(locale);
    };
  }
}
