import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_kb/zohodesk_portal_kb_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalKb platform = MethodChannelZohodeskPortalKb();
  const MethodChannel channel = MethodChannel('zohodesk_portal_kb');

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
