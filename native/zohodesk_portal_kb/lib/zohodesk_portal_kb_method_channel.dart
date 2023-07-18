import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_kb_platform_interface.dart';

/// An implementation of [ZohodeskPortalKbPlatform] that uses method channels.
class MethodChannelZohodeskPortalKb extends ZohodeskPortalKbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_kb');

  ///ASAP Knowledge-base show channel method
  @override
  Future show() async {
    await methodChannel.invokeMethod('show');
  }
}
