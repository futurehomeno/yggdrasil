import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

/// Internal widget used for [YgLayoutBody] with [YgFooterBehavior.pushDown].
///
/// Positions its children so that the footer is pushed to either the bottom of
/// the screen or the bottom of the content, depending on the height of the
/// content. Preserves the minimum height of the child minus the height of the
/// footer.
class YgPushDownFooter extends MultiChildRenderObjectWidget {
  const YgPushDownFooter({
    super.key,
    super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgPushDownFooterRenderer();
  }
}

class YgPushDownFooterRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgPushDownFooterRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgPushDownFooterRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgPushDownFooterRendererParentData>,
        YgInheritedRenderPaddingProviderMixin {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgPushDownFooterRendererParentData();
  }

  @override
  void performLayout() {
    final [
      RenderBox child,
      RenderBox footer,
    ] = getChildrenAsList();

    footer.layout(
      constraints.copyWith(
        minHeight: 0,
      ),
      parentUsesSize: true,
    );

    child.layout(
      BoxConstraints(
        minHeight: constraints.minHeight - footer.size.height,
        maxHeight: constraints.maxHeight - footer.size.height,
        maxWidth: constraints.maxWidth,
        minWidth: constraints.minWidth,
      ),
      parentUsesSize: true,
    );

    (footer.parentData as YgPushDownFooterRendererParentData).offset = Offset(
      0,
      child.size.height,
    );

    size = Size(
      constraints.maxWidth,
      child.size.height + footer.size.height,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(
      context,
      offset,
    );
  }

  @override
  bool hitTestChildren(
    BoxHitTestResult result, {
    required Offset position,
  }) {
    return defaultHitTestChildren(
      result,
      position: position,
    );
  }
}
