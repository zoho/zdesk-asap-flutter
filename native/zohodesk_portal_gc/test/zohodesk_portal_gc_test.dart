import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_gc/zohodesk_portal_gc.dart';
import 'package:zohodesk_portal_gc/zohodesk_portal_gc_platform_interface.dart';
import 'package:zohodesk_portal_gc/zohodesk_portal_gc_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalGcPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalGcPlatform {
  @override
  Future<void> show() async {
  }

}

void main() {
  final ZohodeskPortalGcPlatform initialPlatform = ZohodeskPortalGcPlatform.instance;

  test('$MethodChannelZohodeskPortalGc is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalGc>());
  });

}
