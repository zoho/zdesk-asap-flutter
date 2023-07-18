import 'zohodesk_portal_gc_platform_interface.dart';

///ASAP GC Bot
class ZDPortalGC {

  ///To show GC bot screen
  static Future<void> show() => ZohodeskPortalGcPlatform.instance.show();
}
