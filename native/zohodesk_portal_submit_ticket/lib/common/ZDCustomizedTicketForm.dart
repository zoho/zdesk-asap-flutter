
import 'ZDCustomizedTicketField.dart';

class ZDCustomizedTicketForm {

  ZDCustomizedTicketForm({required this.departmentId, required this.layoutId, required this.customizedTicketFields });

  final String departmentId;
  final String layoutId;
  final List<ZDCustomizedTicketField> customizedTicketFields;

  Map toJson() => {
    'departmentId': departmentId,
    'layoutId': layoutId,
    'customizedTicketFields': customizedTicketFields
  };

}