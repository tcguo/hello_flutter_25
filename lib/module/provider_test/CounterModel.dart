import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  // 读方法
  int get   counter => _count;

  // 写方法
  void increment() {
    _count++;
    notifyListeners();
  }

  String _userName = 'Guest-guo';
  String get userName => _userName;
  void updateUserName(String name) {
    _userName = name;
    notifyListeners(); // 通知所有监听者
  }

  // 变更主题
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
