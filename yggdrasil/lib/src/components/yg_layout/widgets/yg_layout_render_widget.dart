import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

class YgLayoutRenderWidget extends MultiChildRenderObjectWidget {
  const YgLayoutRenderWidget({
    super.key,
    super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgLayoutRenderer();
  }
}

class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgLayoutRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgLayoutRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgLayoutRendererParentData>,
        YgInheritedRenderPaddingProviderMixin {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgLayoutRendererParentData();
  }

  @override
  void performLayout() {
    final List<RenderBox> children = getChildrenAsList();
    final RenderBox appBar = children.last;
    final RenderBox content = children.first;

    appBar.layout(
      BoxConstraints(
        minHeight: 0,
        maxHeight: constraints.maxHeight,
        maxWidth: constraints.maxWidth,
        minWidth: constraints.maxWidth,
      ),
      parentUsesSize: true,
    );

    setPadding(
      EdgeInsets.only(
        top: appBar.size.height,
      ),
    );

    content.layout(
      BoxConstraints.tight(
        constraints.smallest,
      ),
    );

    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
