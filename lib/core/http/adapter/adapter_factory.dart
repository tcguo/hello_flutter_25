import 'package:hello_flutter_25/core/http/adapter/dio_adapter.dart';
import 'package:hello_flutter_25/core/http/core/cnet_adapter.dart';

/// 三方框架适配器工场 依照不同的请求来返回对应的数据适配器
class AdapterFactory {
  static Map<String, CNetAdapter> catchAdapter = {};
  static CNetAdapter getAdapter(String tag) {
    if (!catchAdapter.containsKey(tag)) {
      catchAdapter[tag] = _createAdapter(tag);
    }
    return catchAdapter[tag]!;
  }

  static CNetAdapter _createAdapter(String tag) {
    return DioAdapter();
  }
}
