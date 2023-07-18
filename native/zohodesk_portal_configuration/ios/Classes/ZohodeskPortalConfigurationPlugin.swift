import Flutter
import UIKit
import ZohoDeskPortalConfiguration

public class ZohodeskPortalConfigurationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_configuration", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalConfigurationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//    result("iOS " + UIDevice.current.systemVersion)
      
      let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
      
      switch ZDPConfigurationAPIs(rawValue: call.method) {
          
          ///To set app theme either Dark or Light
      case .setTheme:
          setTheme(arguments: arguments)
      default:
          break
      }
      
  }
    
    //Extract them param from the arguments and set the theme
    private func setTheme(arguments: [String: Any]?) {
        guard let themeCode = arguments?["theme"] as? Int, let theme = ZDPThemeType(rawValue: themeCode)  else { return }
        ZDPThemeManager.setTheme(type:theme)
    }
    
    private enum ZDPConfigurationAPIs: String {
        case setTheme
    }
}
