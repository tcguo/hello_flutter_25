import 'dart:convert';

import 'package:hello_flutter_25/core/http/core/base_request.dart';

/// 业务response
class CNetResponse<T> {
  T? data;
  BaseRequest request;
  int? statusCode;
  String? statusMessage;
  dynamic extra;

  CNetResponse(
      {this.data,
      required this.request,
      this.statusCode,
      this.statusMessage,
      this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    } else {
      return data.toString();
    }
  }
}
