//
//  ZohoDeskPortalCoreEvents.swift
//  zohodesk_portal_ticket
//
//  Created by Vinoth N on 06/12/25.
//

import Flutter
import ZohoDeskPortalCore

class HomeProviderStreamHandler: NSObject, FlutterStreamHandler, ZDPHomeProviderDelegate {
    
    var eventSink: FlutterEventSink?

    // FlutterStreamHandler methods
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }

    func backButtonTapped() {
        eventSink?(["type": "onBackEvent"])
    }
}
