import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_siq_method_channel.dart';

abstract class ZohodeskPortalSiqPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalSiqPlatform.
  ZohodeskPortalSiqPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalSiqPlatform _instance = MethodChannelZohodeskPortalSiq();

  /// The default instance of [ZohodeskPortalSiqPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalSiq].
  static ZohodeskPortalSiqPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalSiqPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalSiqPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show();
}
