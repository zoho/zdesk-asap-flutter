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
      case .disableArticleDetailSearch:
          disableArticleDetailSearch(arguments: arguments)
      case .disableArticleLike:
          disableArticleLike(arguments: arguments)
      case .disableArticleDislike:
          disableArticleDislike(arguments: arguments)
      case .disableTextReader:
          disableTextReader(arguments: arguments)
      case .isShareArticleAllowed:
          isShareArticleAllowed(arguments: arguments)
      case .disableKeySearcher:
          disableKeySearcher(arguments: arguments)
      case .relatedArticlePreference:
          relatedArticlePreference(arguments: arguments)
      case .searchPreference:
          searchPreference(arguments: arguments)
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
    
  private func disableArticleDetailSearch(arguments: [String:Any]?) {
      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
      ZDPortalKBConfiguration.disableArticleDetailSearch = isDisable
  }

  private func disableArticleLike(arguments: [String:Any]?) {
      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
      ZDPortalKBConfiguration.disableArticleLike = isDisable
  }

  private func disableArticleDislike(arguments: [String:Any]?) {
      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
      ZDPortalKBConfiguration.disableArticleDislike = isDisable
  }

  private func disableTextReader(arguments: [String:Any]?) {
      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
      ZDPortalKBConfiguration.disableTextReader = isDisable
  }

  private func isShareArticleAllowed(arguments: [String:Any]?) {
      guard let isAllowed = arguments?["isAllowed"] as? Bool else { return }
      ZDPortalKBConfiguration.isShareArticleAllowed = isAllowed
  }
  private func disableKeySearcher(arguments: [String:Any]?) {
      guard let isDisable = arguments?["isDisable"] as? Bool else { return }
      ZDPortalKBConfiguration.disableKeySearcher = isDisable
  }

  private func relatedArticlePreference(arguments: [String:Any]?) {
      guard let preference = arguments?["preference"] as? String else { return }
      
      switch preference {
          
      case "hidden":
          ZDPortalKBConfiguration.relatedArticlePreference = .hidden

      case "category":
          ZDPortalKBConfiguration.relatedArticlePreference = .category

      case "section":
          ZDPortalKBConfiguration.relatedArticlePreference = .section
          
      default:
          break
      }
  }

  private func searchPreference(arguments: [String:Any]?) {
      guard let preference = arguments?["preference"] as? String else { return }
      
      switch preference {
      case "global":
          ZDPortalKBConfiguration.searchPreference = .global

      case "category":
          ZDPortalKBConfiguration.searchPreference = .category

      case "section":
          ZDPortalKBConfiguration.searchPreference = .section
          
      default:
          break
      }
  }

    private enum ZDPortalKBCall: String {
        case show, showCategoryWithPermalink, showArticleWithPermalink
        case disableArticleDetailSearch, disableArticleLike, disableArticleDislike, disableTextReader, isShareArticleAllowed, disableKeySearcher
        case relatedArticlePreference, searchPreference
    }
}
