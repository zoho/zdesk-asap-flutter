
class ZDVisibleTicketField {

  ZDVisibleTicketField({required this.departmentId, required this.layoutId, required this.fieldNames });

  final String departmentId;
  final String layoutId;
  final List<String> fieldNames;

  Map toJson() => {
    'departmentId': departmentId,
    'layoutId': layoutId,
    'fieldNames': fieldNames
  };

}