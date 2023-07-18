import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zohodesk_portal_ticket_method_channel.dart';

abstract class ZohodeskPortalTicketPlatform extends PlatformInterface {
  /// Constructs a ZohodeskPortalTicketPlatform.
  ZohodeskPortalTicketPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZohodeskPortalTicketPlatform _instance = MethodChannelZohodeskPortalTicket();

  /// The default instance of [ZohodeskPortalTicketPlatform] to use.
  ///
  /// Defaults to [MethodChannelZohodeskPortalTicket].
  static ZohodeskPortalTicketPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZohodeskPortalTicketPlatform] when
  /// they register themselves.
  static set instance(ZohodeskPortalTicketPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show();
}