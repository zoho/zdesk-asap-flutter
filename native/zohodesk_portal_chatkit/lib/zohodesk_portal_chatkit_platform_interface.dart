import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_chatkit_method_channel.dart';

abstract class ZohodeskPortalChatKitPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalGcPlatform.
  ZohodeskPortalChatKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalChatKitPlatform _instance = MethodChannelZohodeskPortalChatKit();

  /// The default instance of [ZohodeskPortalChatKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalChatKit].
  static ZohodeskPortalChatKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalChatKitPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalChatKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showGC();
  Future<void> showAnswerBot();
  Future<void> showBM();

  Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables);
  Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables);
  Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables);
  Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables);
  Future<void> hideEndChatPopupWindow(bool hide);

  Future<void> clearGCData();
  Future<void> clearBMData();
  Future<void> clearAnswerBotData();
}
