
class ZDCustomizedTicketField{

  ZDCustomizedTicketField({required this.fieldName, required this.value, this.isEditable = true});

  final String fieldName;
  final String value;
  final bool isEditable;

  Map toJson() => {
    'fieldName': fieldName,
    'value': value,
    'isEditable': isEditable
  };

}