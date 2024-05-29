import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_expander/_yg_expander.dart';

/// Widget which provides the [YgExpansionController] to the child [BuildContext]s.
class YgExpanderDefaultControllerInheritedWidget extends InheritedWidget {
  const YgExpanderDefaultControllerInheritedWidget({
    super.key,
    required super.child,
    required this.controller,
  });

  final YgExpansionController controller;

  @override
  bool updateShouldNotify(YgExpanderDefaultControllerInheritedWidget oldWidget) {
    return oldWidget.controller != controller;
  }
}
