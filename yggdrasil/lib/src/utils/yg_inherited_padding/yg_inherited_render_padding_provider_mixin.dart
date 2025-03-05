import 'package:flutter/rendering.dart';

/// Adds a method to set inherited padding on the render tree.
mixin YgInheritedRenderPaddingProviderMixin on RenderObject {
  EdgeInsets? _padding;
  EdgeInsets get padding => _padding ?? EdgeInsets.zero;

  void setPadding(EdgeInsets padding) {
    _padding = padding;
  }

  @override
  void layout(
    Constraints constraints, {
    bool parentUsesSize = false,
  }) {
    // Prevent using outdated padding.
    _padding = null;
    super.layout(
      constraints,
      parentUsesSize: parentUsesSize,
    );
  }
}
