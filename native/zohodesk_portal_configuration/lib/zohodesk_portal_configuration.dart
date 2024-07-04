import 'package:zohodesk_portal_configuration/data/zdp_configuration.dart';
import 'zohodesk_portal_configuration_platform_interface.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart';

class ZohodeskPortalConfiguration {

  static setTheme(ZDPTheme theme) async => await ZohodeskPortalConfigurationPlatform.instance.setTheme(theme);

  static handleNotification(Map<String, dynamic> map) async => await ZohodeskPortalConfigurationPlatform.instance.handleNotification(map);

  static setConfiguration(ZDPConfiguration configuration) async => await ZohodeskPortalConfigurationPlatform.instance.setConfiguration(configuration);
}
