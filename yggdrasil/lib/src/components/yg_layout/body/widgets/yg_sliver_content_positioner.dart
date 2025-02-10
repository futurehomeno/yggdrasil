import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_mixin.dart';

class YgSliverContentPositioner extends SingleChildRenderObjectWidget {
  const YgSliverContentPositioner({
    super.key,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliverContentPositionerRenderer();
  }
}

class YgSliverContentPositionerRenderer extends RenderSliverEdgeInsetsPadding with YgInheritedRenderPaddingMixin {
  EdgeInsets? _padding;

  @override
  EdgeInsets? get resolvedPadding => _padding;

  @override
  void performLayout() {
    _padding = getPadding();
    super.performLayout();
  }
}
