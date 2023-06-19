import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:locale_settings/locale_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformLocale = 'Unknown';
  final _localeSettingsPlugin = LocaleSettings();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformLocale;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformLocale =
          await _localeSettingsPlugin.getCurrentLocale() ?? 'Unknown platform locale';
    } on PlatformException {
      platformLocale = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformLocale = platformLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Locale: $_platformLocale'),
              TextField(controller: controller),
              TextButton(
                onPressed: () async {
                  _localeSettingsPlugin.setCurrentLocale(controller.text);
                },
                child: const Text('Change Language'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
