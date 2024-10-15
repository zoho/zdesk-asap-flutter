package com.zoho.desk.asap.configuration.zohodesk_portal_configuration

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context
import androidx.annotation.DrawableRes
import com.google.gson.Gson
import com.zoho.desk.asap.common.ZDPortalConfiguration
import com.zoho.desk.asap.common.utils.DeskCommonUtil
import com.zoho.desk.asap.common.utils.ZDPThemeType
import com.zoho.desk.asap.configuration.zohodesk_portal_configuration.ZDPCommonConfiguration
import com.zoho.desk.asap.common.utils.ZDPConfiguration

/** ZohodeskPortalConfigurationPlugin */
class ZohodeskPortalConfigurationPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context
  private val ERROR_PUSH_NOTIF = "101"

  companion object {
    private var darkThemeBuilder: ZDPTheme? = null
    private var lightThemeBuilder: ZDPTheme? = null
    private var notificationIcon: Int? = null
    fun setThemeBuilder(theme: ZDPTheme) {
      if(theme.isDarkMode) darkThemeBuilder = theme else lightThemeBuilder = theme
    }

    fun setNotificationIcon(@DrawableRes icon:Int) {
      notificationIcon = icon
    }
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_configuration")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method) {
      "setTheme" -> handleSetTheme(call)
      "handleNotification" -> handleNotif(call, result)
      "setConfiguration" -> setConfiguration(call)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun handleSetTheme(@NonNull call: MethodCall) {
    val gson = Gson()
    val paramsMap = call.arguments as? HashMap<*, *>
    val themeType = when(paramsMap?.get("theme") as Int) {
      1 -> ZDPThemeType.DARK
      0 -> ZDPThemeType.LIGHT
      else -> ZDPThemeType.SYSTEM
    }
    ZDPortalConfiguration.setThemeType(themeType);
    lightThemeBuilder?.let { lightTheme ->
      ZDPortalConfiguration.setThemeBuilder(gson.fromJson(gson.toJson(lightTheme), com.zoho.desk.asap.common.utils.ZDPTheme::class.java))
    }
    darkThemeBuilder?.let { darkTheme ->
      ZDPortalConfiguration.setThemeBuilder(gson.fromJson(gson.toJson(darkTheme), com.zoho.desk.asap.common.utils.ZDPTheme::class.java))
    }
  }

  private fun handleNotif(@NonNull call: MethodCall,  @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val msgMap = paramsMap?.get("msgMap") as? Map<String, Any>
      notificationIcon?.let { _icon ->
        ZDPortalConfiguration.handleNotification(context, msgMap, _icon)
      } ?: kotlin.run {
        result.error(ERROR_PUSH_NOTIF, "Notification Icon is not set yet.", null)
      }
    } catch (e:Exception) {
      result.error(ERROR_PUSH_NOTIF, "Parse Error", null)
    }
  }

  private fun setConfiguration(@NonNull call: MethodCall) {
    val paramsMap = call.arguments as? HashMap<*, *>
    val configurationData = paramsMap?.get("configuration") as? String
    val zdpConfiguration: ZDPCommonConfiguration = Gson().fromJson(configurationData, ZDPCommonConfiguration::class.java)
    ZDPortalConfiguration.setConfiguration(
      ZDPConfiguration.Builder()
        .isSideMenuEnabled(zdpConfiguration.isSideMenuEnabled)
        .isLangChooserEnabled(zdpConfiguration.isLangChooserEnabled)
        .isPoweredByFooterEnabled(zdpConfiguration.isPoweredByFooterEnabled)
        .isGlobalSearchEnabled(zdpConfiguration.isGlobalSearchEnabled)
        .isKBEnabled(zdpConfiguration.isKBEnabled)
        .isCommunityEnabled(zdpConfiguration.isCommunityEnabled)
        .isSubmitTicketEnabled(zdpConfiguration.isSubmitTicketEnabled)
        .isAddTopicEnabled(zdpConfiguration.isAddTopicEnabled)
        .isMyTicketsEnabled(zdpConfiguration.isMyTicketsEnabled)
        .isLiveChatEnabled(zdpConfiguration.isSiqEnabled)
        .isChatBotEnabled(zdpConfiguration.isGCEnabled)
        .isAnswerBotEnabled(zdpConfiguration.isAnswerBotEnabled)
        .isBusinessMessengerEnabled(zdpConfiguration.isBMEnabled)
        .isAttachmentDownloadEnabled(zdpConfiguration.isAttachmentDownloadEnabled)
        .isAttachmentUploadEnabled(zdpConfiguration.isAttachmentUploadEnabled)
        .isInArticleSearchEnabled(zdpConfiguration.isSideMenuEnabled)
        .isTextToSpeechEnabled(zdpConfiguration.isSideMenuEnabled)
        .isModuleBasedSearchEnabled(zdpConfiguration.isModuleBasedSearchEnabled)
        .build()
    )
    ZDPortalConfiguration.disableCutCopy(zdpConfiguration.disableCutCopy)
    ZDPortalConfiguration.disableScreenShot(zdpConfiguration.disableScreenShot)
  }

}
