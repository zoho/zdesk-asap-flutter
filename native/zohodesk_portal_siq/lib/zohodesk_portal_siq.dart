
import 'zohodesk_portal_siq_platform_interface.dart';

///ASAP Agent Chat
class ZohodeskPortalSiq {

  ///To show Agent Chat screen
  static Future<void> show() => ZohodeskPortalSiqPlatform.instance.show();
}
