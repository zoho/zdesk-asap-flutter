import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart';
import 'common/ZDResponseCallback.dart';
import 'zohodesk_portal_apikit_platform_interface.dart';

class ZohodeskPortalApikit {

  ///To initialize ASAP SDK
  static Future<void> initializeSDK(String orgID, String appID, ZDPDataCenter dataCenter) => ZohodeskPortalApikitPlatform.instance.initializeSDK(orgID, appID, dataCenter);

  ///To login into ASAP
  static login(String jwtToken, Function(bool isSuccess) handler) async => handler( await ZohodeskPortalApikitPlatform.instance.login(jwtToken));

  ///To logout into ASAP
  static logout(Function(bool isSuccess) handler) async => handler(await ZohodeskPortalApikitPlatform.instance.logout());

  ///By default logs are enabled in ASAP. Use below method to disable logs
  static enableLogs() async => await ZohodeskPortalApikitPlatform.instance.enableLogs();

  ///To enable push notification in ASAP SDK
  static  enablePush(String fcmToken) async => await ZohodeskPortalApikitPlatform.instance.enablePush(fcmToken);

  ///To enable push notification in ASAP SDK
  static  disablePush(String fcmToken) async => await ZohodeskPortalApikitPlatform.instance.disablePush(fcmToken);

  static Future<void> initializeAccountsKeys(String clientId, String clientSecretId, String portalId, String redirURI) => ZohodeskPortalApikitPlatform.instance.initializeAccountsKeys(clientId, clientSecretId, portalId, redirURI);

  static Future<void> presentLoginScreen(String colorString, Function(bool isSuccess) handler) async => handler(await ZohodeskPortalApikitPlatform.instance.presentLoginScreen(colorString));

  static Future<bool> get isUserSignedIn async => await ZohodeskPortalApikitPlatform.instance.isUserSignedIn();

  static getDepartments(DepartmentsCallback callback) async => await ZohodeskPortalApikitPlatform.instance.getDepartments(callback);

  static getLayouts(String departmentId, LayoutsCallback callback) async => await ZohodeskPortalApikitPlatform.instance.getLayouts(departmentId, callback);

}