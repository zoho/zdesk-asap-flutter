import 'package:flutter_test/flutter_test.dart';
// import 'package:zohodesk_portal_kb/zohodesk_portal_kb.dart';
import 'package:zohodesk_portal_kb/zohodesk_portal_kb_platform_interface.dart';
import 'package:zohodesk_portal_kb/zohodesk_portal_kb_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalKbPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalKbPlatform {

  @override
  Future show() async {
  }
}

void main() {
  final ZohodeskPortalKbPlatform initialPlatform = ZohodeskPortalKbPlatform.instance;

  test('$MethodChannelZohodeskPortalKb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalKb>());
  });
}
