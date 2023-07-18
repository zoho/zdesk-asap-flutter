import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_apikit/zohodesk_portal_apikit_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalApikit platform = MethodChannelZohodeskPortalApikit();
  const MethodChannel channel = MethodChannel('zohodesk_portal_apikit');

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
