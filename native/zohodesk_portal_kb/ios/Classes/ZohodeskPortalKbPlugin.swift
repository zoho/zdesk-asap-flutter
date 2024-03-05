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
      let arguments: [String:Any]? = call.arguments as? Dictionary<String, Any>
      switch ZDPortalKBCall(rawValue: call.method) {
      case .show:
          ZDPortalKB.show()
      case .showCategoryWithPermalink:
          showCategoryWithPermalink(arguments: arguments)
      case .showArticleWithPermalink:
          showArticleWithPermalink(arguments: arguments)
      default:
          break
      }
  }
    
  private func showCategoryWithPermalink(arguments: [String:Any]?) {
      guard let permalink = arguments?["permalink"] as? String else { return }
      ZDPortalKB.showCategory(withPermalink: permalink)
  }
    
  private func showArticleWithPermalink(arguments: [String:Any]?) {
      guard let permalink = arguments?["permalink"] as? String else { return }
      ZDPortalKB.showArticle(withPermalink: permalink)
  }
    
    private enum ZDPortalKBCall: String {
        case show, showCategoryWithPermalink, showArticleWithPermalink
    }
}
