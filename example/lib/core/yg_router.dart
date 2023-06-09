import 'package:flutter/material.dart';

class YgRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object?>(Route<T> route) async {
    try {
      return navigatorKey.currentState?.push(route);
    } catch (e) {
      return null;
    }
  }
}
