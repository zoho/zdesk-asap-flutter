package com.zoho.desk.asap.core.zohodesk_portal_core

data class ZDPHomeConfigurationData(
    val enableCommunity: Boolean,
    val enableHelpCenter: Boolean,
    val enableMyTicket: Boolean,
    val enableCreateTicket: Boolean,
    val enableAddTopic: Boolean,
    val showChat: Boolean,
    val showGC: Boolean,
    val showAnswerBot: Boolean,
    val showBM: Boolean,
    val enableHeaderLogo: Boolean
)
