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
      else -> super.onMethodCall(call, result)
    }
  }
}
