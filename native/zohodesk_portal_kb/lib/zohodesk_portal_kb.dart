
import 'zohodesk_portal_kb_platform_interface.dart';

///ASAP Knowledgebase
class ZohodeskPortalKb {

  ///To show ASAP Knowledgebase screen
  static Future show() {
    return ZohodeskPortalKbPlatform.instance.show();
  }

  ///To show ASAP KB Category with permalink
  static Future<void> showCategoryWithPermalink(String permalink) => ZohodeskPortalKbPlatform.instance.showCategoryWithPermalink(permalink);

  ///To show ASAP KB Article with permalink
  static Future<void> showArticleWithPermalink(String permalink) => ZohodeskPortalKbPlatform.instance.showArticleWithPermalink(permalink);
}
