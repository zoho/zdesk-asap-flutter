import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart';
import 'package:zohodesk_portal_apikit/model/ZDDepartment.dart';
import 'package:zohodesk_portal_apikit/model/ZDTicketFieldsList.dart';
import 'common/ZDResponseCallback.dart';
import 'model/ZDLayout.dart';
import 'model/ZDTicketForm.dart';
import 'zohodesk_portal_apikit_platform_interface.dart';

/// An implementation of [ZohodeskPortalApikitPlatform] that uses method channels.
class MethodChannelZohodeskPortalApikit extends ZohodeskPortalApikitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zohodesk_portal_apikit');

  ///ASAP Initialise SDK channel method
  @override
  Future<void> initializeSDK(String orgID, String appID, [ZDPDataCenter? dataCenter]) async {
    await methodChannel.invokeMethod("initializeSDK", {"orgID": orgID, "appID": appID, "dataCenter": (dataCenter ?? ZDPDataCenter.US).rawValue});
  }

  ///ASAP login channel method
  @override
  Future<bool> login(String jwtToken) async => await methodChannel.invokeMethod('login', {"jwtToken": jwtToken});

  ///ASAP logout channel method
  @override
  Future<bool> logout() async => await methodChannel.invokeMethod('logout');

  ///ASAP disable logs channel method
  @override
  Future<void> enableLogs() async => await methodChannel.invokeMethod('enableLogs');

  ///ASAP enable push notification method
  @override
  Future<void> enablePush(String fcmToken) async => await methodChannel.invokeMethod('enablePush', {"fcmToken": fcmToken});

  ///ASAP disable push notification method
  @override
  Future<void> disablePush(String fcmToken) async => await methodChannel.invokeMethod('disablePush',  {"fcmToken": fcmToken});

  ///ASAP Initialise accounts keys channel method
  @override
  Future<void> initializeAccountsKeys(String clientId, String clientSecretId, String portalId, String redirURI) async {
    await methodChannel.invokeMethod("initializeAccountsKeys", {"clientId": clientId, "clientSecretId": clientSecretId, "portalId": portalId, "redirURI":redirURI});
  }

  ///ASAP presentloginscreen channel method
  @override
  Future<bool> presentLoginScreen(String colorString) async => await methodChannel.invokeMethod('presentLoginScreen', {"colorString": colorString});

  ///ASAP isUserLoggedIn channel method
  @override
  Future<bool> isUserSignedIn() async => await methodChannel.invokeMethod('isUserSignedIn');

  ///ASAP getDepartments channel method
  @override
  Future<void> getDepartments(DepartmentsCallback callback) async {
    dynamic response = await methodChannel.invokeMethod('getDepartments');

    if(response is int){
      ZDResponseCallback.throwError(response, callback);
    }else{
      List departmentsList = json.decode(response) as List;
      List<ZDDepartment> departments = departmentsList.map((department) => ZDDepartment.fromJson(department)).toList();
      callback.onDepartmentsFetch(departments);
    }
  }

  ///ASAP getLayouts channel method
  @override
  Future<void> getLayouts(String departmentId, LayoutsCallback callback) async {
    dynamic response = await methodChannel.invokeMethod('getLayouts', {"departmentId": departmentId});

    if(response is int){
      ZDResponseCallback.throwError(response, callback);
    }else{
      List departmentsList = json.decode(response) as List;
      List<ZDLayout> layouts = departmentsList.map((layout) => ZDLayout.fromJson(layout)).toList();
      callback.onLayoutsFetch(layouts);
    }
  }

  @override
  Future<void> getTicketForm(String departmentId, String layoutId, TicketFormCallback callback) async {
    dynamic response = await methodChannel.invokeMethod('getTicketForm', {"departmentId": departmentId, "layoutId": layoutId});
    if(response is int){
      ZDResponseCallback.throwError(response, callback);
    }else{
      Map<String, dynamic> results = json.decode(response) as Map<String, dynamic>;

      ZDTicketForm departmentsList = ZDTicketForm.fromJson(results);
      callback.onTicketFormDownloaded(departmentsList);
    }
  }

  @override
  Future<void> getTicketFields(String departmentId, String layoutId, TicketFieldsCallback callback) async {
    dynamic response = await methodChannel.invokeMethod('getTicketFields', {"departmentId": departmentId, "layoutId": layoutId});
    if(response is int){
      ZDResponseCallback.throwError(response, callback);
    }else{
      Map<String, dynamic> results = json.decode(response) as Map<String, dynamic>;

      ZDTicketFieldsList fieldsList = ZDTicketFieldsList.fromJson(results);
      callback.onTicketFieldsDownloaded(fieldsList);
    }
  }


}
