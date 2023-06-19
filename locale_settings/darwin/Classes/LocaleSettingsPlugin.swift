#if os(iOS)
import Flutter
import UIKit
#else
import FlutterMacOS
import Cocoa
#endif

public class LocaleSettingsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    #if os(iOS)
    let messenger = registrar.messenger()
    #else
    let messenger = registrar.messenger
    #endif
    let channel = FlutterMethodChannel(name: "locale_settings", binaryMessenger: messenger)
    let instance = LocaleSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getCurrentLocale":
      guard let locales = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] else {
        result(FlutterError(code: "locale_not_found", message: "The locales couldn't be accessed", details: nil))
        return
      }
      guard let locale = locales.first else {
          result(FlutterError(code: "locale_not_found", message: "The current locales where empty and no locale was found", details: nil))
          return
      }

      result(locale)
    case "setCurrentLocale":
        guard let args = call.arguments as? [String: String] else {
          result(FlutterError(code: "locale_receive_error", message: "The arguments couldn't be parsed", details: nil))
          return
        }
        guard let locale = args["locale"] else {
          result(FlutterError(code: "locale_receive_error", message: "The specified locale was null", details: nil))
          return
        }
        UserDefaults.standard.setValue([locale], forKey: "AppleLanguages")
        result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
