import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_submit_ticket/common/ZDCustomizedTicketForm.dart';
import 'package:zohodesk_portal_submit_ticket/common/ZDVisibleTicketField.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket_platform_interface.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZohodeskPortalSubmitTicketPlatform
    with MockPlatformInterfaceMixin
    implements ZohodeskPortalSubmitTicketPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> show() async {}

  @override
  Future<void> preFillTicketFields(
    List<ZDCustomizedTicketForm> customizedTicketForms,
  ) async {}

  @override
  Future<void> setTicketsFieldsListTobeShown(
    List<ZDVisibleTicketField> visibleTicketFields,
  ) async {}
}

void main() {
  final ZohodeskPortalSubmitTicketPlatform initialPlatform =
      ZohodeskPortalSubmitTicketPlatform.instance;

  test('$MethodChannelZohodeskPortalSubmitTicket is the default instance', () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelZohodeskPortalSubmitTicket>());
  });

  test('getPlatformVersion', () async {
    ZohodeskPortalSubmitTicket zohodeskPortalSubmitTicketPlugin =
        ZohodeskPortalSubmitTicket();
    MockZohodeskPortalSubmitTicketPlatform fakePlatform =
        MockZohodeskPortalSubmitTicketPlatform();
    ZohodeskPortalSubmitTicketPlatform.instance = fakePlatform;
  });
}
