import 'package:dio/dio.dart';
import 'package:hello_flutter_25/config/appconfig.dart';
import 'package:hello_flutter_25/request_api/api_path.dart';

class CommonInterceptor extends InterceptorsWrapper {
  static InterceptorSendCallback request = (
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.uri.toString().contains(ApiPath.apiRootUrl)) {
      // options.headers["Authorization"] = "Bearer ${UserManager.userToken}";
      if (AppConfig.appVersion.isNotEmpty) {
        options.headers['NBA-App-Ver'] = AppConfig.appVersion;
      }
    }
    handler.next(options);
  };

  static InterceptorSuccessCallback response = (
    Response e,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(e);
  };

  static InterceptorErrorCallback error =
      (DioError e, ErrorInterceptorHandler handler) {
    handler.next(e);
  };

  CommonInterceptor()
      : super(onRequest: request, onError: error, onResponse: response) {}
}
