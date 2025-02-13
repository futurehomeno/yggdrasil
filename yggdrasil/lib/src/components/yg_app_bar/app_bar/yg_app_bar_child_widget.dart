import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_render_widget.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_slot.dart';

class YgAppBarChildWidget extends ParentDataWidget<YgAppBarRendererParentData> {
  YgAppBarChildWidget({
    Key? key,
    required super.child,
    required this.slot,
  }) : super(
          key: key ?? ValueKey<YgAppBarSlot>(slot),
        );

  final YgAppBarSlot slot;

  @override
  void applyParentData(RenderObject renderObject) {
    final ParentData? parentData = renderObject.parentData;
    assert(
      parentData is YgAppBarRendererParentData,
      'LayoutChildWidget has to be a direct child of YgLayoutRenderWidget',
    );

    if (parentData is! YgAppBarRendererParentData) {
      return;
    }

    parentData.slot = slot;
  }

  @override
  Type get debugTypicalAncestorWidgetClass => YgAppBarRenderWidget;
}
