import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_services_method_channel.dart';

abstract class ZohodeskPortalServicesPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalServicesPlatform.
  ZohodeskPortalServicesPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalServicesPlatform _instance = MethodChannelZohodeskPortalServices();

  /// The default instance of [ZohodeskPortalServicesPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalServices].
  static ZohodeskPortalServicesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalServicesPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalServicesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
