import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YgOverlayRenderWidget extends MultiChildRenderObjectWidget {
  const YgOverlayRenderWidget({
    super.key,
    super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgOverlayRenderer();
  }
}

class YgOverlayParentData extends ContainerBoxParentData<RenderBox> {
  RenderBox? target;
  Rect? targetRect;
}

class YgOverlayRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgOverlayParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgOverlayParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgOverlayParentData();
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    final RenderBox? firstChild = this.firstChild;

    if (firstChild == null) {
      return;
    }

    firstChild.layout(constraints);

    for (RenderBox? child = childAfter(firstChild); child != null; child = childAfter(child)) {
      final YgOverlayParentData? parentData = child.parentData as YgOverlayParentData?;
      final RenderBox? target = parentData?.target;

      if (parentData != null && target != null) {
        parentData.targetRect = target.localToGlobal(Offset.zero) & target.size;
      }

      child.layout(constraints);
    }
  }
}
