import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_gc_platform_interface.dart';

/// An implementation of [ZohodeskPortalGcPlatform] that uses method channels.
class MethodChannelZohodeskPortalGc extends ZohodeskPortalGcPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_gc');

  /// ASAP GC showGC channel method
  @override
  Future<void> showGC() async {
    await methodChannel.invokeMethod('showGC');
  }

  /// ASAP GC showKBBot channel method
  @override
  Future<void> showKBBot() async {
    await methodChannel.invokeMethod('showKBBot');
  }

  /// ASAP GC showKBBot channel method
  @override
  Future<void> showBMChat() async {
    await methodChannel.invokeMethod('showBMChat');
  }

  /// ASAP GC set session variable channel method
  @override
  Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('setGCSessionVariable', sessionVariables);
  }

  /// ASAP GC update session variable channel method
  @override
  Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('updateGCSessionVariable', sessionVariables);
  }

  /// ASAP BM set session variable channel method
  @override
  Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('setBMSessionVariable', sessionVariables);
  }

  /// ASAP BM update session variable channel method
  @override
  Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('updateBMSessionVariable', sessionVariables);
  }
}
