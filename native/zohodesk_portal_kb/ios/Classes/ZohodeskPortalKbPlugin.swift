import Flutter
import UIKit
import ZohoDeskPortalKB

public class ZohodeskPortalKbPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_kb", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalKbPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPortalKBCall(rawValue: call.method) {
      case .show:
          ZDPortalKB.show()
      default:
          break
      }
  }
    
    private enum ZDPortalKBCall: String {
        case show
    }
}
