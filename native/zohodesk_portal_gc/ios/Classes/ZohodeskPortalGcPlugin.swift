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
          setGCSessionVariable(arguments: call.arguments)
      
      //To update GC session variable
      case .updateGCSessionVariable:
          updateGCSessionVariable(arguments: call.arguments)
      
      //To set BM session variable
      case .setBMSessionVariable:
          setBMSessionVariable(arguments: call.arguments)
      
      //To update GC session variable
      case .updateBMSessionVariable:
          updateBMSessionVariable(arguments: call.arguments)
      
      default:
          break
      }
  }
    
    private func setGCSessionVariable(arguments: Any?) {
        guard let sessionVariables = arguments as? [[String: Any]] else { return }
        sessionVariables.forEach { sessionVariable in
            prepareSessionVariable(variable: sessionVariable) { name, value in
                ZDPortalLiveChat.setGCSessionVariable(variableName: name, updatedValue: value)
            }
        }
    }
    
    private func updateGCSessionVariable(arguments: Any?) {
        guard let sessionVariables = arguments as? [[String: Any]] else { return }
        sessionVariables.forEach { sessionVariable in
            prepareSessionVariable(variable: sessionVariable) { name, value in
                ZDPortalLiveChat.updateGCSessionVariable(variableName: name, updatedValue: value)
            }
        }
    }
    
    private func setBMSessionVariable(arguments: Any?) {
        guard let sessionVariables = arguments as? [[String: Any]] else { return }
        sessionVariables.forEach { sessionVariable in
            prepareSessionVariable(variable: sessionVariable) { name, value in
                ZDPortalLiveChat.setBMSessionVariable(variableName: name, updatedValue: value)
            }
        }
    }
    
    private func updateBMSessionVariable(arguments: Any?) {
        guard let sessionVariables = arguments as? [[String: Any]] else { return }
        sessionVariables.forEach { sessionVariable in
            prepareSessionVariable(variable: sessionVariable) { name, value in
                ZDPortalLiveChat.updateBMSessionVariable(variableName: name, updatedValue: value)
            }
        }
    }
    
    //Temporarily processing the session variable signature, will be handled directly by GC SDK
    private func prepareSessionVariable(variable: [String: Any], _ handler: (String, String) -> Void) {
        var name: String = ""
        var value: String = ""
        variable.forEach { (key, note) in
            guard let stringNote = note as? String else { return }
            switch key {
            case "name":
                name = stringNote
            case "value":
                value = stringNote
            default:
                break
            }
        }
        handler(name, value)
    }
    
    private enum ZDPGCAPIs: String {
        case showGC, showKBBot, showBMChat
        case setGCSessionVariable, updateGCSessionVariable
        case setBMSessionVariable, updateBMSessionVariable
    }
}
