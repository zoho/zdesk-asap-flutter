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
      let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
      switch ZDPGCAPIs(rawValue: call.method) {
      //To show GC chat
      case .showGC:
          ZDPortalLiveChat.showGC()
      
      //To show Answer Bot chat
      case .showKBBot:
          ZDPortalLiveChat.showKBBot()
      
      //To show Business messaging
      case .showBMChat:
          ZDPortalLiveChat.showBMChat()
      
      //To set GC session variable
      case .setGCSessionVariable:
          setGCSessionVariable(arguments: arguments)
      
      //To update GC session variable
      case .updateGCSessionVariable:
          updateGCSessionVariable(arguments: arguments)
      
      //To set BM session variable
      case .setBMSessionVariable:
          setBMSessionVariable(arguments: arguments)
      
      //To update GC session variable
      case .updateBMSessionVariable:
          updateBMSessionVariable(arguments: arguments)
      
      default:
          break
      }
  }
    
    private func setGCSessionVariable(arguments: [String: Any]?) {
        guard let variableName = arguments?["variableName"] as? String,
              let updatedValue = arguments?["updatedValue"] as? String else { return }
        ZDPortalLiveChat.setGCSessionVariable(variableName: variableName, updatedValue: updatedValue)
    }
    
    private func updateGCSessionVariable(arguments: [String: Any]?) {
        guard let variableName = arguments?["variableName"] as? String,
              let updatedValue = arguments?["updatedValue"] as? String else { return }
        ZDPortalLiveChat.updateGCSessionVariable(variableName: variableName, updatedValue: updatedValue)
    }
    
    private func setBMSessionVariable(arguments: [String: Any]?) {
        guard let variableName = arguments?["variableName"] as? String,
              let updatedValue = arguments?["updatedValue"] as? String else { return }
        ZDPortalLiveChat.setBMSessionVariable(variableName: variableName, updatedValue: updatedValue)
    }
    
    private func updateBMSessionVariable(arguments: [String: Any]?) {
        guard let variableName = arguments?["variableName"] as? String,
              let updatedValue = arguments?["updatedValue"] as? String else { return }
        ZDPortalLiveChat.updateBMSessionVariable(variableName: variableName, updatedValue: updatedValue)
    }
    
    private enum ZDPGCAPIs: String {
        case showGC, showKBBot, showBMChat
        case setGCSessionVariable, updateGCSessionVariable
        case setBMSessionVariable, updateBMSessionVariable
    }
}
