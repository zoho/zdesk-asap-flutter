package com.zoho.desk.asap.siq.zohodesk_portal_siq

import android.app.Activity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.zoho.desk.asap.siq.ZohoDeskPortalSalesIQ
import com.zoho.desk.asap.siq.Component
import com.zoho.desk.asap.siq.LauncherMode
import com.zoho.desk.asap.siq.SalesIQInitCallback
import com.google.gson.Gson
import com.zoho.desk.asap.siq.ZDPortalChatUser
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

/** ZohodeskPortalSiqPlugin */
class ZohodeskPortalSiqPlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware, EventChannel.StreamHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  protected var activity : Activity? = null
  private lateinit var eventChannel : EventChannel
  private var eventSink: EventChannel.EventSink? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_siq")
    channel.setMethodCallHandler(this)
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_siq_event_channel");
    eventChannel.setStreamHandler(this)
  }

  override fun onCancel(p0: Any?) {
    eventSink = null
  }

  override fun onListen(p0: Any?, sink: EventChannel.EventSink) {
    eventSink = sink
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    when(call.method) {
      "show" -> showSalesIQ(call, result)
      "setGuestUserDetails" -> setGuestUserDetails(call, result)
      "setSalesIQInitCallback" -> setSalesIQInitCallback(call, result)
      "setChatBrandDetails" -> setChatBrandDetails(call, result)
      "setChatVisibility" -> setChatVisibility(call, result)
      "showOfflineMessage" -> showOfflineMessage(call, result)
      "hideQueueTime" -> hideQueueTime(call, result)
      "showFeedbackAfterSkip" -> showFeedbackAfterSkip(call, result)
      "enableDragToDismiss" -> enableDragToDismiss(call, result)
      "setKnowledgeBaseVisibility" -> setKnowledgeBaseVisibility(call, result)
      "setLoggerEnabled" -> setLoggerEnabled(call, result)
      "setConversationVisibility" -> setConversationVisibility(call, result)
      "setConversationTitle" -> setConversationTitle(call, result)
      "setLauncherVisibility" -> setLauncherVisibility(call, result)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    eventSink = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  private fun showSalesIQ(call: MethodCall, result: MethodChannel.Result) {
    activity?.let{
      ZohoDeskPortalSalesIQ.show(activity)
    }
  }

  private fun setSalesIQInitCallback(call: MethodCall, result: MethodChannel.Result) {
    ZohoDeskPortalSalesIQ.setSalesIQInitCallback(object: SalesIQInitCallback{
      override fun onInitialized() {
        eventSink?.success(true)
      }

      override fun onException(errorCode: Int, errorMessage: String?) {
        eventSink?.success(errorMessage)
      }
    })
  }

  private fun setGuestUserDetails(call: MethodCall, result: MethodChannel.Result) {
    val paramsMap = call.arguments as? HashMap<String, Any>
    val name = paramsMap?.get("name") as? String?
    val email = paramsMap?.get("email") as? String?
    val phone = paramsMap?.get("phone") as? String?
    val userDetails = ZDPortalChatUser()
    userDetails.name = name
    userDetails.phone = phone
    userDetails.email = email
    ZohoDeskPortalSalesIQ.setGuestUserDetails(userDetails)
  }

  private fun setChatBrandDetails(call: MethodCall, result: MethodChannel.Result) {
    val paramsMap = call.arguments as? HashMap<String, Any>
    val appKey = paramsMap?.get("appKey") as? String?
    val accessKey = paramsMap?.get("accessKey") as? String?

    ZohoDeskPortalSalesIQ.setChatBrandDetails(activity, appKey, accessKey)
  }

  private fun setChatVisibility(call: MethodCall, result: MethodChannel.Result) {
    val paramsMap = call.arguments as? HashMap<String, Any>
    val component = paramsMap?.get("component") as? String?
    val isVisible = paramsMap?.get("visibility") as? Boolean?
    if(component != null && isVisible != null){
      ZohoDeskPortalSalesIQ.setChatVisibility(Component.valueOf(component), isVisible)
    }
  }

  private fun showOfflineMessage(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { isShow ->
      ZohoDeskPortalSalesIQ.showOfflineMessage(isShow)
    }
  }

  private fun hideQueueTime(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { isAllow ->
      ZohoDeskPortalSalesIQ.hideQueueTime(isAllow)
      result.success(true)
    }
  }

  private fun showFeedbackAfterSkip(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { isShow ->
      ZohoDeskPortalSalesIQ.showFeedbackAfterSkip(isShow)
    }
  }

  private fun enableDragToDismiss(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { isEnable ->
      ZohoDeskPortalSalesIQ.enableDragToDismiss(isEnable)
    }
  }

  private fun setKnowledgeBaseVisibility(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { visibility ->
      ZohoDeskPortalSalesIQ.setKnowledgeBaseVisibility(visibility)
    }
  }

  private fun setLoggerEnabled(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { isEnable ->
      ZohoDeskPortalSalesIQ.setLoggerEnabled(isEnable)
    }
  }

  private fun setConversationVisibility(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? Boolean?)?.let { visibility ->
      ZohoDeskPortalSalesIQ.setConversationVisibility(visibility)
    }
  }

  private fun setConversationTitle(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? String?)?.let { title ->
      ZohoDeskPortalSalesIQ.setConversationTitle(title)
    }
  }

  private fun setLauncherVisibility(call: MethodCall, result: MethodChannel.Result) {
    (call.arguments as? String?)?.let { visibility ->
      ZohoDeskPortalSalesIQ.setLauncherVisibility(LauncherMode.valueOf(visibility))
    }
  }
}
