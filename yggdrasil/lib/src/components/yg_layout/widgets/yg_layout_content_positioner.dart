import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_mixin.dart';
import 'package:yggdrasil/src/utils/yg_render_shifted_box.dart';

class YgLayoutContentPositioner extends SingleChildRenderObjectWidget {
  const YgLayoutContentPositioner({
    super.key,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgContentPositionerRenderer();
  }
}

class YgContentPositionerRenderer extends YgRenderShiftedBox with YgInheritedRenderPaddingMixin {
  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child == null) {
      size = constraints.smallest;

      return;
    }

    final double layoutHeight = getLayoutHeight();
    final EdgeInsets padding = getPadding();

    final BoxConstraints childConstraints = BoxConstraints(
      minHeight: constraints.constrainHeight(layoutHeight) - padding.vertical,
      maxHeight: constraints.maxHeight - padding.vertical,
      maxWidth: constraints.maxWidth,
      minWidth: constraints.maxWidth,
    );

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
        print(<Object>[parent, parent.constraints]);
        return (parent.constraints as BoxConstraints).maxHeight;
      }
    }

    return 0;
  }
}
