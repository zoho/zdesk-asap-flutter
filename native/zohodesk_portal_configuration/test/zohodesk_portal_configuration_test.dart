import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart';
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration.dart';
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration_platform_interface.dart';
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalConfigurationPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalConfigurationPlatform {

  @override
  Future<void> setTheme(ZDPTheme theme) async {
  }

  @override
  Future<void> handleNotification(Map<String, dynamic> map) async {

  }
}

void main() {
  final ZohodeskPortalConfigurationPlatform initialPlatform = ZohodeskPortalConfigurationPlatform.instance;

  test('$MethodChannelZohodeskPortalConfiguration is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalConfiguration>());
  });
}
