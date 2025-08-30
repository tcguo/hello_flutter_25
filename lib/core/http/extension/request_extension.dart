import 'package:hello_flutter_25/core/http/core/base_request.dart';
import 'package:hello_flutter_25/core/http/core/cnet_error.dart';
import 'package:hello_flutter_25/core/http/core/cnetwork.dart';
import 'package:hello_flutter_25/core/http/extension/response_parse_extension.dart';

extension RequestModeExtension on BaseRequest {
  Future<dynamic> fireRequest() async {
    try {
      if (isCancel) return Future.error(CancelError());

      var response =
          await CNetwork.getInstance().fire<Map<dynamic, dynamic>>(this);
      var data = response.parseWEAApi();
      if (isCancel) return Future.error(CancelError());
      return Future.value(data);
    } catch (e) {
      if (e is NeedLoginError) {
        /// TODO: tologin
      }
      return Future.error(e);
    }
  }

  Future<dynamic> fireWeaJsonRequest(params) async {
    try {
      if (isCancel) return Future.error(CancelError());
      var response =
          await CNetwork.getInstance().fire<Map<dynamic, dynamic>>(this);
      var parseNBAApi = response.parseClientJsonWEAApi();
      if (isCancel) return Future.error(CancelError());
      return Future.value(parseNBAApi);
    } catch (e) {
      return Future.error(e);
    }
  }
}
