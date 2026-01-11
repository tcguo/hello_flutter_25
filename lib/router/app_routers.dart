import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/pages/root_page.dart';
import 'package:hello_flutter_25/pages/team/teame_list_page.dart';
import 'package:hello_flutter_25/pages/unknow_page.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    NBATeamListPage.routePath: (context) => const NBATeamListPage(),
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory generateRoute = (settings) {
    var page = parseRouteApp(settings.name ?? "");
    return MaterialPageRoute(settings: settings, builder: (context) => page);
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory unknowRoute = (settings) {
    return MaterialPageRoute(
        settings: settings, builder: (context) => const UnKnowPage());
  };

  static Widget parseRouteApp(String routePath) {
    if (routePath == "/" || routePath.isEmpty) {
      if (kDebugMode) {
        return const RootPage();
      } else {
        return const UnKnowPage();
      }
    }
    return const UnKnowPage();
  }
}
