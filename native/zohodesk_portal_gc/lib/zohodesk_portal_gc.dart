import 'zohodesk_portal_gc_platform_interface.dart';

///ASAP GC Bot
class ZDPortalGC {

  ///To show GC bot screen
  static Future<void> showGC() => ZohodeskPortalGcPlatform.instance.showGC();

  ///To show GC bot screen
  static Future<void> showKBBot() => ZohodeskPortalGcPlatform.instance.showKBBot();

  ///To show GC bot screen
  static Future<void> showBMChat() => ZohodeskPortalGcPlatform.instance.showBMChat();
}
