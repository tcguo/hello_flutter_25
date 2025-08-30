import 'package:dio/dio.dart';
import 'package:hello_flutter_25/core/http/adapter/adapter_factory.dart';
import 'package:hello_flutter_25/core/http/core/base_request.dart';
import 'package:hello_flutter_25/core/http/core/cnet_error.dart';
import 'package:hello_flutter_25/core/http/core/cnet_response.dart';

class CNetwork {
  static CNetwork? _instance;

  static CNetwork getInstance() {
    _instance ??= CNetwork();
    return _instance!;
  }

  Future<CNetResponse<T>> fire<T>(BaseRequest request) async {
    CNetResponse<T>? response;
    dynamic error;

    try {
      response = await send<T>(request);
    } catch (e) {
      error = e;
    }

    if (error != null) {
      if (error is DioError) {
        var errResponse = error.response;
        var status = errResponse?.statusCode;
        switch (status) {
          case 401:
            throw NeedLoginError();
          case 403:
            throw NeedAuthError("需要用户鉴权");
          default:
            throw CNetError(status ?? -1, error.message, data: errResponse);
        }
      } else if (error is CNetError) {
        throw error;
      } else {
        throw RequestFailedError();
      }
    }

    dynamic res = response?.data;
    if (response == null || (res is String && res.isEmpty)) {
      throw EmptyError();
    }

    var status = response.statusCode;
    switch (status) {
      case 200:
        return response;
      case 401:
        throw NeedLoginError();
      case 403:
        throw NeedAuthError("需要用户鉴权");
      default:
        throw CNetError(status ?? -1, response.statusMessage ?? "",
            data: response);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    return await AdapterFactory.getAdapter("dio").send<T>(request);
  }
}

class DioCancel extends CancelAble {
  CancelToken token;
  DioCancel(this.token);

  @override
  cancel() {
    token.cancel();
  }
}
