import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_gc_method_channel.dart';

abstract class ZohodeskPortalGcPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalGcPlatform.
  ZohodeskPortalGcPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalGcPlatform _instance = MethodChannelZohodeskPortalGc();

  /// The default instance of [ZohodeskPortalGcPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalGc].
  static ZohodeskPortalGcPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalGcPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalGcPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showGC();
  Future<void> showKBBot();
  Future<void> showBMChat();

  Future<void> setGCSessionVariable(Map<String, String> sessionVariable);
  Future<void> updateGCSessionVariable(Map<String, String> sessionVariable);
  Future<void> setBMSessionVariable(Map<String, String> sessionVariable);
  Future<void> updateBMSessionVariable(Map<String, String> sessionVariable);
}
