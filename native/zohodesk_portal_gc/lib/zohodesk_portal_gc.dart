import 'zohodesk_portal_gc_platform_interface.dart';

///ASAP GC Bot
class ZDPortalGC {

  ///To show GC bot screen
  static Future<void> showGC() => ZohodeskPortalGcPlatform.instance.showGC();

  ///To show GC bot screen
  static Future<void> showKBBot() => ZohodeskPortalGcPlatform.instance.showKBBot();

  ///To show GC bot screen
  static Future<void> showBMChat() => ZohodeskPortalGcPlatform.instance.showBMChat();

  ///To set GC session variable
  static Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.setGCSessionVariable(sessionVariables);

  ///To update GC session variable
  static Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.updateGCSessionVariable(sessionVariables);

  ///To set BM session variable
  static Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.setBMSessionVariable(sessionVariables);

  ///To update BM session variable
  static Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.updateBMSessionVariable(sessionVariables);
}
