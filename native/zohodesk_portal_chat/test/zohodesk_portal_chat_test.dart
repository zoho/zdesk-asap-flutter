import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_chat/zohodesk_portal_chat.dart';
import 'package:zohodesk_portal_chat/zohodesk_portal_chat_platform_interface.dart';
import 'package:zohodesk_portal_chat/zohodesk_portal_chat_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalChatPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalChatPlatform {
  @override
  Future<void> show() async {

  }
}

void main() {
  final ZohodeskPortalChatPlatform initialPlatform = ZohodeskPortalChatPlatform.instance;

  test('$MethodChannelZohodeskPortalChat is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalChat>());
  });
}
