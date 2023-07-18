package com.zoho.desk.asap.ticket.zohodesk_portal_submit_ticket

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.asap_tickets.ZDPortalSubmitTicket

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalSubmitTicketPlugin */
class ZohodeskPortalSubmitTicketPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_submit_ticket") {
  override fun showMethod(activity: Activity) {
    ZDPortalSubmitTicket.show(activity)
  }
}
