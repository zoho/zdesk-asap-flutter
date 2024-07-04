import Flutter
import UIKit
import ZohoDeskPortalTicket
import zohodesk_portal_apikit

public class ZohodeskPortalTicketPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_ticket", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalTicketPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let arguments: [String: Any]? = call.arguments as? [String: Any]
      switch ZDPTicketAPIs(rawValue: call.method) {
      case .show:
        ZDPortalTicket.show()
      case .setConfiguration:
        handleTicketConfigurations(arguments: arguments)
      default:
          break
      }
  }

  private func handleTicketConfigurations(arguments: [String: Any]?) {
      guard let configurationJSON = arguments?["configuration"] as? String else {
         return
      }
      if let ticketConfigurations: ZDFTicketConfiguration = configurationJSON.parser() {
          ZDPTicketConfiguration.configure.isReplyAllowed = ticketConfigurations.isReplyAllowed
          ZDPTicketConfiguration.configure.isCommentAllowed = ticketConfigurations.isCommentAllowed
          ZDPTicketConfiguration.configure.isTicketUpdateAllowed = ticketConfigurations.isTicketUpdateAllowed
          ZDPTicketConfiguration.configure.isCommentEditAllowed = ticketConfigurations.isCommentEditAllowed
          ZDPTicketConfiguration.configure.isCommentDeleteAllowed = ticketConfigurations.isCommentDeleteAllowed
          ZDPTicketConfiguration.configure.isAddTicketAllowed = ticketConfigurations.isAddTicketAllowed
          ZDPTicketConfiguration.configure.isCustomerHappinessThreadAllowed = ticketConfigurations.isHappinessThreadAllowed
          ZDPTicketConfiguration.configure.isTicketChannelAllowed = ticketConfigurations.isTicketChannelAllowed
          ZDPTicketConfiguration.configure.isTicketPropertiesAllowed = ticketConfigurations.isTicketPropertiesAllowed
          ZDPTicketConfiguration.configure.disableTicketDetailSearch = !ticketConfigurations.isTicketDetailSearchAllowed
      }
  } 
    
    private enum ZDPTicketAPIs: String {
        case show
        case setConfiguration
    }
}

private class ZDFTicketConfiguration: Decodable {
     var isReplyAllowed: Bool = true;
     var isCommentAllowed: Bool = true;
     var isTicketUpdateAllowed: Bool = true;
     var isCommentEditAllowed: Bool = true;
     var isCommentDeleteAllowed: Bool = true;
     var isAddTicketAllowed: Bool = true;
     var isHappinessThreadAllowed: Bool = true;
     var isTicketChannelAllowed = true
     var isTicketPropertiesAllowed = true
     var isTicketDetailSearchAllowed: Bool = true
}
