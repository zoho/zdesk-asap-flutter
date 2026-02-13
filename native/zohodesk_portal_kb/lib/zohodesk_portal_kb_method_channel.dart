import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'model/kb_configuration_model.dart';
import 'zohodesk_portal_kb_platform_interface.dart';

/// An implementation of [ZohodeskPortalKbPlatform] that uses method channels.
class MethodChannelZohodeskPortalKb extends ZohodeskPortalKbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_kb');

  ///ASAP Knowledge-base show channel method
  @override
  Future show() async {
    await methodChannel.invokeMethod('show');
  }

  ///ASAP show KB category with permalink
  @override
  Future<void> showCategoryWithPermalink(String permalink) async => await methodChannel.invokeMethod('showCategoryWithPermalink', {"permalink": permalink});

  ///ASAP show KB article with permalink
  @override
  Future<void> showArticleWithPermalink(String permalink) async => await methodChannel.invokeMethod('showArticleWithPermalink', {"permalink": permalink});

  ///ASAP disable article detail search
  @override
  Future<void> disableArticleDetailSearch(bool isDisable) async => await methodChannel.invokeMethod('disableArticleDetailSearch', {"isDisable": isDisable});

  ///ASAP disable article like
  @override
  Future<void> disableArticleLike(bool isDisable) async => await methodChannel.invokeMethod('disableArticleLike', {"isDisable": isDisable});

  ///ASAP disable article dislike
  @override
  Future<void> disableArticleDislike(bool isDisable) async => await methodChannel.invokeMethod('disableArticleDislike', {"isDisable": isDisable});

  ///ASAP disable text reader
  @override
  Future<void> disableTextReader(bool isDisable) async => await methodChannel.invokeMethod('disableTextReader', {"isDisable": isDisable});

  ///ASAP share article allowed
  @override
  Future<void> isShareArticleAllowed(bool isAllowed) async => await methodChannel.invokeMethod('isShareArticleAllowed', {"isAllowed": isAllowed});

  ///ASAP disable key searcher
  @override
  Future<void> disableKeySearcher(bool isDisable) async => await methodChannel.invokeMethod('disableKeySearcher', {"isDisable": isDisable});

  ///ASAP set related article preference
  @override
  Future<void> relatedArticlePreference(ZDPRelatedArticlePreference preference) async => await methodChannel.invokeMethod('relatedArticlePreference', {"preference": preference.rawValue});

  ///ASAP set search preference
  @override
  Future<void> searchPreference(ZDPSearchPreference preference) async => await methodChannel.invokeMethod('searchPreference', {"preference": preference.rawValue});
}
