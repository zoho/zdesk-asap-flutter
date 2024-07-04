import 'data/zdp_ticket_configuration.dart';
import 'zohodesk_portal_ticket_platform_interface.dart';

///ASAP Ticket
class ZohodeskPortalTicket {

  ///To show Tickets screen
  static Future<void> show() => ZohodeskPortalTicketPlatform.instance.show();

  ///To Set configuration for ticket module
  static setConfiguration(ZDPTicketConfiguration configuration) async => await ZohodeskPortalTicketPlatform.instance.setConfiguration(configuration);
}