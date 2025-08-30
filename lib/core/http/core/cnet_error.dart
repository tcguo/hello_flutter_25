const int cnetErrorCodeEmpty = -1;
const int cnetErrorCodeProxyDefault = -2;
const int cnetErrorCodeDefault = -9999;

const int tokenInvalid = 51019;
const int attentionOverFlow = 40015;

/// 数据请求业务的异常描述
class CNetError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  CNetError(this.code, this.message, {this.data});

  @override
  String toString() {
    return message;
  }
}

class NeedAuthError extends CNetError {
  NeedAuthError(String message, {int code = 403, dynamic data})
      : super(code, message, data: data);
}

class BusinessError extends CNetError {
  BusinessError(int code, String? msg) : super(code, msg ?? "业务处理异常");
}

class EmptyError extends BusinessError {
  EmptyError() : super(-1, "data is empty");
}

class CancelError extends CNetError {
  CancelError() : super(-9, "请求取消");
}

class ProxyError extends CNetError {
  ProxyError(int code, String? msg) : super(code, msg ?? "网络协议错的");
}

class NeedLoginError extends BusinessError {
  NeedLoginError({int code = 401, String message = "请登录"})
      : super(code, message);
}

class RequestFailedError extends BusinessError {
  RequestFailedError({int code = -9999, String message = "请求异常"})
      : super(code, message);

  @override
  String toString() {
    return "[$code] $message";
  }
}
