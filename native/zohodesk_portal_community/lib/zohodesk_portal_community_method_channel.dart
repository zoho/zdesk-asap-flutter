import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zohodesk_portal_community_platform_interface.dart';

/// An implementation of [ZohodeskPortalCommunityPlatform] that uses method channels.
class MethodChannelZohodeskPortalCommunity extends ZohodeskPortalCommunityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_community');

  ///ASAP show Community channel method
  @override
  Future<void> show() async => await methodChannel.invokeMethod('show');

  ///ASAP show Community topic form channel method
  @override
  Future<void> showTopicForm() async => await methodChannel.invokeMethod('showTopicForm');

  ///ASAP show Community topic with Topic permalink
  @override
  Future<void> showTopicWithPermaLink(String permalink) async => await methodChannel.invokeMethod('showTopicWithPermaLink', {"permalink": permalink});

  ///ASAP show Community topic with Topic Id
  @override
  Future<void> showTopicWithId(String topicId) async => await methodChannel.invokeMethod('showTopicWithId', {"topicId": topicId});
}
