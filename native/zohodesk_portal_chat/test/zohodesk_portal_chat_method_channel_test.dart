import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_chat/zohodesk_portal_chat_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalChat platform = MethodChannelZohodeskPortalChat();
  const MethodChannel channel = MethodChannel('zohodesk_portal_chat');

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
