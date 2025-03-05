import Flutter
import UIKit
import ZohoDeskPortalSalesIQ
import ZohoDeskPortalConfiguration

public class ZohodeskPortalSiqPlugin: NSObject, FlutterPlugin {
    
    private var eventSink: FlutterEventSink?
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_siq", binaryMessenger: registrar.messenger())
      let eventChannel = FlutterEventChannel(name: "zohodesk_portal_siq_event", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalSiqPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch ZDPChatAPIs(rawValue: call.method) {
        case .show:
            ZDPortalSalesIQ.show()
            
        case .showOfflineMessage:
            guard let isShow = call.arguments as? Bool else { return }
            ZDPortalSalesIQ.showOfflineMessage(isShow)
            
        case .setGuestUserDetails:
            guard let arguments = call.arguments as? [String: Any] else { return }
            setGuestUserDetails(arguments)
            
        case .setChatBrandDetails:
            guard let arguments = call.arguments as? [String: Any] else { return }
            
        case .setChatVisibility:
            guard let arguments = call.arguments as? [String: Any] else { return }
            setChatVisibility(arguments)
            
        case .hideQueueTime:
            guard let arguement = call.arguments else { return }
            hideQueueTime(arguement)
            
        case .showFeedbackAfterSkip:
            guard let arguement = call.arguments else { return }
            showFeedbackAfterSkip(arguement)
            
        case .enableDragToDismiss:
            guard let arguement = call.arguments else { return }
            enableDragToDismiss(arguement)
            
        case .setKnowledgeBaseVisibility:
            guard let arguement = call.arguments else { return }
            setKnowledgeBaseVisibility(arguement)
            
        case .setLoggerEnabled:
            guard let arguement = call.arguments else { return }
            setLoggerEnabled(arguement)
            
        case .setConversationVisibility:
            guard let arguement = call.arguments else { return }
            setConversationVisibility(arguement)
            
        case .setConversationTitle:
            guard let arguement = call.arguments else { return }
            setConversationTitle(arguement)
            
        case .setLauncherVisibility:
            guard let arguement = call.arguments else { return }
            setLauncherVisibility(arguement)
            
        default:
            break
        }
    }
    
    private func setSalesIQInitCallback() {
        ZDPortalSalesIQ.setCallbackOnInit { [weak self] in
            guard let self else { return }
            eventSink?(true)
        } onError: { [weak self] in
            guard let self else { return }
            eventSink?(false)
        }
    }
    
    private func setGuestUserDetails(_ arguments: [String: Any]) {
        
        guard let emailID = arguments["email"] as? String,
                let displayName = arguments["name"] as? String,
                let phoneNumer = arguments["phone"] as? String
        else { return }
        
        ZDPortalSalesIQ.setGuestUser(email: emailID, displayName: displayName, phoneNumber: phoneNumer)
    }
    
    private func setChatBrandDetails(_ arguments: [String: Any]) {
        
        guard let appKey = arguments["appKey"] as? String,
              let accessKey = arguments["accessKey"] as? String
        else { return }
        
        ZDPortalConfiguration.setChatBrandDetails(appKey: appKey, accessKey: accessKey)
    }
    
    private func setChatVisibility(_ arguments: [String: Any]) {
        
        guard let componentValue = arguments["component"] as? Int,
              let component = ZDPSalesIQComponents.ChatComponent(rawValue: componentValue),
                let visibility = arguments["visibility"] as? Bool
        else { return }
        
        ZDPortalSalesIQ.setChatVisibility(component, visible: visibility)

    }

    private func hideQueueTime(_ arguement: Any) {
        guard let isHide = arguement as? Bool else { return }
        ZDPortalSalesIQ.hideQueueTime(isHide)
    }
    
    private func showFeedbackAfterSkip(_ arguement: Any) {
        guard let isShow = arguement as? Bool else { return }
        ZDPortalSalesIQ.showFeedbackAfterSkip(isShow)
    }
    
    private func enableDragToDismiss(_ arguement: Any) {
        guard let isEnable = arguement as? Bool else { return }
        ZDPortalSalesIQ.enableDragToDismiss(isEnable)
    }
    
    private func setKnowledgeBaseVisibility(_ arguement: Any) {
        guard let isShow = arguement as? Bool else { return }
        ZDPortalSalesIQ.setKnowledgeBaseVisibility(isShow)
    }
    
    private func setLoggerEnabled(_ arguement: Any) {
        guard let isEnable = arguement as? Bool else { return }
        ZDPortalSalesIQ.setLoggerEnabled(isEnable)
    }
    
    private func setConversationVisibility(_ arguement: Any) {
        guard let isShow = arguement as? Bool else { return }
        ZDPortalSalesIQ.setConversationVisibility(isShow)
    }
    
    private func setConversationTitle(_ arguement: Any) {
        guard let title = arguement as? String else { return }
        ZDPortalSalesIQ.setConversationTitle(title)
    }
    
    private func setLauncherVisibility(_ arguement: Any) {
        guard let visibilityName = arguement as? String else { return }
        guard let visibilityMode: ZDPSalesIQComponents.VisibilityMode = {
            switch visibilityName {
            case "ALWAYS_VISIBLE":
                return .always
            case "NEVER_VISIBLE":
                return .never
            case "VISIBLE_WHEN_ACTIVE_CHAT":
                return .whenActiveChat
            default:
                return nil
            }
        }() else { return }
            
        
        ZDPortalSalesIQ.showLauncher(visibilityMode)
    }
    
    private enum ZDPChatAPIs: String {
        case show, showOfflineMessage
        case setSalesIQInitCallback, setGuestUserDetails, setChatBrandDetails
        case setChatVisibility, hideQueueTime, showFeedbackAfterSkip, enableDragToDismiss, setKnowledgeBaseVisibility, setLoggerEnabled, setConversationVisibility
        case setConversationTitle, setLauncherVisibility
    }
}

extension ZohodeskPortalSiqPlugin: FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}
