import Flutter
import UIKit
import ZohoDeskPortalCore
import zohodesk_portal_apikit

public class ZohodeskPortalCorePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_core", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalCorePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
      
      let eventChannel = FlutterEventChannel(name: "zohodesk_portal_core_event", binaryMessenger: registrar.messenger())
      let streamHandler = HomeProviderStreamHandler()
      eventChannel.setStreamHandler(streamHandler)
      
      // Assign delegate where needed
      ZDPortalHome.shared.actionDelegate = streamHandler

  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch ZDPCoreAPIs(rawValue: call.method) {
        case .showHome:
            ZDPortalHome.show()
            
        case .setConfiguration:
            let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
            setConfiguration(arguments)
            
        default:
            break
        }
    }
    
    private func setConfiguration(_ arguments: [String: Any]?) {
        guard let configurationJSON = arguments?["configuration"] as? String else {
            return
        }
        
        guard let homeConfigurations: ZDFHomeConfiguration = configurationJSON.parser() else { return }
        let configuration = ZDPHomeConfiguration()
        
        configuration.enableCommunity = homeConfigurations.enableCommunity
        configuration.enableHelpCenter = homeConfigurations.enableHelpCenter
        configuration.enableMyTicket = homeConfigurations.enableMyTicket
        configuration.enableCreateTicket = homeConfigurations.enableCreateTicket
        configuration.enableAddTopic = homeConfigurations.enableAddTopic
        configuration.showChat = homeConfigurations.showChat
        configuration.showGC = homeConfigurations.showGC
        configuration.showAnswerBot = homeConfigurations.showAnswerBot
        configuration.showBM = homeConfigurations.showBM
        configuration.enableHeaderLogo = homeConfigurations.enableHeaderLogo
        
        ZDPortalHome.updateConfiguration(with: configuration)
    }
    
    private enum ZDPCoreAPIs: String {
        case showHome
        case setConfiguration
    }
}

private class ZDFHomeConfiguration: Decodable {
    var enableCommunity : Bool = true
    var enableHelpCenter : Bool = true
    var enableMyTicket : Bool = true
    var enableCreateTicket : Bool = true
    var enableAddTopic: Bool = true
    var showChat : Bool = true
    var showGC: Bool = true
    var showAnswerBot: Bool = true
    var showBM: Bool = true
    var enableHeaderLogo: Bool = true
}
