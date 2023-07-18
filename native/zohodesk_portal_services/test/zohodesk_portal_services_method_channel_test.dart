import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_services/zohodesk_portal_services_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalServices platform = MethodChannelZohodeskPortalServices();
  const MethodChannel channel = MethodChannel('zohodesk_portal_services');

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
