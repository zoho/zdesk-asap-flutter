import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_chat_platform_interface.dart';

/// An implementation of [ZohodeskPortalChatPlatform] that uses method channels.
class MethodChannelZohodeskPortalChat extends ZohodeskPortalChatPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_chat');

  ///ASAP Chat show channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod('show');
}
