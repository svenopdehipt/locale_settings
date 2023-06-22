package com.opdehipt.locale_settings

import android.os.Build
import androidx.appcompat.app.AppCompatDelegate
import androidx.core.os.LocaleListCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** LocaleSettingsPlugin */
class LocaleSettingsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  companion object {
    var channel: MethodChannel? = null
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "locale_settings")
    channel?.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getCurrentLocale" -> {
        val locale = AppCompatDelegate.getApplicationLocales()[0]
        if (locale != null) {
          result.success(locale.toLanguageTag())
        }
        else {
          result.error(
                  "locale_not_found",
                  "The current locales where empty and no locale was found",
                  null,
          )
        }
      }
      "setCurrentLocale" -> {
        try {
          val locale = call.argument<String>("locale")

          if (locale != null) {
            AppCompatDelegate.setApplicationLocales(LocaleListCompat.forLanguageTags(locale))
            result.success(null)
          }
          else {
            result.error(
                    "locale_receive_error",
                    "The specified locale was null",
                    null,
            )
          }
        }
        catch (e: ClassCastException) {
          result.error(
                  "locale_receive_error",
                  "ClassCastException while receiving the locale",
                  "${e.message}\n${e.stackTraceToString()}",
          )
        }
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
  }
}
