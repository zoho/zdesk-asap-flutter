
import 'ZDTicketForm.dart';

class ZDTicketFieldsList {

  ZDTicketFieldsList({
    required this.data
  });

  List<ZDTicketField> data;

  ZDTicketFieldsList.fromJson(Map<String, dynamic> json):
      data = (json['data'] as List).map((toElement) => ZDTicketField.fromJson(toElement)).toList();

  Map toJson() => {
    'data' : data
  };

}