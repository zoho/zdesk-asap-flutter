import '../zohodesk_portal_community_platform_interface.dart';

class ZDPCommunityConfiguration {

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
  //Will expose once native implementation is done
  // static Future<void> disableTopicShare(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicShare(isDisable);

  ///To disable or enable topic like option in ASAP Community
  static Future<void> disableTopicLike(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicLike(isDisable);

  ///To disable or enable topic comment option in ASAP Community
  static Future<void> disableTopicComment(bool isDisable) => ZohodeskPortalCommunityPlatform.instance.disableTopicComment(isDisable);
}