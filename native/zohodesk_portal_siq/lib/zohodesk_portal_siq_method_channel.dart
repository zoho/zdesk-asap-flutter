import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'common/ChatComponent.dart';
import 'common/LauncherMode.dart';
import 'common/SalesIQInitCallback.dart';
import 'zohodesk_portal_siq_platform_interface.dart';

/// An implementation of [ZohodeskPortalSiqPlatform] that uses method channels.
class MethodChannelZohodeskPortalSiq extends ZohodeskPortalSiqPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_siq');
  final eventChannel = EventChannel('zohodesk_portal_siq_event_channel');

  Stream<dynamic> get messageStream async* {
    await for (dynamic message in eventChannel.receiveBroadcastStream().map((message) => message)){
      yield message;
    }
  }

  ///ASAP Chat show channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod('show');

  @override
  Future<void> setGuestUserDetails(String? name, String? email, String? phone) async => await methodChannel.invokeMethod('setGuestUserDetails', {'name': name, 'email': email, 'phone': phone});

  @override
  Future<void> setSalesIQInitCallback(SalesIQInitCallback callback) async {
    messageStream.listen((event) {
      if(event is String){
        callback.onException(event);
      }else{
        callback.onInitialized();
      }
    });
    await methodChannel.invokeMethod('setSalesIQInitCallback');
  }

  @override
  Future<void> setChatBrandDetails(String appKey, String accessKey) async => await methodChannel.invokeMethod('setChatBrandDetails', {'appKey': appKey, 'accessKey': accessKey});

  @override
  Future<void> setChatVisibility(ChatComponent component, bool visibility) async => await methodChannel.invokeMethod('setChatVisibility', {'component': component.name, 'visibility': visibility});

  @override
  Future<void> showOfflineMessage(bool isShow) async => await methodChannel.invokeMethod('showOfflineMessage', isShow);

  @override
  Future<void> hideQueueTime(bool isHide) async => await methodChannel.invokeMethod('hideQueueTime', isHide);

  @override
  Future<void> showFeedbackAfterSkip(bool isShow) async => await methodChannel.invokeMethod('showFeedbackAfterSkip', isShow);

  @override
  Future<void> enableDragToDismiss(bool isEnable) async => await methodChannel.invokeMethod('enableDragToDismiss', isEnable);

  @override
  Future<void> setKnowledgeBaseVisibility(bool visibility) async => await methodChannel.invokeMethod('setKnowledgeBaseVisibility', visibility);

  @override
  Future<void> setLoggerEnabled(bool isEnable) async => await methodChannel.invokeMethod('setLoggerEnabled', isEnable);

  @override
  Future<void> setConversationVisibility(bool visibility) async => await methodChannel.invokeMethod('setConversationVisibility', visibility);

  @override
  Future<void> setConversationTitle(String title) async => await methodChannel.invokeMethod('setConversationTitle', title);

  @override
  Future<void> setLauncherVisibility(LauncherMode visibility) async => await methodChannel.invokeMethod('setLauncherVisibility', visibility.name);

}
