
import 'common/ChatComponent.dart';
import 'common/LauncherMode.dart';
import 'common/SalesIQInitCallback.dart';
import 'zohodesk_portal_siq_platform_interface.dart';

///ASAP Agent Chat
class ZohodeskPortalSiq {

  ///To show Agent Chat screen
  static Future<void> show() => ZohodeskPortalSiqPlatform.instance.show();

  static Future<void> setSalesIQInitCallback(SalesIQInitCallback callback) => ZohodeskPortalSiqPlatform.instance.setSalesIQInitCallback( callback);

  static Future<void> setChatBrandDetails(String appKey, String accessKey) => ZohodeskPortalSiqPlatform.instance.setChatBrandDetails(appKey, accessKey);

  static Future<void> setChatVisibility(ChatComponent component, bool visibility) => ZohodeskPortalSiqPlatform.instance.setChatVisibility(component, visibility);

  static Future<void> showOfflineMessage(bool isShow) => ZohodeskPortalSiqPlatform.instance.showOfflineMessage( isShow);

  static Future<void> allowChatInOfflineMode(bool isAllow) => ZohodeskPortalSiqPlatform.instance.allowChatInOfflineMode( isAllow);

  static Future<void> hideQueueTime(bool isHide) => ZohodeskPortalSiqPlatform.instance.hideQueueTime( isHide);

  static Future<void> showFeedbackAfterSkip(bool isShow) => ZohodeskPortalSiqPlatform.instance.showFeedbackAfterSkip( isShow);

  static Future<void> enableDragToDismiss(bool isEnable) => ZohodeskPortalSiqPlatform.instance.enableDragToDismiss( isEnable);

  static Future<void> setKnowledgeBaseVisibility(bool visibility) => ZohodeskPortalSiqPlatform.instance.setKnowledgeBaseVisibility( visibility);

  static Future<void> setLoggerEnabled(bool isEnable) => ZohodeskPortalSiqPlatform.instance.setLoggerEnabled( isEnable);

  static Future<void> setConversationVisibility(bool visibility) => ZohodeskPortalSiqPlatform.instance.setConversationVisibility( visibility);

  static Future<void> setConversationTitle(String title) => ZohodeskPortalSiqPlatform.instance.setConversationTitle( title);

  static Future<void> setLauncherVisibility(LauncherMode visibility) => ZohodeskPortalSiqPlatform.instance.setLauncherVisibility( visibility);

}
