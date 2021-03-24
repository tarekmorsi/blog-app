import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName, RoutePredicate predicate,
      {dynamic arguments}) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  RouteSettings get currentRoute =>
      ModalRoute.of(navigatorKey.currentContext).settings;

  void popUntil(RoutePredicate predicate) {
    return navigatorKey.currentState.popUntil(predicate);
  }

  void pop({result}) {
    return navigatorKey.currentState.pop(result);
  }
}
