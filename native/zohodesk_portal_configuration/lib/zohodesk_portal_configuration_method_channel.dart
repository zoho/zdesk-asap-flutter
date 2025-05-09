import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zohodesk_portal_configuration/data/zdp_configuration.dart';
import 'zohodesk_portal_configuration_platform_interface.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart';

/// An implementation of [ZohodeskPortalConfigurationPlatform] that uses method channels.
class MethodChannelZohodeskPortalConfiguration extends ZohodeskPortalConfigurationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_configuration');

  @override
  Future<void> setTheme(ZDPTheme theme) async => await methodChannel.invokeMethod('setTheme', {'theme': theme.rawValue});

  @override
  Future<void> handleNotification(Map<String, dynamic> map) async => await methodChannel.invokeMethod('handleNotification', {'msgMap': map});

  @override
  Future<void> setConfiguration(ZDPConfiguration configuration) async => await methodChannel.invokeMethod('setConfiguration', {'configuration': jsonEncode(configuration)});

  @override
  Future<void> setLanguage(String language) async => await methodChannel.invokeMethod('setLanguage', {'language': language});

}
