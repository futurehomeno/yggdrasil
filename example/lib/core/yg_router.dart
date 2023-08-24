import 'package:flutter/material.dart';

class YgRouter {
  const YgRouter();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object?>(Route<T> route) async {
    try {
      return await navigatorKey.currentState?.push(route);
    } catch (e) {
      return null;
    }
  }
}
