
import 'zohodesk_portal_chat_platform_interface.dart';

///ASAP Agent Chat
class ZDPortalChat {

  ///To show Agent Chat screen
  static Future<void> show() => ZohodeskPortalChatPlatform.instance.show();
}
