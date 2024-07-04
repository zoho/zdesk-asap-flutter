import Flutter
import UIKit
import ZohoDeskPortalTicket
import ZohoDeskPortalAPIKit
import zohodesk_portal_apikit

public class ZohodeskPortalSubmitTicketPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "zohodesk_portal_submit_ticket", binaryMessenger: registrar.messenger())
        let instance = ZohodeskPortalSubmitTicketPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        let arguments: [String: Any]? = call.arguments as? [String: Any]
        
        switch ZDPSubmitTicketAPIs(rawValue: call.method) {
        case .show:
            ZDPortalSubmitTicket.show()
        case .preFillTicketFields:
            preFillTicketFields(arguments: arguments)
        case .ticketFieldsVisibility:
            setTicketFieldsVisibility(arguments: arguments)
        default:
            break
        }
    }
    
    private func preFillTicketFields(arguments: [String: Any]?) {
        guard let formsJSON = arguments?["customizedTicketForms"] as? String else {
            return
        }
        if let ticketForms: [ZDFCustomizedTicketForm] = formsJSON.parser() {
            ZDPortalSubmitTicket.preFillTicketFields(forForms: [ZDCustomizedTicketForm](forms: ticketForms))
        }
        
    }
    
    private func setTicketFieldsVisibility(arguments: [String: Any]?) {
        guard let fieldsJSON = arguments?["visibleTicketFields"] as? String else {
            return
        }
        
        if let visibleTicketFields: [ZDFVisibleTicketField] = fieldsJSON.parser() {
            ZDPortalSubmitTicket.setFieldsListTobeShown(fields: [ZDVisibleTicketField](fields: visibleTicketFields))
        }
    }

    private enum ZDPSubmitTicketAPIs: String {
        case show
        case preFillTicketFields
        case ticketFieldsVisibility = "setTicketsFieldsListTobeShown"
    }
}

private class ZDFCustomizedTicketField: Decodable {
    var fieldName: String
    var value: String
    var isEditable: Bool
}

private class ZDFCustomizedTicketForm: Decodable {
    var departmentId: String
    var layoutId: String
    var customizedTicketFields: [ZDFCustomizedTicketField]
}

private class ZDFVisibleTicketField: Decodable {
    
    var departmentId: String
    var layoutId: String
    var fieldNames: [String]
}

private extension Array where Element == ZDCustomizedTicketField {
    init(fields: [ZDFCustomizedTicketField]) {
        self.init()
        fields.forEach { field in
            self.append(ZDCustomizedTicketField(fieldName: field.fieldName, value: field.value, isEditable: field.isEditable))
        }
    }
}

private extension Array where Element == ZDCustomizedTicketForm {
    init(forms: [ZDFCustomizedTicketForm]) {
        self.init()
        forms.forEach { form in
            self.append(ZDCustomizedTicketForm(departmentId: form.departmentId, layoutId: form.layoutId, fields: Array<ZDCustomizedTicketField>(fields: form.customizedTicketFields)))
        }
    }
}

private extension Array where Element == ZDVisibleTicketField {
    init(fields: [ZDFVisibleTicketField]) {
        self.init()
        fields.forEach { ticketField in
            self.append(ZDVisibleTicketField(departmentId: ticketField.departmentId, layoutId: ticketField.layoutId, fieldNames: ticketField.fieldNames))
        }
    }
}
