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
import kotlin.reflect.javaType
import kotlin.reflect.typeOf
import com.google.gson.Gson
import com.zoho.desk.asap.asap_tickets.utils.PreFillTicketField
import com.zoho.desk.asap.ticket.zohodesk_portal_submit_ticket.models.ZDCustomizedTicketForm
import com.zoho.desk.asap.ticket.zohodesk_portal_submit_ticket.models.ZDVisibleTicketField
import com.zoho.desk.asap.ticket.zohodesk_portal_submit_ticket.models.ZDCustomizedTicketField

/** ZohodeskPortalSubmitTicketPlugin */
class ZohodeskPortalSubmitTicketPlugin: ZDPBaseActivityAwarePlugin("zohodesk_portal_submit_ticket") {
    override fun showMethod(activity: Activity) {
        ZDPortalSubmitTicket.show(activity)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when(call.method) {
            "preFillTicketFields" -> preFillTicketFields(call, result)
            "setTicketsFieldsListTobeShown" -> setTicketsFieldsListTobeShown(call, result)
            else -> super.onMethodCall(call, result)
        }
    }

    fun preFillTicketFields(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val paramsMap = call.arguments as? HashMap<*, *>
        val fieldsData = paramsMap?.get("customizedTicketForms") as? String
        val prefilledTicketFields: Array<ZDCustomizedTicketForm> = Gson().fromJson(fieldsData, Array<ZDCustomizedTicketForm>::class.java)
        prefilledTicketFields.forEach { ticketForm ->
            val preFillTicketFiledList = mutableListOf<PreFillTicketField>()
            ticketForm.customizedTicketFields.forEach { ticketField ->
                preFillTicketFiledList.add(PreFillTicketField(ticketField.fieldName, ticketField.value, ticketField.isEditable))
            }
            ZDPortalSubmitTicket.preFillTicketFields(preFillTicketFiledList , ticketForm.departmentId, ticketForm.layoutId)
        }
    }

    fun setTicketsFieldsListTobeShown(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val paramsMap = call.arguments as? HashMap<*, *>
        val fieldsData = paramsMap?.get("visibleTicketFields") as? String
        val visibleTicketFields: Array<ZDVisibleTicketField> = Gson().fromJson(fieldsData, Array<ZDVisibleTicketField>::class.java)
        visibleTicketFields.forEach { ticketForm ->
            ZDPortalSubmitTicket.setTicketsFieldsListTobeShown( ticketForm.fieldNames, ticketForm.departmentId, ticketForm.layoutId)
        }
    }


}
