import 'dart:developer';

import 'package:shopping_app_ui/helpers/http_api.dart';
import 'package:shopping_app_ui/models/employee.dart';

class EmployeeServices {
  static Future<dynamic> getEmployees() async {
    try {
      final response = await HttpAPI.makeAPIcall(ApiMethod.get, 'employees');
      if (response.success) {
        return response.responseData['data'];
      }
    } catch (e) {
      log("Error $e");
    }
    return null;
  }

  static Future<dynamic> getEmployee({required int id}) async {
    try {
      final response = await HttpAPI.makeAPIcall(ApiMethod.get, 'employees');
      if (response.success) {
        return response.responseData['data'];
      }
    } catch (e) {
      log("Error $e");
    }
    return null;
  }

  static Future<bool> createEmployee({required Employee data}) async {
    try {
      final response = await HttpAPI.makeAPIcall(ApiMethod.post, 'create',
          body: data.toJson());
      if (response.success) {
        log(response.responseData.toString());
        return true;
      }
    } catch (e) {
      log("Error $e");
    }

    return false;
  }
}
