import Flutter
import UIKit
import ZohoDeskPortalAPIKit

public class ZohodeskPortalApikitPlugin: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zohodesk_portal_apikit", binaryMessenger: registrar.messenger())
    let instance = ZohodeskPortalApikitPlugin()
      
      PNConstants.refererName = "ZohoDeskPortalSDKFlutteriOS"
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
          
      case .isUserSignedIn:
          result(ZohoDeskPortalKit.isUserLoggedIn)
          
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
          
          ///To get list of departments in the ASAP add-on
      case .getDepartments:
          getDepartments(onCompletion: result)
          
          ///To get list of layouts of a department
      case .getLayouts:
          getLayouts(arguments: arguments, onCompletion: result)
          
      case .getTicketForm:
          getTicketForm(arguments: arguments, onCompletion: result)
          
      case .getTicketFields:
          getTicketFields(arguments: arguments, onCompletion: result)
          
      default:
          break
      }
  }
    
    //Extract the required parameter from arguments and initialize the ASAP SDK
    private func initializeSDK(arguments: [String: Any]?) {
        guard let orgID = arguments?["orgID"] as? String,
              let appID = arguments?["appID"] as? String,
              let dataCenterValue = arguments?["dataCenter"] as? Int,
              let dataCenter = ZDPDataCenter(rawValue: dataCenterValue)
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
    
    //Disable ASAP Push notifications
    private func disablePush() {
        //Need to handled on ASAP native SDK
        ZohoDeskPortalKit.disablePushNotifications(deviceToken: "deviceID", mode: .production) {_ in}
    }
    
    //ASAP API to get departments list of the Add-On
    private func getDepartments(onCompletion: @escaping FlutterResult) {
        ZohoDeskPortalKit.getDepartments { result in
            switch result {
            case .success(let departments):
                onCompletion(departments.jsonString)
            case .failure(let error):
                error.parseError(onCompletion)
            }
        }
    }
    
    //ASAP API to get layouts list of a department
    private func getLayouts(arguments: [String: Any]?, onCompletion: @escaping FlutterResult) {

        ZohoDeskPortalKit.Ticket.getLayouts(arguments) { result in
            switch result {
            case .success(let layouts):
                onCompletion(layouts.jsonString)
            case .failure(let error):
                error.parseError(onCompletion)
            }
        }
        
    }
        
    private func getTicketForm(arguments: [String: Any]?, onCompletion: @escaping FlutterResult) {
        var modifiedArguments = arguments?["params"] as? [String: Any]
        ZohoDeskPortalKit.Ticket.getForm(modifiedArguments, headers: nil) { result in
            switch result {
            case .success(let ticketSections):
                if let dataString = ticketSections.jsonString, let dataObject = dataString.convertJsonToDataObject() {
                    // Editing JSON response to match Flutter Dart model class before passing in onCompletion
                    let wrappedJsonDict: [String: Any] = ["form": dataObject]
                    if let modifiedJsonString = wrappedJsonDict.convertObjecttoJsonString() {
                        onCompletion(modifiedJsonString)
                    }
                }
            case .failure(let error):
                error.parseError(onCompletion)
            }
        }
    }
    
    private func getTicketFields(arguments: [String: Any]?, onCompletion: @escaping FlutterResult) {
        var modifiedArguments = arguments?["params"] as? [String: Any]
        
        ZohoDeskPortalKit.Ticket.getFields(modifiedArguments) { result in
            switch result {
            case .success(let fields):
                if let dataString = fields.jsonString, let dataObject = dataString.convertJsonToDataObject() {
                    // Editing JSON response to match Flutter Dart model class before passing in onCompletion
                    let wrappedJsonDict: [String: Any] = ["data": dataObject]
                    if let modifiedJsonString = wrappedJsonDict.convertObjecttoJsonString() {
                        onCompletion(modifiedJsonString)
                    }
                }
            case .failure(let error):
                error.parseError(onCompletion)
            }
        }
    }
    

    ///ASAP Plugin public APIs identifier
    private enum ZDPKitAPIs: String {
        case initializeSDK
        case login, logout
        case isUserSignedIn
        case enableLogs
        case disablePush
        case initAccountsKeys = "initializeAccountsKeys"
        case presentLoginScreen
        case getDepartments
        case getLayouts
        case getTicketForm
        case getTicketFields
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


extension Encodable {

//    Object to JSON conversion to pass the result to flutter
    internal var jsonString: String? {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            return String(data: try encoder.encode(self), encoding: .utf8)
        } catch {
            return nil
        }
    }
}

extension ZDPError {
//    Error mapping according to Flutter errors
    internal func parseError(_ callback: FlutterResult) {
        switch self {
        case .noInternet:
            callback(101)
        case .noData:
            callback(104)
        default:
            callback(106)
        }
    }
}

public extension String {
    public func parser<AnyDecodable: Decodable>() -> AnyDecodable? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        return try? JSONDecoder().decode(AnyDecodable.self, from: data)
    }
    
    func convertJsonToDataObject() -> Any? {
        if let data = self.data(using: .utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: [])
        }
        return nil
    }
}

extension Dictionary {
    func convertObjecttoJsonString() -> String? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
