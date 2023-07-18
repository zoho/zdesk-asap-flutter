import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_core/zohodesk_portal_core.dart';
import 'package:zohodesk_portal_core/zohodesk_portal_core_platform_interface.dart';
import 'package:zohodesk_portal_core/zohodesk_portal_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalCorePlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> showHome() async{
  }
}

void main() {
  final ZohodeskPortalCorePlatform initialPlatform = ZohodeskPortalCorePlatform.instance;

  test('$MethodChannelZohodeskPortalCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalCore>());
  });

  test('getPlatformVersion', () async {
    ZohodeskPortalCore zohodeskPortalCorePlugin = ZohodeskPortalCore();
    MockZohodeskPortalCorePlatform fakePlatform = MockZohodeskPortalCorePlatform();
    ZohodeskPortalCorePlatform.instance = fakePlatform;
  });
}
