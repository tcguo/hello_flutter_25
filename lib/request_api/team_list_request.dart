import 'package:hello_flutter_25/request_api/api_path.dart';
import 'package:hello_flutter_25/core/http/http_index.dart';

class TeamListRequest extends WeaBaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.get;
  }

  @override
  String path() {
    return ApiPath.team_list;
  }

  @override
  Future request() async {
    dynamic data = await fireRequest();
    return data;
  }
}
