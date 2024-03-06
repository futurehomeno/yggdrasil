// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Internal widget used for creating expanding widgets.
class YgExpander extends StatefulWidget {
  const YgExpander({
    super.key,
    required this.child,
    required this.headerBuilder,
    required this.duration,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
    this.alignment = Alignment.center,
    this.axis = Axis.vertical,
    this.curve = Curves.linear,
  });

  /// Builds the header of the expanding widget.
  ///
  /// The header is visible at all times and should probably be responsible for
  /// toggling the opening and closing the expanding widget.
  final Widget Function(BuildContext context, YgExpansionController controller) headerBuilder;

  /// Controller which controls the expanded state of the widget.
  ///
  /// When no controller is provided a default one will be created. When a
  /// controller is provided [initiallyExpanded] will be ignored.
  final YgExpansionController? controller;

  /// Whether the widget should initially be expanded.
  ///
  /// Does not apply if [controller] is also provided.
  final bool initiallyExpanded;

  /// The alignment of the child.
  ///
  /// Mainly influences how the child will become visible, if it moves with the
  /// expansion animation of whether it gets revealed by the animation.
  final Alignment alignment;

  /// Axis along which the widget will expand.
  final Axis axis;

  /// The widget rendered below the header when the widget has expanded.
  final Widget child;

  /// Gets called when the expanded state changes.
  final ValueChanged<bool>? onExpandedChanged;

  /// The animation duration.
  final Duration duration;

  /// The animation curve.
  final Curve curve;

  @override
  State<YgExpander> createState() => YgExpanderState();
}

class YgExpanderState extends State<YgExpander> with YgControllerManagerMixin {
  late final YgControllerManager<YgExpansionController> _controllerManager = manageController(
    createController: () => YgExpansionController(initiallyExpanded: widget.initiallyExpanded),
    getUserController: () => widget.controller,
    listener: _rebuild,
  );

  YgExpansionController get controller => _controllerManager.value;

  late bool _currentlyExpanded;

  @override
  void initState() {
    super.initState();
    _currentlyExpanded = controller.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: widget.axis,
      children: <Widget>[
        widget.headerBuilder(context, controller),
        ClipRect(
          child: AnimatedAlign(
            alignment: widget.alignment,
            duration: widget.duration,
            curve: widget.curve,
            heightFactor: _getFactorForAxis(Axis.vertical),
            widthFactor: _getFactorForAxis(Axis.horizontal),
            child: widget.child,
          ),
        ),
      ],
    );
  }

  double _getFactorForAxis(Axis axis) {
    if (widget.axis != axis || controller.expanded) {
      return 1.0;
    }

    return 0.0;
  }

  void _checkExpandedChange() {
    final bool newExpanded = controller.expanded;
    if (_currentlyExpanded != newExpanded) {
      _currentlyExpanded = newExpanded;
      widget.onExpandedChanged?.call(newExpanded);
    }
  }

  void _rebuild() {
    _checkExpandedChange();
    setState(() {});
  }
}
