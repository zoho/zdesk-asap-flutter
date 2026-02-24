import '../zohodesk_portal_kb_platform_interface.dart';
import '../model/kb_configuration_model.dart';

class KBConfiguration {

  ///To disable article detail search
  static Future<void> disableArticleDetailSearch(bool isDisable) => ZohodeskPortalKbPlatform.instance.disableArticleDetailSearch(isDisable);

  ///To disable article like
  static Future<void> disableArticleLike(bool isDisable) => ZohodeskPortalKbPlatform.instance.disableArticleLike(isDisable);

  ///To disable article dislike
  static Future<void> disableArticleDislike(bool isDisable) => ZohodeskPortalKbPlatform.instance.disableArticleDislike(isDisable);

  ///To disable text reader
  static Future<void> disableTextReader(bool isDisable) => ZohodeskPortalKbPlatform.instance.disableTextReader(isDisable);

  ///To allow sharing article
  //Will expose once native implementation is done
  // static Future<void> isShareArticleAllowed(bool isAllowed) => ZohodeskPortalKbPlatform.instance.isShareArticleAllowed(isAllowed);

  ///To disable key searcher
  static Future<void> disableKeySearcher(bool isDisable) => ZohodeskPortalKbPlatform.instance.disableKeySearcher(isDisable);

  ///To set related article preference
  static Future<void> relatedArticlePreference(ZDPRelatedArticlePreference preference) => ZohodeskPortalKbPlatform.instance.relatedArticlePreference(preference);

  ///To set search preference
  static Future<void> searchPreference(ZDPSearchPreference preference) => ZohodeskPortalKbPlatform.instance.searchPreference(preference);
}