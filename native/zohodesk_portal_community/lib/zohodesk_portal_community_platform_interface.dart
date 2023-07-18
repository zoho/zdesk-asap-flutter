import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_community_method_channel.dart';

abstract class ZohodeskPortalCommunityPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalCommunityPlatform.
  ZohodeskPortalCommunityPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalCommunityPlatform _instance = MethodChannelZohodeskPortalCommunity();

  /// The default instance of [ZohodeskPortalCommunityPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalCommunity].
  static ZohodeskPortalCommunityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalCommunityPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalCommunityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show();

  Future<void> showTopicForm();
}
