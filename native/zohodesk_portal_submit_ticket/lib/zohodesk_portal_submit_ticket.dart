
import 'common/ZDCustomizedTicketForm.dart';
import 'common/ZDVisibleTicketField.dart';
import 'zohodesk_portal_submit_ticket_platform_interface.dart';

class ZohodeskPortalSubmitTicket {
  ///To show Submit Ticket screen
    static Future<void> show() => ZohodeskPortalSubmitTicketPlatform.instance.show();

    static Future<void> preFillTicketFields(List<ZDCustomizedTicketForm> customizedTicketForms) => ZohodeskPortalSubmitTicketPlatform.instance.preFillTicketFields(customizedTicketForms);

    static Future<void> setTicketsFieldsListTobeShown(List<ZDVisibleTicketField> visibleTicketFields) => ZohodeskPortalSubmitTicketPlatform.instance.setTicketsFieldsListTobeShown(visibleTicketFields);
}
