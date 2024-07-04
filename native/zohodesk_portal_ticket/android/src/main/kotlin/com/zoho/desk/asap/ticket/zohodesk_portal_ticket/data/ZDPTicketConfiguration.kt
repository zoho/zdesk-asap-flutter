package com.zoho.desk.asap.ticket.zohodesk_portal_ticket.data

data class ZDPTicketConfiguration (
    val isReplyAllowed: Boolean,
    val isCommentAllowed: Boolean,
    val isTicketUpdateAllowed: Boolean,
    val isCommentEditAllowed: Boolean,
    val isCommentDeleteAllowed: Boolean,
    val isAddTicketAllowed: Boolean,
    val isHappinessThreadAllowed: Boolean,
    val isTicketPropertiesAllowed: Boolean,
    val isTicketChannelAllowed: Boolean,
    val isTicketDetailSearchAllowed: Boolean,
)