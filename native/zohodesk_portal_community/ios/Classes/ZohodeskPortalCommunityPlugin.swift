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
      let arguments: [String:Any]? = call.arguments as? Dictionary<String, Any>
      switch ZDPCommunityAPIs(rawValue: call.method) {
      case .show:
          ZDPortalCommunity.show(navigationMode: .push)
      case .showTopicForm:
          ZDPortalCommunity.showTopicForm()
      case .showTopicWithPermaLink:
          showTopicWithPermalink(arguments: arguments)
      case .showTopicWithId:
          showTopicWithId(arguments: arguments)
      default:
          break
      }
  }

  private func showTopicWithPermalink(arguments: [String:Any]?) {
      guard let permalink = arguments?["permalink"] as? String else { return }
      ZDPortalCommunity.showTopic(withPermaLink: permalink)
  }

  private func showTopicWithId(arguments: [String:Any]?) {
       guard let topicID = arguments?["topicId"] as? String else { return }
       ZDPortalCommunity.showTopic(withID: topicID)
  }
    
    private enum ZDPCommunityAPIs: String {
        case show, showTopicForm, showTopicWithPermaLink, showTopicWithId
    }
}
