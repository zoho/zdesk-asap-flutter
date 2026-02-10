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

  ///To disable or enable topic edit option in ASAP Community
  static Future<void> disableTopicEdit(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicEdit(isDisable);

  ///To disable or enable topic delete option in ASAP Community
  static Future<void> disableTopicDelete(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicDelete(isDisable);

  ///To disable or enable reply option in ASAP Community
  static Future<void> disableReply(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableReply(isDisable);

  ///To disable or enable reply edit option in ASAP Community
  static Future<void> disableReplyEdit(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableReplyEdit(isDisable);

  ///To disable or enable reply delete option in ASAP Community
  static Future<void> disableReplyDelete(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableReplyDelete(isDisable);

  ///To disable or enable topic detail search option in ASAP Community
  static Future<void> disableTopicDetailSearch(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicDetailSearch(isDisable);

  ///To disable or enable text reader option in ASAP Community
  static Future<void> disableTextReader(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTextReader(isDisable);

  ///To disable or enable key searcher option in ASAP Community
  static Future<void> disableKeySearcher(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableKeySearcher(isDisable);

  ///To disable or enable topic share option in ASAP Community
  static Future<void> disableTopicShare(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicShare(isDisable);

  ///To disable or enable topic like option in ASAP Community
  static Future<void> disableTopicLike(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicLike(isDisable);

  ///To disable or enable topic comment option in ASAP Community
  static Future<void> disableTopicComment(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicComment(isDisable);
}
