import 'zohodesk_portal_chatkit_platform_interface.dart';

///ASAP Chat Kit
class ZohodeskPortalChatKit {

  ///To show GC bot screen
  static Future<void> showGC() => ZohodeskPortalChatKitPlatform.instance.showGC();

  ///To show Answer bot screen
  static Future<void> showAnswerBot() => ZohodeskPortalChatKitPlatform.instance.showAnswerBot();

  ///To show Business Messaging screen
  static Future<void> showBM() => ZohodeskPortalChatKitPlatform.instance.showBM();

  ///To set GC session variable
  static Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalChatKitPlatform.instance.setGCSessionVariable(sessionVariables);

  ///To update GC session variable
  static Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalChatKitPlatform.instance.updateGCSessionVariable(sessionVariables);

  ///To set Business Messaging session variable
  static Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalChatKitPlatform.instance.setBMSessionVariable(sessionVariables);

  ///To update Business Messaging session variable
  static Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalChatKitPlatform.instance.updateBMSessionVariable(sessionVariables);

  ///To hide GC end chat popup window
  static Future<void> hideEndChatPopupWindow(bool hide) => ZohodeskPortalChatKitPlatform.instance.hideEndChatPopupWindow(hide);

  ///To clear GC Data
  static Future<void> clearGCData() => ZohodeskPortalChatKitPlatform.instance.clearGCData();

  ///To clear BM Data
  static Future<void> clearBMData() => ZohodeskPortalChatKitPlatform.instance.clearBMData();

  ///To clear AnswerBot Data
  static Future<void> clearAnswerBotData() => ZohodeskPortalChatKitPlatform.instance.clearAnswerBotData();
}
