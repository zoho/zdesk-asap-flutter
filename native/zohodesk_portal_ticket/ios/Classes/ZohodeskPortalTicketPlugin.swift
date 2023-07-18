import Flutter
import UIKit
import ZohoDeskPortalTicket

public class ZohodeskPortalTicketPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_ticket", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalTicketPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch ZDPTicketAPIs(rawValue: call.method) {
      case .show:
          ZDPortalTicket.show()
      default:
          break
      }
  }
    
    private enum ZDPTicketAPIs: String {
        case show
    }
}
