import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hello_flutter_25/core/http/core/requset_config.dart';

class SignUtils {
  // ignore: prefer_function_declarations_over_variables
  static final InterceptorSuccessCallback response = (
    Response e,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(e);
  };

  // ignore: prefer_function_declarations_over_variables
  static final InterceptorSendCallback request = (
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    RequestOptions newRequestOptions = options;
    switch (options.method) {
      case "GET":
        {
          newRequestOptions = signGet(options);
          break;
        }
      case "POST":
        {
          newRequestOptions = signGet(options);
          break;
        }
      default:
        {
          newRequestOptions = options;
        }
    }

    handler.next(newRequestOptions);
  };

  static RequestOptions signGet(RequestOptions requestOptions) {
    var newOptions = requestOptions.copyWith();
    newOptions.queryParameters.addAll(RequestConfig.baseParams);
    var queryParameters = newOptions.queryParameters;

    var beSort = queryParameters.keys.toList();
    beSort.sort((s1, s2) {
      return s1.compareTo(s2);
    });

    String signStr = "";
    for (var element in beSort) {
      signStr += "$element=${queryParameters[element]};";
    }

    var timeInterval = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    signStr += RequestConfig.accessKey;
    signStr += timeInterval.toString();

    var signRes = generateMd5(signStr);

    queryParameters.addAll({"sign": signRes, 't': timeInterval.toString()});
    return newOptions;
  }

  static String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }

  // ignore: prefer_function_declarations_over_variables
  static final InterceptorErrorCallback error =
      (DioError e, ErrorInterceptorHandler handler) {
    handler.next(e);
  };
}

class SignInterceptor extends InterceptorsWrapper {
  SignInterceptor()
      : super(
            onRequest: SignUtils.request,
            onError: SignUtils.error,
            onResponse: SignUtils.response);
}
