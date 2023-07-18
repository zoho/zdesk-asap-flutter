import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_ticket/zohodesk_portal_ticket_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalTicket platform = MethodChannelZohodeskPortalTicket();
  const MethodChannel channel = MethodChannel('zohodesk_portal_ticket');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
