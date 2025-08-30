import 'package:hello_flutter_25/core/http/core/base_request.dart';
import 'package:hello_flutter_25/request_api/api_path.dart';

abstract class WeaBaseRequest extends BaseRequest {
  @override
  String authority() {
    return ApiPath.apiRootUrl;
  }

  Future<dynamic> request();
}
