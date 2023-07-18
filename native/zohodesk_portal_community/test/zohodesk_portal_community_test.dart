import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community_platform_interface.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalCommunityPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalCommunityPlatform {

  @override
  Future<void> show() async {

  }

  @override
  Future<void> showTopicForm() async {
  }
}

void main() {
  final ZohodeskPortalCommunityPlatform initialPlatform = ZohodeskPortalCommunityPlatform.instance;

  test('$MethodChannelZohodeskPortalCommunity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalCommunity>());
  });
}
