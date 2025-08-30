import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class WeaLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= level!.index;
  }
}

class AppLogger {
  AppLogger() {
    if (kReleaseMode) {
      Logger.level = Level.info;
    } else if (kProfileMode) {
      Logger.level = Level.verbose;
    } else {
      Logger.level = Level.verbose;
    }
  }

  static final _simpleLogger =
      Logger(filter: WeaLogFilter(), printer: SimplePrinter(colors: false));

  static final _jsonLogger = Logger(
    filter: WeaLogFilter(),
    printer: PrettyPrinter(
        methodCount: 0, colors: true, printTime: false, printEmojis: false),
  );

  static final _stackTraceLogger = Logger(
    printer: PrettyPrinter(
      methodCount: 10,
      errorMethodCount: 10,
      printEmojis: true,
      colors: false,
    ),
  );

  static e(dynamic tag,
      [dynamic message, dynamic error, StackTrace? stackTrace]) {
    _stackTraceLogger.e(tag + '  $message', error, stackTrace);
  }

  static w(dynamic tag,
      [dynamic message, dynamic error, StackTrace? stackTrace]) {
    _simpleLogger.log(tag + '  $message', error, stackTrace);
  }

  static i(dynamic tag,
      [dynamic message, dynamic error, StackTrace? stackTrace]) {
    _simpleLogger.i(tag + '  $message', error, stackTrace);
  }

  static d(dynamic tag,
      [dynamic message, dynamic error, StackTrace? stackTrace]) {
    _simpleLogger.d(tag + '  $message', error, stackTrace);
  }

  static v(dynamic tag,
      [dynamic message, dynamic error, StackTrace? stackTrace]) {
    _simpleLogger.v(tag + '  $message', error, stackTrace);
  }

  static simple(String tag, dynamic message) {
    _simpleLogger.i("$tag:: $message");
  }

  static currentStackTrace(String tag) {
    e(tag, "", StackTrace.current);
  }
}
