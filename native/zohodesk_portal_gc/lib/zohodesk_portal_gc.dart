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
  static Future<void> setGCSessionVariable(String variableName, String updatedValue) => ZohodeskPortalGcPlatform.instance.setGCSessionVariable(variableName, updatedValue);

  ///To update GC session variable
  static Future<void> updateGCSessionVariable(String variableName, String updatedValue) => ZohodeskPortalGcPlatform.instance.updateGCSessionVariable(variableName, updatedValue);

  ///To set BM session variable
  static Future<void> setBMSessionVariable(String variableName, String updatedValue) => ZohodeskPortalGcPlatform.instance.setBMSessionVariable(variableName, updatedValue);

  ///To update BM session variable
  static Future<void> updateBMSessionVariable(String variableName, String updatedValue) => ZohodeskPortalGcPlatform.instance.updateBMSessionVariable(variableName, updatedValue);
}
