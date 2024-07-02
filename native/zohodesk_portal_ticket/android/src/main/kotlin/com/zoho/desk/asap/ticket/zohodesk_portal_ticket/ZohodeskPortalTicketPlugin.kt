package com.zoho.desk.asap.ticket.zohodesk_portal_ticket

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.asap_tickets.ZDPortalTickets
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.zoho.desk.asap.ticket.zohodesk_portal_ticket.data.ZDPTicketConfiguration
import com.google.gson.Gson

/** ZohodeskPortalTicketPlugin */

class ZohodeskPortalTicketPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_ticket") {

  override fun showMethod(activity: Activity) {
    ZDPortalTickets.show(activity)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    if(call.method == "setConfiguration") {
      setConfiguration(call)
    }else{
      super.onMethodCall(call, result)
    }
  }

  private fun setConfiguration(@NonNull call: MethodCall) {
    val paramsMap = call.arguments as? HashMap<*, *>
    val configurationData = paramsMap?.get("configuration") as? String
    val ticketConfiguration: ZDPTicketConfiguration = Gson().fromJson(configurationData, ZDPTicketConfiguration::class.java)
    ZDPortalTickets.setConfiguration(
      com.zoho.desk.asap.asap_tickets.utils.ZDPTicketConfiguration.Builder()
        .isReplyAllowed(ticketConfiguration.isReplyAllowed)
        .isCommentAllowed(ticketConfiguration.isCommentAllowed)
        .isTicketUpdateAllowed(ticketConfiguration.isTicketUpdateAllowed)
        .isCommentEditAllowed(ticketConfiguration.isCommentEditAllowed)
        .isCommentDeleteAllowed(ticketConfiguration.isCommentDeleteAllowed)
        .isAddTicketAllowed(ticketConfiguration.isAddTicketAllowed)
        .isHappinessThreadAllowed(ticketConfiguration.isHappinessThreadAllowed)
        .isTicketPropertiesAllowed(ticketConfiguration.isTicketPropertiesAllowed)
        .isTicketChannelAllowed(ticketConfiguration.isTicketChannelAllowed)
        .isTicketDetailSearchAllowed(ticketConfiguration.isTicketDetailSearchAllowed)
        .build()
    )
  }

}


