import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zohodesk_portal_configuration/data/zdp_configuration.dart';
import 'zohodesk_portal_configuration_method_channel.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart';

abstract class ZohodeskPortalConfigurationPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalConfigurationPlatform.
  ZohodeskPortalConfigurationPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalConfigurationPlatform _instance = MethodChannelZohodeskPortalConfiguration();

  /// The default instance of [ZohodeskPortalConfigurationPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalConfiguration].
  static ZohodeskPortalConfigurationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalConfigurationPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalConfigurationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setTheme(ZDPTheme theme);

  Future<void> handleNotification(Map<String, dynamic> map);

  Future<void> setConfiguration(ZDPConfiguration configuration);

  Future<void> setLanguage(String language);
}
