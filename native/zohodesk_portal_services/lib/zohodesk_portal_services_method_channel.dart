import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_services_platform_interface.dart';

/// An implementation of [ZohodeskPortalServicesPlatform] that uses method channels.
class MethodChannelZohodeskPortalServices extends ZohodeskPortalServicesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_services');
}
