import Flutter
import UIKit
import ZohoDeskPortalSalesIQ

public class ZohodeskPortalChatPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_chat", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalChatPlugin()
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
