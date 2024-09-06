import 'zohodesk_portal_gc_platform_interface.dart';

///ASAP GC Bot
class ZDPortalGC {

  ///To show GC bot screen
  static Future<void> showGC() => ZohodeskPortalGcPlatform.instance.showGC();

  ///To show GC bot screen
  static Future<void> showAnswerBot() => ZohodeskPortalGcPlatform.instance.showAnswerBot();

  ///To show GC bot screen
  static Future<void> showBM() => ZohodeskPortalGcPlatform.instance.showBM();

  ///To set GC session variable
  static Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.setGCSessionVariable(sessionVariables);

  ///To update GC session variable
  static Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.updateGCSessionVariable(sessionVariables);

  ///To set BM session variable
  static Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.setBMSessionVariable(sessionVariables);

  ///To update BM session variable
  static Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables) => ZohodeskPortalGcPlatform.instance.updateBMSessionVariable(sessionVariables);
}
