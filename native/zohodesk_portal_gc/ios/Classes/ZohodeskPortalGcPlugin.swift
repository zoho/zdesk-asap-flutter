import Flutter
import UIKit
import ZohoDeskPortalLiveChat

public class ZohodeskPortalGcPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_gc", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalGcPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPGCAPIs(rawValue: call.method) {
      case .showGC:
          ZDPortalLiveChat.showGC()
      case .showKBBot:
          ZDPortalLiveChat.showKBBot()
      case .showBMChat:
          ZDPortalLiveChat.showBMChat()
      default:
          break
      }
  }
    
    private enum ZDPGCAPIs: String {
        case showGC, showKBBot, showBMChat
    }
}
