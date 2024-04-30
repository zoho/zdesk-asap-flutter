import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'common/ZDCustomizedTicketForm.dart';
import 'common/ZDVisibleTicketField.dart';
import 'zohodesk_portal_submit_ticket_method_channel.dart';

abstract class ZohodeskPortalSubmitTicketPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalSubmitTicketPlatform.
  ZohodeskPortalSubmitTicketPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalSubmitTicketPlatform _instance = MethodChannelZohodeskPortalSubmitTicket();

  /// The default instance of [ZohodeskPortalSubmitTicketPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalSubmitTicket].
  static ZohodeskPortalSubmitTicketPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalSubmitTicketPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalSubmitTicketPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show();

  Future<void> preFillTicketFields(List<ZDCustomizedTicketForm> customizedTicketForms);

  Future<void> setTicketsFieldsListTobeShown(List<ZDVisibleTicketField> visibleTicketFields);
}
