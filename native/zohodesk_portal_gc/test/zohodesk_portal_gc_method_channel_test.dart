import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_gc/zohodesk_portal_gc_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalGc platform = MethodChannelZohodeskPortalGc();
  const MethodChannel channel = MethodChannel('zohodesk_portal_gc');

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
