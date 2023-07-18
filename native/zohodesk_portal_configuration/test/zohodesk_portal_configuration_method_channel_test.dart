import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalConfiguration platform = MethodChannelZohodeskPortalConfiguration();
  const MethodChannel channel = MethodChannel('zohodesk_portal_configuration');

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
