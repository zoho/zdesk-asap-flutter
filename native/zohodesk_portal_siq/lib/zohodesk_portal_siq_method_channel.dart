import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_siq_platform_interface.dart';

/// An implementation of [ZohodeskPortalSiqPlatform] that uses method channels.
class MethodChannelZohodeskPortalSiq extends ZohodeskPortalSiqPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_siq');

  ///ASAP Chat show channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod('show');
}
