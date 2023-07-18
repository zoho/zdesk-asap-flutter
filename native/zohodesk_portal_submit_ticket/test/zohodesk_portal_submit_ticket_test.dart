import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket_platform_interface.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalSubmitTicketPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalSubmitTicketPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZohodeskPortalSubmitTicketPlatform initialPlatform = ZohodeskPortalSubmitTicketPlatform.instance;

  test('$MethodChannelZohodeskPortalSubmitTicket is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalSubmitTicket>());
  });

  test('getPlatformVersion', () async {
    ZohodeskPortalSubmitTicket zohodeskPortalSubmitTicketPlugin = ZohodeskPortalSubmitTicket();
    MockZohodeskPortalSubmitTicketPlatform fakePlatform = MockZohodeskPortalSubmitTicketPlatform();
    ZohodeskPortalSubmitTicketPlatform.instance = fakePlatform;

    expect(await zohodeskPortalSubmitTicketPlugin.getPlatformVersion(), '42');
  });
}
