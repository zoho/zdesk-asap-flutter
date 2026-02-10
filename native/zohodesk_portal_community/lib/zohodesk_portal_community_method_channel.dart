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

  ///ASAP disable or enable topic edit option in Community
  @override
  Future<void> disableTopicEdit(bool isDisable) async => await methodChannel.invokeMethod('disableTopicEdit', {"isDisable": isDisable});

  ///ASAP disable or enable topic delete option in Community
  @override
  Future<void> disableTopicDelete(bool isDisable) async => await methodChannel.invokeMethod('disableTopicDelete', {"isDisable": isDisable});

  ///ASAP disable or enable reply option in Community
  @override
  Future<void> disableReply(bool isDisable) async => await methodChannel.invokeMethod('disableReply', {"isDisable": isDisable});

  ///ASAP disable or enable reply edit option in Community
  @override
  Future<void> disableReplyEdit(bool isDisable) async => await methodChannel.invokeMethod('disableReplyEdit', {"isDisable": isDisable});

  ///ASAP disable or enable reply delete option in Community
  @override
  Future<void> disableReplyDelete(bool isDisable) async => await methodChannel.invokeMethod('disableReplyDelete', {"isDisable": isDisable});

  ///ASAP disable or enable topic detail search option in Community
  @override
  Future<void> disableTopicDetailSearch(bool isDisable) async => await methodChannel.invokeMethod('disableTopicDetailSearch', {"isDisable": isDisable});

  ///ASAP disable or enable text reader option in Community
  @override
  Future<void> disableTextReader(bool isDisable) async => await methodChannel.invokeMethod('disableTextReader', {"isDisable": isDisable});

  ///ASAP disable or enable key searcher option in Community
  @override
  Future<void> disableKeySearcher(bool isDisable) async => await methodChannel.invokeMethod('disableKeySearcher', {"isDisable": isDisable});

  ///ASAP disable or enable topic share option in Community
  @override
  Future<void> disableTopicShare(bool isDisable) async => await methodChannel.invokeMethod('disableTopicShare', {"isDisable": isDisable});

  ///ASAP disable or enable topic like option in Community
  @override
  Future<void> disableTopicLike(bool isDisable) async => await methodChannel.invokeMethod('disableTopicLike', {"isDisable": isDisable});

  ///ASAP disable or enable topic comment option in Community
  @override
  Future<void> disableTopicComment(bool isDisable) async => await methodChannel.invokeMethod('disableTopicComment', {"isDisable": isDisable});
}
