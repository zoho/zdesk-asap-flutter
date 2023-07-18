import Flutter
import UIKit
import ZohoDeskPortalCommunity

public class ZohodeskPortalCommunityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_community", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalCommunityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPCommunityAPIs(rawValue: call.method) {
      case .show:
          ZDPortalCommunity.show(navigationMode: .push)
      case .showTopicForm:
          ZDPortalCommunity.showTopicForm()
      default:
          break
      }
  }
    
    private enum ZDPCommunityAPIs: String {
        case show, showTopicForm
    }
}
