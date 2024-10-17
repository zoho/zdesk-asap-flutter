package com.zoho.desk.asap.chatkit.zohodesk_portal_chatkit

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.chatkit.ZohoDeskPortalChatKit

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.ArrayList

/** ZohodeskPortalGcPlugin */
class ZohodeskPortalChatKitPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity : Activity? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_chatkit")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if(activity == null){
      result.notImplemented()
    }
    when(call.method) {
      "showGC" -> showGC(call, result)
      "showAnswerBot" -> showAnswerBot(call, result)
      "showBM" -> showBM(call, result)
      "setGCSessionVariable" -> setGCSessionVariable(call, result)
      "updateGCSessionVariable" -> updateGCSessionVariable(call, result)
      "setBMSessionVariable" -> setBMSessionVariable(call, result)
      "updateBMSessionVariable" -> updateBMSessionVariable(call, result)

      else -> result.notImplemented()
    }
  }

  private fun showGC(@NonNull call: MethodCall, @NonNull result: Result){
    ZohoDeskPortalChatKit.showGC(activity)
  }

  private fun showAnswerBot(@NonNull call: MethodCall, @NonNull result: Result){
    ZohoDeskPortalChatKit.showAnswerBot(activity)
  }

  private fun showBM(@NonNull call: MethodCall, @NonNull result: Result){
    ZohoDeskPortalChatKit.showBM(activity)
  }

  private fun setGCSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? ArrayList<HashMap<String, Any>>
    ZohoDeskPortalChatKit.setGCSessionVariable(activity, paramsMap)
  }

  private fun updateGCSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? ArrayList<HashMap<String, Any>>
    ZohoDeskPortalChatKit.updateGCSessionVariable(activity, paramsMap)
  }

  private fun setBMSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? ArrayList<HashMap<String, Any>>
    ZohoDeskPortalChatKit.setBMSessionVariable(activity, paramsMap)
  }

  private fun updateBMSessionVariable(@NonNull call: MethodCall, @NonNull result: Result){
    val paramsMap = call.arguments as? ArrayList<HashMap<String, Any>>
    ZohoDeskPortalChatKit.updateBMSessionVariable(activity, paramsMap)
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
