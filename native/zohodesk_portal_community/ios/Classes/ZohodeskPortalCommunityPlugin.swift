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
      case .disableTopicEdit:
          disableTopicEdit(arguments: arguments)
      case .disableTopicDelete:
          disableTopicDelete(arguments: arguments)
      case .disableReply:
          disableReply(arguments: arguments)
      case .disableReplyEdit:
          disableReplyEdit(arguments: arguments)
      case .disableReplyDelete:
          disableReplyDelete(arguments: arguments)
      case .disableTopicDetailSearch:
          disableTopicDetailSearch(arguments: arguments)
      case .disableTextReader:
          disableTextReader(arguments: arguments)
      case .disableKeySearcher:
          disableKeySearcher(arguments: arguments)
      case .disableTopicShare:
          disableTopicShare(arguments: arguments)
      case .disableTopicLike:
          disableTopicLike(arguments: arguments)
      case .disableTopicComment:
          disableTopicComment(arguments: arguments)
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

//  private func disableTopicEdit(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isTopicEditAllowed = !isDisable
//  }
//  private func disableTopicDelete(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isTopicDeleteAllowed = !isDisable
//  }
//  private func disableReply(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isReplyAllowed = !isDisable
//  }
//  private func disableReplyEdit(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isReplyEditAllowed = !isDisable
//  }
//  private func disableReplyDelete(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isReplyDeleteAllowed = !isDisable
//  }
//  private func disableTopicDetailSearch(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//        ZDPCommunityConfiguration.disableTopicDetailSearch = isDisable
//  }
//  private func disableTextReader(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.disableTextReader = isDisable
//  }
//  private func disableKeySearcher(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.disableKeySearcher = isDisable
//  }
//  private func disableTopicShare(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.isShareTopicAllowed = !isDisable
//  }
//  private func disableTopicLike(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.disableTopicLike = isDisable
//  }
//  private func disableTopicComment(arguments: [String:Any]?) {
//      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
//      ZDPCommunityConfiguration.disableTopicComment = isDisable
//  }

    private enum ZDPCommunityAPIs: String {
        case show, showTopicForm, showTopicWithPermaLink, showTopicWithId
        case disableTopicEdit, disableTopicDelete, disableReply,
             disableReplyEdit, disableReplyDelete, disableTopicDetailSearch,
             disableTextReader, disableKeySearcher, disableTopicShare,
             disableTopicLike, disableTopicComment
    }
}
