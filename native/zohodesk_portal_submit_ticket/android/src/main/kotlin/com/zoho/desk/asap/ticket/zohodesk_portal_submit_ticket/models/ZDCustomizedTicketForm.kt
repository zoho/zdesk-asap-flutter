package com.zoho.desk.asap.ticket.zohodesk_portal_submit_ticket.models

data class ZDCustomizedTicketForm(
    val departmentId: String,
    val layoutId: String,
    val customizedTicketFields: List<ZDCustomizedTicketField>
)