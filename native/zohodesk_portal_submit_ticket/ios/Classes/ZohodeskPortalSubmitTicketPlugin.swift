import Flutter
import UIKit
import ZohoDeskPortalTicket

public class ZohodeskPortalSubmitTicketPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "zohodesk_portal_submit_ticket", binaryMessenger: registrar.messenger())
        let instance = ZohodeskPortalSubmitTicketPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch ZDPSubmitTicketAPIs(rawValue: call.method) {
        case .show:
            ZDPortalSubmitTicket.show()
        default:
            break
        }
    }

    private enum ZDPSubmitTicketAPIs: String {
        case show
    }
}
