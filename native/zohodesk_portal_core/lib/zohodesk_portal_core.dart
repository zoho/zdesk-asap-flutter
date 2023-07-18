
import 'zohodesk_portal_core_platform_interface.dart';

///ASAP Core
class ZohodeskPortalCore {

  ///To show ASAP Dashboard screen
  static Future<void> showHome() => ZohodeskPortalCorePlatform.instance.showHome();
}
