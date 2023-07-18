import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_core_platform_interface.dart';

/// An implementation of [ZohodeskPortalCorePlatform] that uses method channels.
class MethodChannelZohodeskPortalCore extends ZohodeskPortalCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_core');

  ///ASAP Dashboard show channel method
  @override
  Future<void> showHome() async => await methodChannel.invokeMethod('showHome');
}
