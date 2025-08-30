mixin SafeAble {
  abstract dynamic data;

  num? getNum(String key) {
    if (data == null) {
      return null;
    }
    var value = data[key];
    if (value == null) {
      return null;
    }
    if (value is num) {
      return value;
    }
    return null;
  }

  T? get<T>(String key) {
    if (data == null) return null;
    var value = data[key];
    if (value == null) return null;
    if (value is T) return value;
    return null;
  }

  String safeString(String key) {
    if (data == null) return "";
    var value = data[key];
    return (value ?? "").toString();
  }

  SafeAbleData? safeData(String key) {
    if (data == null) return null;
    var value = data[key];
    if (value == null) {
      return value;
    }
    return SafeAbleData(value);
  }

  List<dynamic> getList(String key) {
    if (data == null) return [];
    var value = data[key];
    if (value is List<dynamic>) return value;
    return [];
  }

  List<SafeAbleData> safeList(String key) {
    if (data == null) return [];
    var value = data[key];
    if (value is List<dynamic>) {
      return value.map((e) => SafeAbleData(e)).toList();
    }
    return [];
  }
}

class SafeAbleData with SafeAble {
  @override
  dynamic data;

  SafeAbleData(this.data);
}
