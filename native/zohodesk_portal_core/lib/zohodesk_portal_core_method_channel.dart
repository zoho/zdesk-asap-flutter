import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'zohodesk_portal_core_platform_interface.dart';
import 'data/zdphomeconfiguration.dart';

/// An implementation of [ZohodeskPortalCorePlatform] that uses method channels.
class MethodChannelZohodeskPortalCore extends ZohodeskPortalCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_core');

  ///ASAP Dashboard show channel method
  @override
  Future<void> showHome() async => await methodChannel.invokeMethod('showHome');

  @override
  Future<void> setConfiguration(ZDPHomeConfiguration config) async => await methodChannel.invokeMethod('setConfiguration', {'configuration': jsonEncode(config)});
}
