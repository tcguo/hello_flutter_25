import 'package:hello_flutter_25/core/http/core/cnet_error.dart';
import 'package:hello_flutter_25/core/http/core/cnet_response.dart';

extension GetParams on Map<dynamic, dynamic> {
  int? getInt(String name) {
    dynamic value = this[name];
    if (value is int) {
      return value;
    }
    return null;
  }

  String? getString(String name) {
    dynamic value = this[name];
    if (value is String) {
      return value;
    }
    return null;
  }
}

extension DealWebApi on CNetResponse {
  parseWebApi() {
    if (statusCode == 200) {
      var error = data["error"];
      if (error != null && error["isError"] != "false") {
        return Future.error(error);
      } else {
        return data;
      }
    } else {
      return Future.error(
          ProxyError(statusCode ?? cnetErrorCodeEmpty, statusMessage ?? ""));
    }
  }
}

extension DealAppApi on CNetResponse<Map<dynamic, dynamic>> {
  parseWEAApi() {
    if (statusCode == 200) {
      var responseData = data;
      int code = responseData?.getInt("code") ?? cnetErrorCodeDefault;
      if (code != 0) {
        var message = responseData?.getString("msg") ?? "";
        return throw BusinessError(code, message);
      } else {
        return responseData;
      }
    } else {
      return throw ProxyError(
          statusCode ?? cnetErrorCodeEmpty, statusMessage ?? "");
    }
  }

  parseClientJsonWEAApi() {
    if (statusCode == 200) {
      return data;
    } else {
      return throw ProxyError(
          statusCode ?? cnetErrorCodeEmpty, statusMessage ?? "");
    }
  }
}
