import 'package:hello_flutter_25/request_api/api_path.dart';

enum HttpMethod { get, post, delete }

abstract class CancelAble {
  cancel();
}

abstract class BaseRequest {
  String? pathParams;
  bool isHttps = true;
  Map<String, dynamic> queryParams = {};
  Map<String, dynamic> body = {};
  Map<String, dynamic> header = {};
  bool isCancel = false;
  CancelAble? cancelToken;

  cancel() {
    isCancel = true;
    cancelToken?.cancel();
  }

  HttpMethod httpMethod();

  bool needLogin() {
    return false;
  }

  String path();

  BaseRequest addParams(String key, dynamic value) {
    queryParams[key] = value;
    return this;
  }

  BaseRequest addBodyParams(String key, dynamic value) {
    body[key] = value;
    return this;
  }

  BaseRequest addHeaderParams(String key, dynamic value) {
    header[key] = value;
    return this;
  }

  String authority() {
    return "www.baidu.com";
  }

  String url() {
    Uri uri;
    String pathStr = path();
    if (pathParams != null) {
      if (pathStr.contains("/")) {
        pathStr = "$pathStr$pathParams";
      } else {
        pathStr = "$pathStr/$pathParams";
      }
    }

    if (isHttps) {
      uri = Uri.https(authority(), pathStr, queryParams);
    } else {
      uri = Uri.http(authority(), pathStr, queryParams);
    }

    return uri.toString();
  }
}
