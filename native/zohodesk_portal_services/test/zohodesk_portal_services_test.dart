import 'package:flutter_test/flutter_test.dart';
// import 'package:zohodesk_portal_services/zohodesk_portal_services.dart';
import 'package:zohodesk_portal_services/zohodesk_portal_services_platform_interface.dart';
import 'package:zohodesk_portal_services/zohodesk_portal_services_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalServicesPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalServicesPlatform {

  @override
  Future<void> show() {
    // TODO: implement show
    throw UnimplementedError();
  }
}

void main() {
  final ZohodeskPortalServicesPlatform initialPlatform = ZohodeskPortalServicesPlatform.instance;

  test('$MethodChannelZohodeskPortalServices is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalServices>());
  });
}
