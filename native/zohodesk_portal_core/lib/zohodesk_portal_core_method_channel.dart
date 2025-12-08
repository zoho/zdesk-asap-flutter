import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'zohodesk_portal_core_platform_interface.dart';
import 'common/zdphomeconfiguration.dart';
import 'common/ZDPHomeEventListener.dart';

/// An implementation of [ZohodeskPortalCorePlatform] that uses method channels.
class MethodChannelZohodeskPortalCore extends ZohodeskPortalCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_core');

  static ZDPHomeEventListener? _actionListener;
  static const _homeEventChannel = EventChannel('zohodesk_portal_core_event');
  static bool _isListening = false;

  ///ASAP Dashboard show channel method
  @override
  Future<void> showHome() async => await methodChannel.invokeMethod('showHome');

  @override
  Future<void> setConfiguration(ZDPHomeConfiguration config) async => await methodChannel.invokeMethod('setConfiguration', {'configuration': jsonEncode(config)});

  @override
  void setEventListener(ZDPHomeEventListener listener) {
    _actionListener = listener;
    if (_isListening) return;
    _isListening = true;
    _homeEventChannel.receiveBroadcastStream().listen((event) {
      switch (event["type"]) {
        case 'onBackEvent':
          _actionListener?.backButtonTapped();
          break;
        default:
          break;
      }
    });
  }
}
