import 'package:flutter/rendering.dart';

/// Adds a method to set inherited padding on the render tree.
mixin YgInheritedRenderPaddingProviderMixin on RenderObject {
  EdgeInsets? _padding;
  EdgeInsets get padding => _padding ?? EdgeInsets.zero;

  void setPadding(EdgeInsets padding) {
    _padding = padding;
  }
}
