package com.zoho.desk.asap.gc.zohodesk_portal_gc

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.livechat.ZDPortalLiveChat

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalGcPlugin */
class ZohodeskPortalGcPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity : Activity? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_gc")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if(activity == null){
      result.notImplemented()
    }
    when(call.method) {
      "showGC" -> showGC(call, result)
      "showKBBot" -> showKBBot(call, result)
      "showBMChat" -> showBMChat(call, result)
      "setGCSessionVariable" -> setGCSessionVariable(call, result)
      "updateGCSessionVariable" -> updateGCSessionVariable(call, result)
      "setBMSessionVariable" -> setBMSessionVariable(call, result)
      "updateBMSessionVariable" -> updateBMSessionVariable(call, result)

      else -> result.notImplemented()
    }
  }

  private fun showGC(@NonNull call: MethodCall, @NonNull result: Result){
    ZDPortalLiveChat.showGC(activity)
  }

  private fun showKBBot(@NonNull call: MethodCall, @NonNull result: Result){
    ZDPortalLiveChat.showAnswerBot(activity)
  }

  private fun showBMChat(@NonNull call: MethodCall, @NonNull result: Result){
    ZDPortalLiveChat.showBusinessMessenger(activity)
  }

  private fun setGCSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? HashMap<*, *>
    val variableName = paramsMap?.get("variableName") as? String
    val variableValue = paramsMap?.get("updatedValue") as? String
    ZDPortalLiveChat.setGCSessionVariable(activity, arrayListOf(hashMapOf(variableName to variableValue)))
  }

  private fun updateGCSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? HashMap<*, *>
    val variableName = paramsMap?.get("variableName") as? String
    val variableValue = paramsMap?.get("updatedValue") as? String
    ZDPortalLiveChat.updateGCSessionVariable(activity, arrayListOf(hashMapOf(variableName to variableValue)))
  }

  private fun setBMSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? HashMap<*, *>
    val variableName = paramsMap?.get("variableName") as? String
    val variableValue = paramsMap?.get("updatedValue") as? String
    ZDPortalLiveChat.setBMSessionVariable(activity, arrayListOf(hashMapOf(variableName to variableValue)))
  }

  private fun updateBMSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? HashMap<*, *>
    val variableName = paramsMap?.get("variableName") as? String
    val variableValue = paramsMap?.get("updatedValue") as? String
    ZDPortalLiveChat.updateBMSessionVariable(activity, arrayListOf(hashMapOf(variableName to variableValue)))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
}
