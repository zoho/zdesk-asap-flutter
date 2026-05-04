import '../zohodesk_portal_chatkit_platform_interface.dart';

class ZDPortalBMConfiguration {

  /// To configure Business Messaging more option visibility
  static Future<void> setMoreOptionVisibility(bool isVisible) =>
    ZohodeskPortalChatKitPlatform.instance.setBMMoreOptionVisibility(isVisible);
}

class ZDPortalGCConfiguration {

  /// To configure Guided Conversations language picker
  static Future<void> enableLanguagePicker(bool isEnabled) =>
    ZohodeskPortalChatKitPlatform.instance.enableGCLanguagePicker(isEnabled);
}
