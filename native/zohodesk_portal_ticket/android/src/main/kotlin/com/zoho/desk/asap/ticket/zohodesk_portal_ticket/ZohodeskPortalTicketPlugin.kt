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

/** ZohodeskPortalTicketPlugin */

class ZohodeskPortalTicketPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_ticket") {

  override fun showMethod(activity: Activity) {
    ZDPortalTickets.show(activity)
  }
}


