import Flutter
import UIKit
import ZohoDeskPortalConfiguration
import zohodesk_portal_apikit

public class ZohodeskPortalConfigurationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_configuration", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalConfigurationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//    result("iOS " + UIDevice.current.systemVersion)
      
      let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
      
      switch ZDPConfigurationAPIs(rawValue: call.method) {
          
          ///To set app theme either Dark or Light
      case .setTheme:
          setTheme(arguments: arguments)
      case .setConfiguration:
          handlePortalConfigurations(arguments: arguments)
      case .setLanguage:
          setLanguage(arguments: arguments)
      default:
          break
      }
      
  }
    
    //Extract them param from the arguments and set the theme
    private func setTheme(arguments: [String: Any]?) {
        guard let themeCode = arguments?["theme"] as? Int, let theme = ZDPThemeType(rawValue: themeCode)  else { return }
        ZDPThemeManager.setTheme(type:theme)
    }

    private func handlePortalConfigurations(arguments: [String: Any]?) {
        guard let configurationJSON = arguments?["configuration"] as? String else {
          return
        }
        
        if let portalConfigurations: ZDFPortalConfiguration = configurationJSON.parser() {
            let zdpconfigurations = ZDPConfiguration()
            zdpconfigurations.disableSidemenu = !portalConfigurations.isSideMenuEnabled
            zdpconfigurations.disableLanguageChooser = !portalConfigurations.isLangChooserEnabled
            zdpconfigurations.disablePoweredByZoho = !portalConfigurations.isPoweredByFooterEnabled
            zdpconfigurations.disableGlobalSearch = !portalConfigurations.isGlobalSearchEnabled
            zdpconfigurations.disableKB = !portalConfigurations.isKBEnabled
            zdpconfigurations.disableCommunity = !portalConfigurations.isCommunityEnabled
            zdpconfigurations.disableSubmitTicket = !portalConfigurations.isSubmitTicketEnabled
            zdpconfigurations.disableAddTopic = !portalConfigurations.isAddTopicEnabled
            zdpconfigurations.disableMyTicket = !portalConfigurations.isMyTicketsEnabled
            zdpconfigurations.disableChat = !portalConfigurations.isSiqEnabled
            zdpconfigurations.disableGC = !portalConfigurations.isGCEnabled
            zdpconfigurations.disableAnswerBot = !portalConfigurations.isAnswerBotEnabled
            zdpconfigurations.disableBM = !portalConfigurations.isBMEnabled
            zdpconfigurations.enableModuleBasedSearch = portalConfigurations.isModuleBasedSearchEnabled
            ZDPortalConfiguration.set(configuration: zdpconfigurations)
            
            let zdpsecureconfigurations = ZDPSecureContentConfiguration()
            zdpsecureconfigurations.disableDownloadAttachment = !portalConfigurations.isAttachmentUploadEnabled
            zdpsecureconfigurations.disableUploadAttachment = !portalConfigurations.isAttachmentUploadEnabled
            zdpsecureconfigurations.disableScreenShot = portalConfigurations.disableScreenShot
            zdpsecureconfigurations.disableCopyPaste = portalConfigurations.disableCutCopy
            ZDPortalConfiguration.setZDPSecureConfiguration(configuration: zdpsecureconfigurations)
        }
    }
    
    private enum ZDPConfigurationAPIs: String {
        case setTheme
        case setConfiguration
        case setLanguage
    }

    private func setLanguage(arguments: [String: Any]?) {
        guard let language = arguments?["language"] as? String else { return }
        ZDPortalConfiguration.setSDKLanguage(language)
    }

}

private class ZDFPortalConfiguration: Decodable {
  var isSideMenuEnabled = true; 
  var isLangChooserEnabled = true; 
  var isPoweredByFooterEnabled = true; 
  var isGlobalSearchEnabled = true; 
  var isKBEnabled = true; 
  var isCommunityEnabled = true; 
  var isSubmitTicketEnabled = true; 
  var isAddTopicEnabled = true; 
  var isMyTicketsEnabled = true; 
  var isSiqEnabled = true;
  var isGCEnabled = true;
  var isAnswerBotEnabled = true;
  var isBMEnabled = true;
  var isAttachmentDownloadEnabled = true;
  var isAttachmentUploadEnabled = true; 
  var isModuleBasedSearchEnabled = false; 
  var disableScreenShot = false; 
  var disableCutCopy = false;
}
