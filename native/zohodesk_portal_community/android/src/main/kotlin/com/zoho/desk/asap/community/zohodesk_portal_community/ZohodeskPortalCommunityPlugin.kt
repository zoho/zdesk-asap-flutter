package com.zoho.desk.asap.community.zohodesk_portal_community

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.asap_community.ZDPortalCommunity
import com.zoho.desk.asap.asap_community.utils.ZDPCommunityConfiguration
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalCommunityPlugin */
class ZohodeskPortalCommunityPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_community") {
  companion object {
    private var isTopicEditAllowed = true
    private var isTopicDeleteAllowed = true
    private var isReplyAllowed = true
    private var isReplyEditAllowed = true
    private var isReplyDeleteAllowed = true
    private var isTopicDetailSearchAllowed = true
    private var disableTextReader = true
    private var disableKeySearcher = true
    private var disableTopicLike = false
    private var disableTopicComment = false
  }

  override fun showMethod(activity: Activity) {
    ZDPortalCommunity.show(activity)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "showTopicForm" -> ZDPortalCommunity.showAddTopic(activity)
      "showTopicWithPermaLink" -> showTopicWithPermaLink(call, result)
      "showTopicWithId" -> showTopicWithId(call, result)
      "disableTopicEdit" -> disableTopicEdit(call, result)
      "disableTopicDelete" -> disableTopicDelete(call, result)
      "disableReply" -> disableReply(call, result)
      "disableReplyEdit" -> disableReplyEdit(call, result)
      "disableReplyDelete" -> disableReplyDelete(call, result)
      "disableTopicDetailSearch" -> disableTopicDetailSearch(call, result)
      "disableTextReader" -> disableTextReader(call, result)
      "disableKeySearcher" -> disableKeySearcher(call, result)
      "disableTopicLike" -> disableTopicLike(call, result)
      "disableTopicComment" -> disableTopicComment(call, result)
      else -> super.onMethodCall(call, result)
    }
  }

  private fun showTopicWithId(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val topicId = paramsMap?.get("topicId") as? String
      ZDPortalCommunity.showTopicWithId(activity, topicId)
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun showTopicWithPermaLink(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val permaLink = paramsMap?.get("permalink") as? String
      ZDPortalCommunity.showTopicWithPermaLink(activity, permaLink)
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun disableTopicEdit(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isTopicEditAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTopicDelete(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isTopicDeleteAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableReply(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isReplyAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableReplyEdit(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isReplyEditAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableReplyDelete(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isReplyDeleteAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTopicDetailSearch(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isTopicDetailSearchAllowed = !isDisable
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTextReader(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableTextReader = getIsDisable(call)
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableKeySearcher(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableKeySearcher = getIsDisable(call)
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTopicLike(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableTopicLike = getIsDisable(call)
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTopicComment(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableTopicComment = getIsDisable(call)
      applyCommunityConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun getIsDisable(@NonNull call: MethodCall): Boolean {
    val paramsMap = call.arguments as? HashMap<*, *>
    return paramsMap?.get("isDisable") as? Boolean ?: false
  }

  private fun applyCommunityConfiguration() {
    ZDPortalCommunity.setConfiguration(
      ZDPCommunityConfiguration.Builder()
        .isTopicEditAllowed(isTopicEditAllowed)
        .isTopicDeleteAllowed(isTopicDeleteAllowed)
        .isReplyAllowed(isReplyAllowed)
        .isReplyEditAllowed(isReplyEditAllowed)
        .isReplyDeleteAllowed(isReplyDeleteAllowed)
        .isTopicDetailSearchAllowed(isTopicDetailSearchAllowed)
        .disableTextReader(disableTextReader)
        .disableKeySearcher(disableKeySearcher)
        .disableTopicLike(disableTopicLike)
        .disableTopicComment(disableTopicComment)
        .build()
    )
  }
}
