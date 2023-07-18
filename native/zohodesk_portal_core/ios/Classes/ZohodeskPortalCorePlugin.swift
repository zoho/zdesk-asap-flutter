import Flutter
import UIKit
import ZohoDeskPortalCore

public class ZohodeskPortalCorePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_core", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalCorePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPCoreAPIs(rawValue: call.method) {
      case .showHome:
         ZDPortalHome.show()
          break
      default:
          break
      }
  }
    
    private enum ZDPCoreAPIs: String {
        case showHome
    }
}
