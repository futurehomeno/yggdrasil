import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_controller_manager/_yg_controller_manager.dart';
import 'package:yggdrasil/src/utils/yg_expander/_yg_expander.dart';

import 'yg_expander_default_controller_inherited_widget.dart';

/// Widget which manages the controller of [YgExpander].
class YgExpanderDefaultController extends StatefulWidget {
  const YgExpanderDefaultController({
    super.key,
    required this.child,
    this.controller,
    this.initiallyExpanded = false,
    this.onExpandedChanged,
  });

  /// Controller which controls the expanded state of the widget.
  ///
  /// When no controller is provided a default one will be created. When a
  /// controller is provided [initiallyExpanded] will be ignored.
  final YgExpansionController? controller;

  /// Whether the widget should initially be expanded.
  ///
  /// Does not apply if [controller] is also provided.
  final bool initiallyExpanded;

  /// Gets called when the expanded state changes.
  final ValueChanged<bool>? onExpandedChanged;

  /// The widget under this widget in the widget tree.
  final Widget child;

  @override
  State<YgExpanderDefaultController> createState() => _YgExpanderDefaultControllerState();
}

class _YgExpanderDefaultControllerState extends State<YgExpanderDefaultController> with YgControllerManagerMixin {
  late final YgControllerManager<YgExpansionController> _controllerManager = manageController(
    createController: () => YgExpansionController(initiallyExpanded: widget.initiallyExpanded),
    getUserController: () => widget.controller,
    listener: _checkExpandedChange,
  );

  late bool _currentlyExpanded;

  @override
  void initState() {
    super.initState();

    // We have to do this here because when using a late variable it will not be
    // initialized until we compare the value, in which case it will compare
    // against it self, instead of the current value.
    _currentlyExpanded = _controllerManager.value.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return YgExpanderDefaultControllerInheritedWidget(
      controller: _controllerManager.value,
      child: widget.child,
    );
  }

  void _checkExpandedChange() {
    final bool newExpanded = _controllerManager.value.expanded;
    if (_currentlyExpanded != newExpanded) {
      _currentlyExpanded = newExpanded;
      widget.onExpandedChanged?.call(newExpanded);
    }
  }
}
