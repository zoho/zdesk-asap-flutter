package com.zoho.desk.asap.apikit.zohodesk_portal_apikit

import android.content.Context
import androidx.annotation.NonNull
import com.zoho.desk.asap.api.ZDPortalCallback.LogoutCallback
import com.zoho.desk.asap.api.ZDPortalCallback.SetUserCallback
import com.zoho.desk.asap.api.ZDPortalException
import com.zoho.desk.asap.api.ZohoDeskPortalSDK
import com.zoho.desk.asap.api.ZohoDeskPortalSDK.DataCenter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.zoho.desk.asap.api.util.ZohoDeskAPIImpl

/** ZohodeskPortalApikitPlugin */
class ZohodeskPortalApikitPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var deskPortalSDK: ZohoDeskPortalSDK
  private val ERROR_PUSH_NOTIF = "101"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zohodesk_portal_apikit")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    deskPortalSDK = ZohoDeskPortalSDK.getInstance(context)
    ZohoDeskAPIImpl.setRefererHeader("flutter")
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method) {
      "initializeSDK" -> initSDK(call, result)
      "enableLogs" -> ZohoDeskPortalSDK.Logger.enableLogs()
      "disableLogs" -> ZohoDeskPortalSDK.Logger.disableLogs()
      "login" -> handleLogin(call, result)
      "logout" -> handleLogout(result)
      "enablePush" -> handlePush(call, result, true)
      "disablePush" -> handlePush(call, result, false)
      "initializeAccountsKeys" -> initAccountsKeys(call, result)
      "presentLoginScreen" -> handlePresentLoginScreen(call, result)
      "isUserSignedIn" -> isUserSignedIn(result)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun initSDK(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val orgId = paramsMap?.get("orgID") as String
      val appId = paramsMap?.get("appID") as String
      val dcVal = paramsMap?.get("dataCenter") as Int
      val dc = when(dcVal) {
        1 ->ZohoDeskPortalSDK.DataCenter.CN
        2 -> ZohoDeskPortalSDK.DataCenter.IN
        3 -> ZohoDeskPortalSDK.DataCenter.EU
        4 -> ZohoDeskPortalSDK.DataCenter.AU
        5 -> ZohoDeskPortalSDK.DataCenter.JP
        else ->   ZohoDeskPortalSDK.DataCenter.US
      }
      deskPortalSDK.initDesk(orgId.toLong(), appId, dc)

    } catch (e:Exception) {

    }
  }

  private fun handleLogin(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val jwtToken = paramsMap?.get("jwtToken") as? String
      deskPortalSDK.loginWithJWTToken(jwtToken, object : SetUserCallback{
        override fun onException(exception: ZDPortalException?) {
          result.success(false)
        }

        override fun onUserSetSuccess() {
          result.success(true)
        }

      })
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun handleLogout(@NonNull result: Result) {
    deskPortalSDK.logout(object : LogoutCallback{
      override fun onException(exception: ZDPortalException?) {
        result.success(false)
      }

      override fun onLogoutSuccess() {
        result.success(true)
      }
    })
  }

  private fun handlePush(@NonNull call: MethodCall, @NonNull result: Result, isEnable:Boolean) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val fcmToken = paramsMap?.get("fcmToken") as? String
      fcmToken?.let {_token ->
        if(isEnable)  deskPortalSDK.enablePush(_token) else deskPortalSDK.disablePush(_token)
      }
    } catch (e:Exception) {
      result.error(ERROR_PUSH_NOTIF, "Parse Error", null)
    }
  }

  private fun initAccountsKeys(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val clientId = paramsMap?.get("clientId") as? String ?: ""
      val clientSecretId = paramsMap?.get("clientSecretId") as? String ?: ""
      val portalId = paramsMap?.get("portalId") as? String ?: ""
      val redirectURI = paramsMap?.get("redirURI") as? String ?: ""
      deskPortalSDK.setAccountDetails(clientId, clientSecretId, portalId, redirectURI)
    } catch (e:Exception) {

    }
  }

  private fun handlePresentLoginScreen(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val loginViewColor = paramsMap?.get("colorString") as? String ?: "#1A7063"

      deskPortalSDK.presentLoginScreen(android.graphics.Color.parseColor(loginViewColor), object : SetUserCallback{
        override fun onException(p0: ZDPortalException?) {
          result.success(false)
        }
        override fun onUserSetSuccess() {
          result.success(true)
        }
      })
    } catch (e:Exception) {
      result.success(false)
    }

  }

  private fun isUserSignedIn(@NonNull result: Result){
    val isUserLoggedIn = deskPortalSDK.isUserSignedIn
    if(isUserLoggedIn){
      result.success(true)
    }else{
      result.success(false)
    }
  }

}
