import 'package:flutter/material.dart';
import '../app/app.router.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => navigatorKey.currentState!;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceWith(String routeName, {dynamic arguments}) {
    return _navigator.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceWithMainView() {
    return replaceWith(Routes.mainView);
  }

  void goBack() {
    return _navigator.pop();
  }
}