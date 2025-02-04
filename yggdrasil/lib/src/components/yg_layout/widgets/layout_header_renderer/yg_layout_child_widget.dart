import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'yg_layout_header_render_widget.dart';
import 'yg_layout_header_slot.dart';

class YgLayoutChildWidget extends ParentDataWidget<YgLayoutRendererParentData> {
  const YgLayoutChildWidget({
    super.key,
    required super.child,
    required this.slot,
  });

  final YgLayoutHeaderSlot slot;

  @override
  void applyParentData(RenderObject renderObject) {
    final ParentData? parentData = renderObject.parentData;
    assert(
      parentData is YgLayoutRendererParentData,
      'LayoutChildWidget has to be a direct child of YgLayoutRenderWidget',
    );

    if (parentData is! YgLayoutRendererParentData) {
      return;
    }

    parentData.slot = slot;
  }

  @override
  Type get debugTypicalAncestorWidgetClass => YgLayoutHeaderRenderWidget;
}
