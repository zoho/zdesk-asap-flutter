
import 'zohodesk_portal_community_platform_interface.dart';

///ASAP Community
class ZohodeskPortalCommunity {

  ///To show ASAP Community Screen
  static Future<void> show() => ZohodeskPortalCommunityPlatform.instance.show();

  ///To show ASAP Community Topic Form
  static Future<void> showTopicForm() => ZohodeskPortalCommunityPlatform.instance.showTopicForm();
}
