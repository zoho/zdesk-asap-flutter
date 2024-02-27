import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_kb_method_channel.dart';

abstract class ZohodeskPortalKbPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalKbPlatform.
  ZohodeskPortalKbPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalKbPlatform _instance = MethodChannelZohodeskPortalKb();

  /// The default instance of [ZohodeskPortalKbPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalKb].
  static ZohodeskPortalKbPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalKbPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalKbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future show();

  Future<void> showCategoryWithPermalink(String permalink);

  Future<void> showArticleWithPermalink(String permalink);
}
