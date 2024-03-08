package com.zoho.desk.asap.community.zohodesk_portal_community

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.asap_community.ZDPortalCommunity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalCommunityPlugin */
class ZohodeskPortalCommunityPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_community") {
  override fun showMethod(activity: Activity) {
    ZDPortalCommunity.show(activity)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "showTopicForm" -> ZDPortalCommunity.showAddTopic(activity)
      "showTopicWithPermaLink" -> showTopicWithPermaLink(call, result)
      "showTopicWithId" -> showTopicWithId(call, result)
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
}
