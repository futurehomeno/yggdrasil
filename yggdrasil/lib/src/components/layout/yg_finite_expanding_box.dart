import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A box which expands in any finite axis unless overwritten.
///
/// By default will expand the widget to the maximum allowed value on any finite
/// axis, but this can be overwritten using [width] or [height]. When both are
/// specified, this widget behaves identically to an [SizedBox].
///
/// When neither [width] or [height] are overwritten this widget will fill any
/// finite axis, so in a [Row] this would mean the widget expands vertically,
/// in a [Column] it would mean the widget expands horizontally and in a box with
/// finite constraints for both the width and height, this widget will expand to
/// fill the box.
class YgFiniteExpandingBox extends SingleChildRenderObjectWidget {
  const YgFiniteExpandingBox({
    super.key,
    required this.height,
    required this.width,
    required Widget super.child,
  });

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FiniteExpandingWidgetRenderer(
      height: height,
      width: width,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _FiniteExpandingWidgetRenderer renderObject) {
    renderObject.width = width;
    renderObject.height = height;
  }
}

class _FiniteExpandingWidgetRenderer extends RenderProxyBox {
  _FiniteExpandingWidgetRenderer({
    required double? width,
    required double? height,
  })  : _width = width,
        _height = height;

  double? _width;
  double? get width => _width;
  set width(double? newWidth) {
    if (_width != newWidth) {
      markNeedsLayout();
      _width = newWidth;
    }
  }

  double? _height;
  double? get height => _height;
  set height(double? newHeight) {
    if (_height != newHeight) {
      markNeedsLayout();
      _height = newHeight;
    }
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;

    if (child == null) {
      size = Size.zero;

      return;
    }

    child.layout(
      _computeChildConstraints(constraints),
      parentUsesSize: true,
    );

    size = child.size;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final RenderBox? child = this.child;

    if (child == null) {
      return Size.zero;
    }

    return child.getDryLayout(
      _computeChildConstraints(
        constraints,
      ),
    );
  }

  BoxConstraints _computeChildConstraints(BoxConstraints constraints) {
    final double maxWidth = constraints.maxWidth;
    final double maxHeight = constraints.maxHeight;

    double? width = _width;
    if (width != null) {
      width = constraints.constrainWidth(width);
    }

    double? height = _height;
    if (height != null) {
      height = constraints.constrainHeight(height);
    }

    return BoxConstraints(
      minWidth: width ?? (maxWidth.isFinite ? maxWidth : 0),
      minHeight: height ?? (maxHeight.isFinite ? maxHeight : 0),
      maxWidth: width ?? maxWidth,
      maxHeight: height ?? maxHeight,
    );
  }
}
