import 'package:zohodesk_portal_apikit/model/ZDLayout.dart';

import '../model/ZDDepartment.dart';
import '../model/ZDTicketFieldsList.dart';
import '../model/ZDTicketForm.dart';

abstract class ZDResponseCallback{

  onError(String errorMessage);

  static throwError(int errorCode, ZDResponseCallback callback){
    String errorMessage;
    switch (errorCode){
      case 101:
        errorMessage = "No Network Connection";
        break;
      case 104:
        errorMessage = "No Data";
        break;
      default:
        errorMessage = "Server Exception";
    }

    callback.onError(errorMessage);
  }

}

abstract class DepartmentsCallback extends ZDResponseCallback{

  onDepartmentsFetch(List<ZDDepartment> departments);

}

abstract class LayoutsCallback extends ZDResponseCallback{

  onLayoutsFetch(List<ZDLayout> layouts);

}

abstract class TicketFormCallback extends ZDResponseCallback{

  onTicketFormDownloaded(ZDTicketForm ticketForm);

}

abstract class TicketFieldsCallback extends ZDResponseCallback{

  onTicketFieldsDownloaded(ZDTicketFieldsList ticketFields);

}