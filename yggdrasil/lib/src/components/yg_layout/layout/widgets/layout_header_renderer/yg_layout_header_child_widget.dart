import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'yg_layout_header_render_widget.dart';
import 'yg_layout_header_slot.dart';

/// Internal widget which add a slot to its child.
class YgLayoutHeaderChildWidget extends ParentDataWidget<YgLayoutHeaderRendererParentData> {
  const YgLayoutHeaderChildWidget({
    super.key,
    required super.child,
    required this.slot,
  });

  final YgLayoutHeaderSlot slot;

  @override
  void applyParentData(RenderObject renderObject) {
    final ParentData? parentData = renderObject.parentData;
    assert(
      parentData is YgLayoutHeaderRendererParentData,
      'LayoutChildWidget has to be a direct child of YgLayoutRenderWidget',
    );

    if (parentData is! YgLayoutHeaderRendererParentData) {
      return;
    }

    parentData.slot = slot;
  }

  @override
  Type get debugTypicalAncestorWidgetClass => YgLayoutHeaderRenderWidget;
}
