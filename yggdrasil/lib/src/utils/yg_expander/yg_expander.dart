// ignore_for_file: prefer-widget-private-members

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Internal widget used for creating expanding widgets.
class YgExpander extends StatelessWidget {
  const YgExpander({
    super.key,
    required this.child,
    required this.headerBuilder,
    required this.duration,
    this.alignment = Alignment.center,
    this.axis = Axis.vertical,
    this.curve = Curves.linear,
  });

  /// Builds the header of the expanding widget.
  ///
  /// The header is visible at all times and should probably be responsible for
  /// toggling the opening and closing the expanding widget.
  final Widget Function(BuildContext context, YgExpansionController controller) headerBuilder;

  /// The alignment of the child.
  ///
  /// Mainly influences how the child will become visible, if it moves with the
  /// expansion animation of whether it gets revealed by the animation.
  final Alignment alignment;

  /// Axis along which the widget will expand.
  final Axis axis;

  /// The widget rendered below the header when the widget has expanded.
  final Widget child;

  /// The animation duration.
  final Duration duration;

  /// The animation curve.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final YgExpansionController controller = YgExpansionController.of(context);

    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: axis,
      children: <Widget>[
        headerBuilder(context, controller),
        ClipRect(
          child: AnimatedAlign(
            alignment: alignment,
            duration: duration,
            curve: curve,
            heightFactor: _getFactorForAxis(controller, Axis.vertical),
            widthFactor: _getFactorForAxis(controller, Axis.horizontal),
            child: child,
          ),
        ),
      ],
    );
  }

  double _getFactorForAxis(YgExpansionController controller, Axis axis) {
    if (axis != this.axis || controller.expanded) {
      return 1.0;
    }

    return 0.0;
  }
}
