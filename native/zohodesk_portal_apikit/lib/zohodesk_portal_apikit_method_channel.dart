import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart';

import 'zohodesk_portal_apikit_platform_interface.dart';

/// An implementation of [ZohodeskPortalApikitPlatform] that uses method channels.
class MethodChannelZohodeskPortalApikit extends ZohodeskPortalApikitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_apikit');

  ///ASAP Initialise SDK channel method
  @override
  Future<void> initializeSDK(String orgID, String appID, [ZDPDataCenter? dataCenter]) async {
    await methodChannel.invokeMethod("initializeSDK", {"orgID": orgID, "appID": appID, "dataCenter": (dataCenter ?? ZDPDataCenter.US).rawValue});
  }

  ///ASAP login channel method
  @override
  Future<bool> login(String jwtToken) async => await methodChannel.invokeMethod('login', {"jwtToken": jwtToken});

  ///ASAP logout channel method
  @override
  Future<bool> logout() async => await methodChannel.invokeMethod('logout');

  ///ASAP disable logs channel method
  @override
  Future<void> enableLogs() async => await methodChannel.invokeMethod('enableLogs');

  ///ASAP enable push notification method
  @override
  Future<void> enablePush(String fcmToken) async => await methodChannel.invokeMethod('enablePush', {"fcmToken": fcmToken});

  ///ASAP disable push notification method
  @override
  Future<void> disablePush(String fcmToken) async => await methodChannel.invokeMethod('disablePush',  {"fcmToken": fcmToken});

  ///ASAP Initialise accounts keys channel method
  @override
  Future<void> initializeAccountsKeys(String clientId, String clientSecretId, String portalId, String redirURI) async {
    await methodChannel.invokeMethod("initializeAccountsKeys", {"clientId": clientId, "clientSecretId": clientSecretId, "portalId": portalId, "redirURI":redirURI});
  }

  ///ASAP presentloginscreen channel method
  @override
  Future<bool> presentLoginScreen(String colorString) async => await methodChannel.invokeMethod('presentLoginScreen', {"colorString": colorString});

}
