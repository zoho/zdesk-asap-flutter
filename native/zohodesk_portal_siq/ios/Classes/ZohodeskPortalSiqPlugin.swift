import Flutter
import UIKit
import ZohoDeskPortalSalesIQ

public class ZohodeskPortalSiqPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_siq", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalSiqPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPChatAPIs(rawValue: call.method) {
      case .show:
        ZDPortalSalesIQ.show()
    default:
        break
    }
  }
    
    private enum ZDPChatAPIs: String {
        case show
    }
}
