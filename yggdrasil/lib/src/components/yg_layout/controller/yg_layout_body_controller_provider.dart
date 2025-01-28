import 'package:flutter/widgets.dart';

import 'yg_layout_controller.dart';

class YgLayoutBodyControllerProvider extends InheritedWidget {
  const YgLayoutBodyControllerProvider({
    super.key,
    required super.child,
    required this.controller,
    required this.index,
  });

  final YgLayoutController controller;
  final int index;

  // ignore: prefer-widget-private-members
  static YgLayoutBodyControllerProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgLayoutBodyControllerProvider>();
  }

  @override
  bool updateShouldNotify(YgLayoutBodyControllerProvider oldWidget) =>
      oldWidget.controller != controller || oldWidget.index != index;
}
