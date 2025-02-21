import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_render_shifted_box.dart';

import 'yg_inherited_render_padding_mixin.dart';

/// Adds inherited padding to a child widget.
class YgInheritedRenderPadding extends SingleChildRenderObjectWidget {
  const YgInheritedRenderPadding({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgInheritedRenderPaddingRenderer();
  }
}

class YgInheritedRenderPaddingRenderer extends YgRenderShiftedBox with YgInheritedRenderPaddingMixin {
  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child == null) {
      size = constraints.smallest;

      return;
    }

    final EdgeInsets padding = getPadding();

    final BoxConstraints childConstraints = BoxConstraints(
      maxHeight: max(0, constraints.maxHeight - padding.vertical),
      minHeight: max(0, constraints.minHeight - padding.vertical),
      maxWidth: max(0, constraints.maxWidth - padding.horizontal),
      minWidth: max(0, constraints.minWidth - padding.horizontal),
    );

    child.layout(
      childConstraints,
      parentUsesSize: true,
    );

    childOffset = padding.topLeft;
  }
}
