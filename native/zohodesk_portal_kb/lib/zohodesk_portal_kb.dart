
import 'zohodesk_portal_kb_platform_interface.dart';

///ASAP Knowledgebase
class ZohodeskPortalKb {

  ///To show ASAP Knowledgebase screen
  static Future show() {
    return ZohodeskPortalKbPlatform.instance.show();
  }
}
