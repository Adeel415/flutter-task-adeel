import 'package:flutter/material.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/main/main_view.dart';

class Routes {
  static const String startupView = '/';
  static const String mainView = '/main';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startupView:
      return MaterialPageRoute(builder: (_) => const StartupView());
    case Routes.mainView:
      return MaterialPageRoute(builder: (_) => const MainView());
    default:
      return MaterialPageRoute(builder: (_) => const StartupView());
  }
}