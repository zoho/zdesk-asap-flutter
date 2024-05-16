import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'common/ZDCustomizedTicketForm.dart';
import 'common/ZDVisibleTicketField.dart';
import 'zohodesk_portal_submit_ticket_platform_interface.dart';

/// An implementation of [ZohodeskPortalSubmitTicketPlatform] that uses method channels.
class MethodChannelZohodeskPortalSubmitTicket extends ZohodeskPortalSubmitTicketPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_submit_ticket');

  ///ASAP Submit Ticket show channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod<String>('show');

  Future<void> preFillTicketFields(List<ZDCustomizedTicketForm> customizedTicketForms) async => await methodChannel.invokeMethod<String>('preFillTicketFields', { "customizedTicketForms": jsonEncode(customizedTicketForms)});

  Future<void> setTicketsFieldsListTobeShown(List<ZDVisibleTicketField> visibleTicketFields) async => await methodChannel.invokeMethod<String>('setTicketsFieldsListTobeShown', { "visibleTicketFields": jsonEncode(visibleTicketFields)});
}
