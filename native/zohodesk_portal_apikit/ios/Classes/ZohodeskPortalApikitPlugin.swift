import Flutter
import UIKit
import ZohoDeskPortalAPIKit

public class ZohodeskPortalApikitPlugin: NSObject, FlutterPlugin {
    
    @Defaults(key: "ZDPAPNSDeviceID") public static var deviceIDForZDPortal: String? = nil
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_apikit", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalApikitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    //------------------------------------------
    //MARK: - ASAP SDK APIKit APIs action
    //------------------------------------------
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
      switch ZDPKitAPIs(rawValue: call.method) {
          
          ///To Initialize ASAP SDK
      case .initializeSDK:
          initializeSDK(arguments: arguments)
          
          ///To login with JWT Token
      case .login:
          login(arguments: arguments, onCompletion: result)
          
          ///To logout off ASAP
      case .logout:
          ZohoDeskPortalKit.logout(onCompletion: result)
          
          ///To enable push notification
      case .enablePush:
          enablePush()
          
          ///To disable push notification
      case .disablePush:
          disablePush()
          
          ///To Enable ASAP Logs
      case .enableLogs:
          ZohoDeskPortalKit.enableLogs()
          
          ///To initialize IAM accounts keys
      case .initAccountsKeys:
          initAccountsKeys(arguments: arguments)
          
          ///To present the IAM login screen
      case .presentLoginScreen:
          presentLoginScreen(onCompletion: result)
          
      default:
          break
      }
  }
    
    //Extract the required parameter from arguments and initialize the ASAP SDK
    private func initializeSDK(arguments: [String: Any]?) {
        guard let orgID = arguments?["orgID"] as? String,
              let appID = arguments?["appID"] as? String,
              let dataCenter = ZDPDataCenter(rawValue: 0)
        else { return }
        ZohoDeskPortalKit.initialize(orgID: orgID, appID: appID, dataCenter: dataCenter)
    }
    
    //Extract the login credentials from arguments and login to ASAP with JWT Token
    private func login(arguments: [String: Any]?, onCompletion handler: @escaping FlutterResult) {
        guard let jwtToken = arguments?["jwtToken"] as? String else { return }
        ZohoDeskPortalKit.login(withJWTToken: jwtToken, onCompletion: handler)
    }
    
    //Extract the accounts keys from arguments, then initialize accounts keys
    private func initAccountsKeys(arguments: [String: Any]?) {
        
        guard let clientID = arguments?["clientId"] as? String,
              let clientSecret = arguments?["clientSecretId"] as? String,
              let portalID = arguments?["portalId"] as? String,
              let urlScheme = arguments?["redirURI"] as? String else { return }
        
        ZohoDeskPortalKit.setAuthDetails(clientID: clientID, clientSecret: clientSecret, portalID: portalID, urlScheme: urlScheme)
    }
    
    private func presentLoginScreen(onCompletion handler: @escaping FlutterResult) {
        ZohoDeskPortalKit.signIn(onCompletion: handler)
    }
    
    //Enable ASAP Push notifications
    private func enablePush() {
        guard let deviceID = ZohodeskPortalApikitPlugin.deviceIDForZDPortal else { return }
        ZohoDeskPortalKit.enablePushNotifications(deviceToken: deviceID, mode: .production)
    }
    
    //Disable ASAP Push notifications
    private func disablePush() {
        guard let deviceID = ZohodeskPortalApikitPlugin.deviceIDForZDPortal else { return }
        ZohoDeskPortalKit.disablePushNotifications(deviceToken: deviceID, mode: .production) {_ in}
    }

    ///ASAP Plugin public APIs identifier
    private enum ZDPKitAPIs: String {
        case initializeSDK
        case login, logout
        case enableLogs
        case enablePush
        case disablePush
        case initAccountsKeys = "initializeAccountsKeys"
        case presentLoginScreen
    }
}

@propertyWrapper
public struct Defaults<Value> {
  let key: String
  let defaultValue: Value
  
  public var wrappedValue: Value {
    get { UserDefaults.standard.value(forKey: key) as? Value ?? defaultValue }
    set { UserDefaults.standard.set(newValue, forKey: key) }
  }
  
  init(wrappedValue value: Value, key: String) {
    self.key = key
    self.defaultValue = value
  }
}
