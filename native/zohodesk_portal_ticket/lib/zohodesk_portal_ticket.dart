import 'zohodesk_portal_ticket_platform_interface.dart';

///ASAP Ticket
class ZohodeskPortalTicket {

  ///To show Tickets screen
  static Future<void> show() => ZohodeskPortalTicketPlatform.instance.show();
}