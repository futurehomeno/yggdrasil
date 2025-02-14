import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_mixin.dart';
import 'package:yggdrasil/src/utils/yg_render_shifted_box.dart';

/// Internal layout widget used by [YgLayoutBody].
///
/// Adds inherited padding and safe area padding to the [child], and gives it a
/// minimum height equal to the height of the parent [YgLayout] minus the
/// padding and safe area padding.
class YgLayoutContentPositioner extends SingleChildRenderObjectWidget {
  const YgLayoutContentPositioner({
    super.key,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgContentPositionerRenderer(
      padding: MediaQuery.paddingOf(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgContentPositionerRenderer renderObject) {
    renderObject.padding = MediaQuery.paddingOf(context);
  }
}

class YgContentPositionerRenderer extends YgRenderShiftedBox with YgInheritedRenderPaddingMixin {
  YgContentPositionerRenderer({
    required EdgeInsets padding,
  }) : _padding = padding;

  EdgeInsets _padding;
  EdgeInsets get padding => _padding;

  set padding(EdgeInsets value) {
    if (_padding == value) {
      return;
    }

    _padding = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child == null) {
      size = constraints.smallest;

      return;
    }

    final double layoutHeight = getLayoutHeight();
    final EdgeInsets inheritedPadding = getPadding();

    // Apply either inherited padding or safe area padding, depending on which
    // is bigger.
    final EdgeInsets padding = EdgeInsets.only(
      top: max(inheritedPadding.top, _padding.top),
      bottom: max(inheritedPadding.bottom, _padding.bottom),
      left: max(inheritedPadding.left, _padding.left),
      right: max(inheritedPadding.right, _padding.right),
    );

    final double minHeight = constraints.constrainHeight(layoutHeight) - padding.vertical;
    final BoxConstraints childConstraints = BoxConstraints(
      minHeight: minHeight,
      maxHeight: max(minHeight, constraints.maxHeight - padding.vertical),
      maxWidth: constraints.maxWidth - padding.horizontal,
      minWidth: constraints.maxWidth - padding.horizontal,
    ).enforce(constraints);

    child.layout(
      childConstraints,
      parentUsesSize: true,
    );

    childOffset = padding.topLeft;

    size = padding.inflateSize(child.size);
  }

  double getLayoutHeight() {
    for (RenderObject? parent = this.parent; parent != null; parent = parent.parent) {
      if (parent is RenderAbstractViewport) {
        return (parent.constraints as BoxConstraints).maxHeight;
      }
    }

    // LayoutBuilder

    return 0;
  }
}
