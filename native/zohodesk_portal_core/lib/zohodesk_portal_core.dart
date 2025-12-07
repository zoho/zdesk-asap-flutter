import 'zohodesk_portal_core_platform_interface.dart';
import 'common/zdphomeconfiguration.dart';
import 'common/ZDPHomeEventListener.dart';
import 'package:flutter/services.dart' show EventChannel;

///ASAP Core
class ZohodeskPortalCore {

  ///To show ASAP Dashboard screen
  static Future<void> showHome() => ZohodeskPortalCorePlatform.instance.showHome();

  ///To set configuration for ASAP Dashboard screen
  static Future<void> setConfiguration(ZDPHomeConfiguration configuration) {
    return ZohodeskPortalCorePlatform.instance.setConfiguration(configuration);
  }

  //To observe events from ASAP Dashboard screen
  static void setEventListener(ZDPHomeEventListener listener) => ZohodeskPortalCorePlatform.instance.setEventListener(listener);
}
