import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_core/zohodesk_portal_core_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalCore platform = MethodChannelZohodeskPortalCore();
  const MethodChannel channel = MethodChannel('zohodesk_portal_core');

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
