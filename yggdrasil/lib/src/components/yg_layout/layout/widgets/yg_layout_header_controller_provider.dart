import 'package:flutter/widgets.dart';

import '../controller/yg_layout_header_controller.dart';

class YgLayoutHeaderControllerProvider extends InheritedWidget {
  const YgLayoutHeaderControllerProvider({
    super.key,
    required super.child,
    required this.controller,
    required this.index,
  });

  final YgLayoutHeaderController controller;
  final int index;

  // ignore: prefer-widget-private-members
  static YgLayoutHeaderControllerProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgLayoutHeaderControllerProvider>();
  }

  @override
  bool updateShouldNotify(YgLayoutHeaderControllerProvider oldWidget) =>
      oldWidget.controller != controller || oldWidget.index != index;
}
