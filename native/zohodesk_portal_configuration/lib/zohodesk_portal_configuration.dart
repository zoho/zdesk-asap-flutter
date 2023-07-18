
import 'zohodesk_portal_configuration_platform_interface.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart';

class ZohodeskPortalConfiguration {

  static setTheme(ZDPTheme theme) async => await ZohodeskPortalConfigurationPlatform.instance.setTheme(theme);

  static handleNotification(Map<String, dynamic> map) async => await ZohodeskPortalConfigurationPlatform.instance.handleNotification(map);
}
