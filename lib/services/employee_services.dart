import 'package:shopping_app_ui/helpers/http_api.dart';
import 'package:shopping_app_ui/models/api_response.dart';

class EmployeeServices {
  static Future<ApiResponse> getEmployees() async {
    var res = await HttpAPI.makeAPIcall(ApiMethod.get, 'employees');
    return res;
  }

  static Future<ApiResponse> getEmployee({required int id}) async {
    var res = await HttpAPI.makeAPIcall(ApiMethod.get, 'employees/$id');

    return res;
  }
}
