import 'zohodesk_portal_core_platform_interface.dart';
import 'data/zdphomeconfiguration.dart';

///ASAP Core
class ZohodeskPortalCore {

  ///To show ASAP Dashboard screen
  static Future<void> showHome() => ZohodeskPortalCorePlatform.instance.showHome();

  ///To set configuration for ASAP Dashboard screen
  static Future<void> setConfiguration(ZDPHomeConfiguration configuration) {
    return ZohodeskPortalCorePlatform.instance.setConfiguration(configuration);
  }
}