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
import ZDCustomizedTicketForm
import ZDVisibleTicketField
import ZDCustomizedTicketField

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

    @OptIn(ExperimentalStdlibApi::class)
    fun preFillTicketFields(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {

        val paramsMap = call.arguments as? HashMap<*, *>

        val fieldsData = paramsMap?.get("customizedTicketForms") as? String

        val prefilledTicketFields: List<ZDCustomizedTicketForm> = Gson().fromJson(fieldsData, typeOf<List<ZDCustomizedTicketForm>>().javaType)

        prefilledTicketFields.forEach { ticketForm ->

            val preFillTicketFiledList = mutableListOf<PreFillTicketField>()

            ticketForm.customizedTicketFields.forEach { ticketField ->
                preFillTicketFiledList.add(PreFillTicketField(ticketField.fieldName, ticketField.value, ticketField.isEditable))
            }

            ZDPortalSubmitTicket.preFillTicketFields(preFillTicketFiledList , ticketForm.departmentId, ticketForm.layoutId)
        }
    }

    @OptIn(ExperimentalStdlibApi::class)
    fun setTicketsFieldsListTobeShown(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {

        val paramsMap = call.arguments as? HashMap<*, *>

        val fieldsData = paramsMap?.get("visibleTicketFields") as? String

        val visibleTicketFields: List<ZDVisibleTicketField> = Gson().fromJson(fieldsData, typeOf<List<ZDVisibleTicketField>>().javaType)

        visibleTicketFields.forEach { ticketForm ->

            ZDPortalSubmitTicket.setTicketsFieldsListTobeShown( ticketForm.fieldNames, ticketForm.departmentId, ticketForm.layoutId)

        }
    }


}
