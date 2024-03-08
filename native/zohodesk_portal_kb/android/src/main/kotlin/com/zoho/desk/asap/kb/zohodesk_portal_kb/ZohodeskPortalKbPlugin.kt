package com.zoho.desk.asap.kb.zohodesk_portal_kb

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.kb.ZDPortalKB

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalKbPlugin */
class ZohodeskPortalKbPlugin : ZDPBaseActivityAwarePlugin("zohodesk_portal_kb") {

  override fun showMethod(activity: Activity) {
    ZDPortalKB.show(activity)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "showCategoryWithPermalink" -> showCategoryWithPermalink(call, result)
      "showArticleWithPermalink" -> showArticleWithPermalink(call, result)
      else -> super.onMethodCall(call, result)
    }
  }

  private fun showCategoryWithPermalink(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val permaLink = paramsMap?.get("permalink") as? String
      ZDPortalKB.showCategoryWithPermalink(activity, permaLink)
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun showArticleWithPermalink(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val permaLink = paramsMap?.get("permalink") as? String
      ZDPortalKB.showArticleWithPermalink(activity, permaLink)
    } catch (e:Exception) {
      result.success(false)
    }
  }
}
