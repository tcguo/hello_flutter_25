import 'package:hello_flutter_25/config/appconfig.dart';

class ApiPath {
  static String apiProductUrl = "api.nba.cn"; // 生产环境
  static String apiDebugUrl = "testapi.nba.cn"; // 测试环境
  static String nativeAppBaseRequestUrl = ""; // app传递过来的 地址

  static String get apiRootUrl {
    if (AppConfig.isNotRunInNativeApp) {
      return AppConfig.isDebug ? apiDebugUrl : apiProductUrl;
    }

    return nativeAppBaseRequestUrl.isEmpty
        ? apiProductUrl
        : nativeAppBaseRequestUrl;
  }

  static String city_weather_top15 = "/xxx/xxx";
  static String team_list = "/sib/v2/conference/teams";
}
