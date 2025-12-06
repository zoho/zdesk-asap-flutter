import 'zohodesk_portal_core_platform_interface.dart';
import 'data/zdphomeconfiguration.dart';
import 'package:flutter/services.dart' show EventChannel;

///ASAP Core
class ZohodeskPortalCore {
  static ZDPHomeEventListener? actionListener;
  static const homeEventChannel = EventChannel('zohodesk_portal_core_event');
  static bool _isListening = false;

  static void setEventListener(ZDPHomeEventListener listener) {
    actionListener = listener;
    _startListening();
  }

  static void _startListening() {
    if (_isListening) return;
    _isListening = true;
    homeEventChannel.receiveBroadcastStream().listen((event) {
      switch (event["type"]) {
        case 'onBackEvent':
          ZohodeskPortalCore.actionListener?.backButtonTapped();
          break;
        default:
          break;
      }
    });
  }

  ///To show ASAP Dashboard screen
  static Future<void> showHome() => ZohodeskPortalCorePlatform.instance.showHome();

  ///To set configuration for ASAP Dashboard screen
  static Future<void> setConfiguration(ZDPHomeConfiguration configuration) {
    return ZohodeskPortalCorePlatform.instance.setConfiguration(configuration);
  }
}

abstract class ZDPHomeEventListener {
  void backButtonTapped();
}
