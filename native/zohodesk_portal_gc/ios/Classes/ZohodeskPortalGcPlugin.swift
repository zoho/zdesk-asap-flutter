import Flutter
import UIKit
import ZohoDeskPortalChatKit

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
          ZDPortalChatKit.showGC()
      
      //To show Answer Bot chat
      case .showAnswerBot:
          ZDPortalChatKit.showAnswerBot()
      
      //To show Business messaging
      case .showBM:
          ZDPortalChatKit.showBM()
      
      //To set GC session variable
      case .setGCSessionVariable:
          guard let arguments = call.arguments as? [[String: Any]] else { return }
          ZDPortalChatKit.setGCSessionVariable(sessionVariables: arguments)
      
      //To update GC session variable
      case .updateGCSessionVariable:
          guard let arguments = call.arguments as? [[String: Any]] else { return }
          ZDPortalChatKit.updateGCSessionVariable(sessionVariables: arguments)
      
      //To set BM session variable
      case .setBMSessionVariable:
          guard let arguments = call.arguments as? [[String: Any]] else { return }
          ZDPortalChatKit.setBMSessionVariable(sessionVariables: arguments)
      
      //To update GC session variable
      case .updateBMSessionVariable:
          guard let arguments = call.arguments as? [[String: Any]] else { return }
          ZDPortalChatKit.updateBMSessionVariable(sessionVariables: arguments)
      
      default:
          break
      }
  }
    
    private enum ZDPGCAPIs: String {
        case showGC, showAnswerBot, showBM
        case setGCSessionVariable, updateGCSessionVariable
        case setBMSessionVariable, updateBMSessionVariable
    }
}
