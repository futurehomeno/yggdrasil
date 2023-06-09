import 'package:flutter/material.dart';

class YgRouteBuilder {
  /// Page route builder with forced fade in / out transition.
  PageRouteBuilder<T> fadeTransition<T>({
    required RouteSettings settings,
    required Widget screen,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screen;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
