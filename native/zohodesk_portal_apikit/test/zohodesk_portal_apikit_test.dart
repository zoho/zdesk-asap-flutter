import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart';
import 'package:zohodesk_portal_apikit/zohodesk_portal_apikit_platform_interface.dart';
import 'package:zohodesk_portal_apikit/zohodesk_portal_apikit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalApikitPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalApikitPlatform {
  @override
  Future<void> initializeSDK(String orgID, String appID, [ZDPDataCenter? dataCenter]) async {

  }

  @override
  Future<bool> login(String jwtToken) async {
    return true;
  }

  @override
  Future<bool> logout() async {
   return true;
  }

  @override
  Future<void> enableLogs() async {
  }

  @override
  Future<void> disablePush() async {
  }

  @override
  Future<void> enablePush() async {
  }
}

void main() {
  final ZohodeskPortalApikitPlatform initialPlatform = ZohodeskPortalApikitPlatform.instance;

  test('$MethodChannelZohodeskPortalApikit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalApikit>());
  });
}
