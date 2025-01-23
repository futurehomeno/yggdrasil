import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

mixin YgInheritedRenderPaddingMixin on RenderObject {
  EdgeInsets getPadding() {
    EdgeInsets padding = EdgeInsets.zero;

    for (RenderObject? parent = this.parent;
        parent != null && parent is! YgInheritedRenderPaddingMixin;
        parent = parent.parent) {
      if (parent is YgInheritedRenderPaddingProviderMixin) {
        padding += parent.padding;
      }
    }

    return padding;
  }
}
