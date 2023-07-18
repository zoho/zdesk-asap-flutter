import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket.dart';
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket_platform_interface.dart';
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalTicketPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalTicketPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> show() async {

  }
}

void main() {
  final ZohodeskPortalTicketPlatform initialPlatform = ZohodeskPortalTicketPlatform.instance;

  test('$MethodChannelZohodeskPortalTicket is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZohodeskPortalTicket>());
  });

  test('getPlatformVersion', () async {
    ZohodeskPortalTicket zohodeskPortalTicketPlugin = ZohodeskPortalTicket();
    MockZohodeskPortalTicketPlatform fakePlatform = MockZohodeskPortalTicketPlatform();
    ZohodeskPortalTicketPlatform.instance = fakePlatform;

  });
}
