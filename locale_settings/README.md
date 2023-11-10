# locale_settings

[![pub package](https://img.shields.io/pub/v/locale_settings.svg)](https://pub.dev/packages/locale_settings)

---

A plugin which supports to change the current language on an os level.

## Getting Started

Import the package:

```dart
import 'package:locale_settings/locale_settings.dart';
```

## Usage

Create a variable for the plugin:

```dart
final localeSettingsPlugin = const LocaleSettings();
```

Set the current locale:

```dart
await localeSettingsPlugin.setCurrentLocale(...);
```

Get the current locale:

```dart
final locale = await localeSettingsPlugin.getCurrentLocale();
```

Listen for changes regarding the current locale:

```dart
LocaleListener(
  builder: (final context, final locale) {
    ...
  },
)
```

## Supported systems

Supports Android, iOS and macOS out of the box.
To also support Windows, Linux and Web use either
[locale_settings_hive](https://pub.dev/packages/locale_settings_hive) or
[locale_settings_preferences](https://pub.dev/packages/locale_settings_preferences)
