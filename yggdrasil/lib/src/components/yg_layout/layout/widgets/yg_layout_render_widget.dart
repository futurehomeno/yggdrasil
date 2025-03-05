import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

/// Internal widget responsible for positioning the content and header of the
/// layout.
class YgLayoutRenderWidget extends MultiChildRenderObjectWidget {
  const YgLayoutRenderWidget({
    super.key,
    super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgLayoutRenderer();
  }
}

class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {}

class _YgLayoutRenderer extends RenderBox
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
    size = constraints.biggest;
    final BoxConstraints childConstraints = BoxConstraints.tight(size);

    // Layout in opposite order of paint order.
    for (RenderBox? child = lastChild; child != null; child = childBefore(child)) {
      child.layout(childConstraints);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(
      result,
      position: position,
    );
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }
}
