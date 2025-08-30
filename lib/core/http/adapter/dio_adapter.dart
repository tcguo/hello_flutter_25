import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:hello_flutter_25/config/appconfig.dart';
import 'package:hello_flutter_25/core/http/core/base_request.dart';
import 'package:hello_flutter_25/core/http/core/cnet_adapter.dart';
import 'package:hello_flutter_25/core/http/core/cnet_response.dart';
import 'package:hello_flutter_25/core/http/core/cnetwork.dart';
import 'package:hello_flutter_25/core/http/core/requset_config.dart';
import 'package:hello_flutter_25/core/http/interceptor/common_interceptor.dart';
import 'package:hello_flutter_25/core/http/interceptor/sign_interceptor.dart';

/// 为项目提供Dio能力
class DioAdapter extends CNetAdapter {
  static final BaseOptions baseOptions =
      BaseOptions(receiveTimeout: RequestConfig.timeout);
  static late Dio _dio;

  DioAdapter() {
    _dio = Dio(baseOptions);
    _dio.interceptors.add(SignInterceptor());
    if (AppConfig.isDebug) {
      // _dio.interceptors.add(HttpFormatter());
    }
    _dio.interceptors.add(CommonInterceptor());
  }

  @override
  Future<CNetResponse<T>> send<T>(BaseRequest request) async {
    var options = Options(headers: request.header);
    Response? response;

    var cancelToken = CancelToken();
    request.cancelToken = DioCancel(cancelToken);

    try {
      if (request.httpMethod() == HttpMethod.get) {
        response = await _dio.get(request.url(),
            cancelToken: cancelToken,
            options: Options(headers: request.header));
      } else if (request.httpMethod() == HttpMethod.post) {
        response = await _dio.post(request.url(),
            options: options, cancelToken: cancelToken, data: request.body);
      } else if (request.httpMethod() == HttpMethod.delete) {
        response = await _dio.delete(request.url(),
            options: options, data: request.body);
      }
      return buildRes<T>(response, request);
    } catch (e) {
      rethrow;
    }
  }

  CNetResponse<T> buildRes<T>(
      Response<dynamic>? response, BaseRequest request) {
    return CNetResponse<T>(
        data: response?.data,
        request: request,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        extra: response?.extra);
  }
}
