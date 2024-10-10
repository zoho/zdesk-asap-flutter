
import 'zohodesk_portal_siq_platform_interface.dart';

///ASAP Agent Chat
class ZDPortalSiq {

  ///To show Agent Chat screen
  static Future<void> show() => ZohodeskPortalSiqPlatform.instance.show();
}
