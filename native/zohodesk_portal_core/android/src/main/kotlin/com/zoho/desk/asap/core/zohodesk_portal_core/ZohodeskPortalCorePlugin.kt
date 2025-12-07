package com.zoho.desk.asap.core.zohodesk_portal_core

import android.app.Activity
import androidx.annotation.NonNull
import com.google.gson.Gson
import com.zoho.desk.asap.ZDPHomeConfiguration
import com.zoho.desk.asap.utils.ZDPHomeBackButtonListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.zoho.desk.asap.ZDPortalHome

/** ZohodeskPortalCorePlugin */
class ZohodeskPortalCorePlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware, EventChannel.StreamHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var eventChannel: EventChannel
  private var eventSink: EventChannel.EventSink? = null
  protected var activity : Activity? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_core")
    channel.setMethodCallHandler(this)
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_core_event")
    eventChannel.setStreamHandler(this)

    setEventListener()
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    when(call.method) {
      "showHome" -> activity?.let {
        ZDPortalHome.show(activity)
      } ?: kotlin.run { result.notImplemented() }
      "setConfiguration" -> setConfiguration(call)
      else -> result.notImplemented()
    }
  }

  private fun setEventListener() {
      ZDPortalHome.setZDPHomeBackButtonListener(object : ZDPHomeBackButtonListener {
          override fun backButtonTapped() {
              eventSink?.success(mapOf("type" to "onBackEvent"))
          }
      })
  }

  private fun setConfiguration(call: MethodCall) {
    val paramsMap = call.arguments as? HashMap<*, *>
    val configurationData = paramsMap?.get("configuration") as? String
    if (configurationData != null) {
        val config: ZDPHomeConfigurationData = Gson().fromJson(configurationData, ZDPHomeConfigurationData::class.java)
        val homeConfigBuilder = ZDPHomeConfiguration.Builder()
            .isKBEnabled(config.enableHelpCenter)
            .isCommunityEnabled(config.enableCommunity)
            .isSubmitTicketEnabled(config.enableCreateTicket)
            .isAddTopicEnabled(config.enableAddTopic)
            .isMyTicketsEnabled(config.enableMyTicket)
            .isLiveChatEnabled(config.showChat)
            .isChatBotEnabled(config.showGC)
            .isAnswerBotEnabled(config.showAnswerBot)
            .isBMEnabled(config.showBM)
            .isHeaderLogoEnabled(config.enableHeaderLogo)
        ZDPortalHome.setConfiguration(homeConfigBuilder.build())
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    eventChannel.setStreamHandler(null)
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

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }
}
