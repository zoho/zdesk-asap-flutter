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
}
