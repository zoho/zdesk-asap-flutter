import Flutter
import UIKit
import ZohoDeskPortalSalesIQ

public class ZohodeskPortalServicesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_services", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalServicesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
  }
}
