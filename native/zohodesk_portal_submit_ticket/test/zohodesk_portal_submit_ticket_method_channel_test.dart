import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_submit_ticket/zohodesk_portal_submit_ticket_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalSubmitTicket platform = MethodChannelZohodeskPortalSubmitTicket();
  const MethodChannel channel = MethodChannel('zohodesk_portal_submit_ticket');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
