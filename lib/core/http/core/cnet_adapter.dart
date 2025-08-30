import 'package:hello_flutter_25/core/http/core/base_request.dart';
import 'package:hello_flutter_25/core/http/core/cnet_response.dart';

abstract class CNetAdapter {
  Future<CNetResponse<T>> send<T>(BaseRequest request);
}
