import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_chatkit_platform_interface.dart';

/// An implementation of [ZohodeskPortalChatKitPlatform] that uses method channels.
class MethodChannelZohodeskPortalChatKit extends ZohodeskPortalChatKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_chatkit');

  /// ASAP ChatKit showGC channel method
  @override
  Future<void> showGC() async {
    await methodChannel.invokeMethod('showGC');
  }

  /// ASAP ChatKit showAnswerBot channel method
  @override
  Future<void> showAnswerBot() async {
    await methodChannel.invokeMethod('showAnswerBot');
  }

  /// ASAP ChatKit showBMBot channel method
  @override
  Future<void> showBM() async {
    await methodChannel.invokeMethod('showBM');
  }

  /// ASAP ChatKit GC set session variable channel method
  @override
  Future<void> setGCSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('setGCSessionVariable', sessionVariables);
  }

  /// ASAP ChatKit GC update session variable channel method
  @override
  Future<void> updateGCSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('updateGCSessionVariable', sessionVariables);
  }

  /// ASAP ChatKit BM set session variable channel method
  @override
  Future<void> setBMSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('setBMSessionVariable', sessionVariables);
  }

  /// ASAP ChatKit BM update session variable channel method
  @override
  Future<void> updateBMSessionVariable(List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('updateBMSessionVariable', sessionVariables);
  }

  /// ASAP ChatKit GC clear data channel method
  @override
  Future<void> clearGCData() async {
    await methodChannel.invokeMethod('clearGCData');
  }

  /// ASAP ChatKit BM clear data channel method
  @override
  Future<void> clearBMData() async {
    await methodChannel.invokeMethod('clearBMData');
  }

  /// ASAP ChatKit AnswerBot clear data channel method
  @override
  Future<void> clearAnswerBotData() async {
    await methodChannel.invokeMethod('clearAnswerBotData');
  }
}
