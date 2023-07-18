import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_core_method_channel.dart';

abstract class ZohodeskPortalCorePlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalCorePlatform.
  ZohodeskPortalCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalCorePlatform _instance = MethodChannelZohodeskPortalCore();

  /// The default instance of [ZohodeskPortalCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalCore].
  static ZohodeskPortalCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalCorePlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showHome();
}
