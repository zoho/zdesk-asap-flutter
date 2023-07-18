import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_chat_method_channel.dart';

abstract class ZohodeskPortalChatPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalChatPlatform.
  ZohodeskPortalChatPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalChatPlatform _instance = MethodChannelZohodeskPortalChat();

  /// The default instance of [ZohodeskPortalChatPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalChat].
  static ZohodeskPortalChatPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalChatPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalChatPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show();
}
