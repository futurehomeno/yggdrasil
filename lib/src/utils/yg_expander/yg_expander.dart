import 'package:flutter/material.dart';

part 'yg_expansion_controller.dart';

/// Internal widget used for creating expanding widgets.
class YgExpander extends StatefulWidget {
  const YgExpander({
    super.key,
    required this.child,
    required this.headerBuilder,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
    this.childAlignment = Alignment.topCenter,
    this.axis = Axis.vertical,
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
  final Alignment childAlignment;

  /// Axis on which the widget will expand.
  final Axis axis;

  /// The widget rendered below the header when the widget has expanded.
  final Widget child;

  /// Gets called when the expanded state changes.
  final ValueChanged<bool>? onExpandedChanged;

  @override
  State<YgExpander> createState() => _YgExpanderState();
}

class _YgExpanderState extends State<YgExpander> {
  late YgExpansionController _controller = widget.controller ?? _createController();
  late bool _currentlyExpanded;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_rebuild);
    _currentlyExpanded = _controller.expanded;
  }

  @override
  void didUpdateWidget(covariant YgExpander oldWidget) {
    final YgExpansionController? newController = widget.controller;

    if (newController == null) {
      if (oldWidget.controller != null) {
        _updateController(_createController());
      }
    } else if (newController != _controller) {
      _updateController(newController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.removeListener(_rebuild);
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.axis,
      children: <Widget>[
        widget.headerBuilder(context, _controller),
        ClipRect(
          child: AnimatedAlign(
            alignment: widget.childAlignment,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            heightFactor: _getFactorForAxis(Axis.vertical),
            widthFactor: _getFactorForAxis(Axis.horizontal),
            child: widget.child,
          ),
        ),
      ],
    );
  }

  double _getFactorForAxis(Axis axis) {
    if (widget.axis != axis || _controller.expanded) {
      return 1.0;
    }

    return 0.0;
  }

  void _updateController(YgExpansionController controller) {
    _controller.removeListener(_rebuild);
    _controller = controller;
    _controller.addListener(_rebuild);
    _checkExpandedChange();
  }

  void _checkExpandedChange() {
    final bool newExpanded = _controller.expanded;
    if (_currentlyExpanded != newExpanded) {
      _currentlyExpanded = newExpanded;
      widget.onExpandedChanged?.call(newExpanded);
    }
  }

  void _rebuild() {
    _checkExpandedChange();
    setState(() {});
  }

  YgExpansionController _createController() {
    return YgExpansionController(
      initiallyExpanded: widget.initiallyExpanded,
    );
  }
}
