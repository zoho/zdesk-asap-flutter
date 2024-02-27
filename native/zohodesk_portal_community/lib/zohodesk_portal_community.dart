
import 'zohodesk_portal_community_platform_interface.dart';

///ASAP Community
class ZohodeskPortalCommunity {

  ///To show ASAP Community Screen
  static Future<void> show() => ZohodeskPortalCommunityPlatform.instance.show();

  ///To show ASAP Community Topic Form
  static Future<void> showTopicForm() => ZohodeskPortalCommunityPlatform.instance.showTopicForm();

  ///To show ASAP Community Topic with permalink
  static Future<void> showTopicWithPermaLink(String permalink) => ZohodeskPortalCommunityPlatform.instance.showTopicWithPermaLink(permalink);

  ///To show ASAP Community Topic with topic id
  static Future<void> showTopicWithId(String topicId) => ZohodeskPortalCommunityPlatform.instance.showTopicWithId(topicId);
}
