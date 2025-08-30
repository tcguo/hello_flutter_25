import 'package:hello_flutter_25/config/appconfig.dart';
import 'package:hello_flutter_25/extensions/safe_getter.dart';

class RequestConfig {
  static const String baseURL = "http://123.207.32.32:8001/api";
  static const int timeout = 10000;
  static String accessKey = "0kbvqs9AdLEnhfvBE2wphFze0BvwL5C4";
  static bool isDebug = false;

  static var baseParams = Map.of({
    "app_key": "IMkVwSjhsNq2egfu",
    "os_type": AppConfig.osType,
    "os_version": "10.0",
    "app_version": "7.9.2",
    "install_id": "202209081736000448",
    "network": "wifi",
    "channel": "flutter",
    "device_id": "924C236D952F897FC3076F8B8DA33DAB818B46DF",
  });

  static initialConfig(SafeAbleData safeAbleData) {
    accessKey = safeAbleData.safeString("accessKey");
    baseParams = Map.of({
      "app_key": safeAbleData.safeString("app_key"),
      "os_type": safeAbleData.safeString("os_type"),
      "os_version": safeAbleData.safeString("os_version"),
      "app_version": safeAbleData.safeString("app_version"),
      "install_id": safeAbleData.safeString("install_id"),
      "network": safeAbleData.safeString("network"),
      "channel": safeAbleData.safeString("channel"),
      "device_id": safeAbleData.safeString("device_id")
    });
  }
}
