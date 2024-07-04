import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'data/zdp_ticket_configuration.dart';
import 'zohodesk_portal_ticket_platform_interface.dart';

/// An implementation of [ZohodeskPortalTicketPlatform] that uses method channels.
class MethodChannelZohodeskPortalTicket extends ZohodeskPortalTicketPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_ticket');

  ///ASAP Ticket show channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod<String>('show');

  ///ASAP Ticket set configuration channel method
  @override
  Future<void> setConfiguration(ZDPTicketConfiguration configuration) async => await methodChannel.invokeMethod('setConfiguration', {'configuration': jsonEncode(configuration)});
}