import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart';
import 'package:zohodesk_portal_apikit/common/ZDResponseCallback.dart';
import 'zohodesk_portal_apikit_method_channel.dart';

abstract class ZohodeskPortalApikitPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalApikitPlatform.
  ZohodeskPortalApikitPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalApikitPlatform _instance = MethodChannelZohodeskPortalApikit();

  /// The default instance of [ZohodeskPortalApikitPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalApikit].
  static ZohodeskPortalApikitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalApikitPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalApikitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initializeSDK(String orgID, String appID, [ZDPDataCenter? dataCenter]);

  Future<bool> login(String jwtToken);
  Future<bool> logout();

  Future<void> enableLogs();

  Future<void> enablePush(String fcmToken);
  Future<void> disablePush(String fcmToken);
  Future<void> initializeAccountsKeys(String clientId, String clientSecretId, String portalId, String redirURI);
  Future<bool> presentLoginScreen(String colorString);
  Future<bool> isUserSignedIn();
  Future<void> getDepartments(DepartmentsCallback callback);
  Future<void> getLayouts(String departmentId, LayoutsCallback callback);
  Future<void> getTicketForm(TicketFormCallback callback, Map<String, String>? params, String? flags);
  Future<void> getTicketFields(TicketFieldsCallback callback, Map<String, String>? params, String? flags);
}