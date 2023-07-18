import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zohodesk_portal_community/zohodesk_portal_community_method_channel.dart';

void main() {
  MethodChannelZohodeskPortalCommunity platform = MethodChannelZohodeskPortalCommunity();
  const MethodChannel channel = MethodChannel('zohodesk_portal_community');

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
