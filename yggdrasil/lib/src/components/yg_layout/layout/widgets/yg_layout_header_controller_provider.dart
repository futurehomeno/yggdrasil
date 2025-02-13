import 'package:flutter/widgets.dart';

import '../controller/yg_layout_header_controller.dart';

/// Provides the current [YgLayoutHeaderController] and index of the view to the
/// [YgLayoutBody].
class YgLayoutHeaderControllerProvider extends InheritedWidget {
  const YgLayoutHeaderControllerProvider({
    super.key,
    required super.child,
    required this.controller,
    required this.index,
  });

  /// The current controller.
  final YgLayoutHeaderController controller;

  /// The index of the child view.
  final int index;

  // ignore: prefer-widget-private-members
  static YgLayoutHeaderControllerProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgLayoutHeaderControllerProvider>();
  }

  @override
  bool updateShouldNotify(YgLayoutHeaderControllerProvider oldWidget) =>
      oldWidget.controller != controller || oldWidget.index != index;
}
