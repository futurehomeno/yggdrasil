// ignore_for_file: prefer-single-widget-per-file

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

class YgLayoutRenderWidget extends MultiChildRenderObjectWidget {
  const YgLayoutRenderWidget({
    super.key,
    required super.children,
    required this.controller,
    required this.headerColor,
    required this.behavior,
  });

  final YgLayoutController controller;
  final Color headerColor;
  final YgHeaderBehavior behavior;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgLayoutRenderer(
      controller: controller,
      headerColor: headerColor,
      viewPadding: MediaQuery.paddingOf(context),
      headerBehavior: behavior,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgLayoutRenderer renderObject) {
    renderObject.controller = controller;
    renderObject.headerColor = headerColor;
    renderObject.headerBehavior = behavior;
    renderObject.viewPadding = MediaQuery.paddingOf(context);
  }
}

class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {
  YgLayoutSlot? slot;
}

class YgLayoutRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgLayoutRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgLayoutRendererParentData>,
        YgInheritedRenderPaddingProviderMixin {
  YgLayoutRenderer({
    required YgLayoutController controller,
    required EdgeInsets viewPadding,
    required Color headerColor,
    required YgHeaderBehavior headerBehavior,
  })  : _controller = controller,
        _viewPadding = viewPadding,
        _headerColor = headerColor,
        _headerBehavior = headerBehavior;

  // region Properties

  YgLayoutController _controller;
  YgLayoutController get controller => _controller;
  set controller(YgLayoutController controller) {
    if (_controller != controller) {
      _controller = controller;
      markNeedsLayout();
    }
  }

  EdgeInsets _viewPadding;
  EdgeInsets get viewPadding => _viewPadding;
  set viewPadding(EdgeInsets viewPadding) {
    if (_viewPadding != viewPadding) {
      _viewPadding = viewPadding;
      markNeedsLayout();
    }
  }

  Color _headerColor;
  Color get headerColor => _headerColor;
  set headerColor(Color headerColor) {
    if (_headerColor != headerColor) {
      _headerColor = headerColor;
      markNeedsPaint();
    }
  }

  YgHeaderBehavior _headerBehavior;
  YgHeaderBehavior get headerBehavior => _headerBehavior;
  set headerBehavior(YgHeaderBehavior headerBehavior) {
    if (_headerBehavior != headerBehavior) {
      _headerBehavior = headerBehavior;
      markNeedsLayout();
    }
  }

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgLayoutRendererParentData();
  }

  @override
  void performLayout() {
    // Size is always the same.
    size = constraints.biggest;

    final _Children(
      :RenderBox? content,
      :RenderBox? appBar,
      :RenderBox? loading,
      :RenderBox? shadow,
      :RenderBox? trailing,
    ) = _getChildren();

    final double topPadding = viewPadding.top;
    double headerExpandedHeight = topPadding;

    final double appBarHeight;
    if (appBar == null) {
      appBarHeight = 0;
    } else {
      appBar.layout(
        BoxConstraints(
          minHeight: 0,
          maxHeight: max(0, constraints.maxHeight - headerExpandedHeight),
          maxWidth: constraints.maxWidth,
          minWidth: constraints.maxWidth,
        ),
        parentUsesSize: true,
      );

      appBarHeight = appBar.size.height;
      headerExpandedHeight += appBarHeight;
    }

    final double trailingHeight;
    if (trailing == null) {
      trailingHeight = 0;
    } else {
      trailing.layout(
        BoxConstraints(
          minHeight: 0,
          maxHeight: max(0, constraints.maxHeight - headerExpandedHeight),
          maxWidth: constraints.maxWidth,
          minWidth: constraints.maxWidth,
        ),
        parentUsesSize: true,
      );

      trailingHeight = trailing.size.height;
      headerExpandedHeight += trailingHeight;
    }

    // Shadow does not take up space and should be painted over the content.
    if (shadow != null) {
      shadow.layout(BoxConstraints(
        minHeight: 0,
        maxHeight: max(0, constraints.maxHeight - headerExpandedHeight),
        maxWidth: constraints.maxWidth,
        minWidth: constraints.maxWidth,
      ));
    }

    // Loading does also not take up space and is painted over the content /
    // shadow and a part of the header.
    if (loading != null) {
      loading.layout(
        BoxConstraints(
          minHeight: 0,
          maxHeight: max(0, constraints.maxHeight - headerExpandedHeight),
          maxWidth: constraints.maxWidth,
          minWidth: constraints.maxWidth,
        ),
      );
    }

    // Padding must be set before content is laid out.
    setPadding(
      EdgeInsets.only(
        top: headerExpandedHeight,
      ),
    );

    // Content should always exist.
    assert(
      content != null,
      'Content is missing from YgLayoutRenderWidget, pleas add a child widget with the content slot type',
    );
    if (content != null) {
      content.layout(
        BoxConstraints.tight(
          constraints.biggest,
        ),
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final _Children(
      :RenderBox? content,
      :RenderBox? appBar,
      :RenderBox? loading,
      :RenderBox? shadow,
      :RenderBox? trailing,
    ) = _getChildren();

    // Content should be painted first.
    if (content != null) {
      context.paintChild(content, offset);
    }

    final double t = controller.headerOffset.value;
    final double topPadding = viewPadding.top;

    if (appBar != null) {
      appBar.offset = Offset(
        0,
        switch (headerBehavior) {
          YgHeaderBehavior.static => topPadding,
          YgHeaderBehavior.hideAppBar || YgHeaderBehavior.hideEverything => lerpDouble(
              topPadding,
              -appBar.size.height,
              t,
            )!,
        },
      );
    }

    if (trailing != null) {
      if (appBar == null) {
        trailing.offset = Offset(0, topPadding);
      } else {
        final double offset = appBar.size.height + appBar.offset.dy;

        trailing.offset = Offset(
          0,
          switch (headerBehavior) {
            YgHeaderBehavior.static || YgHeaderBehavior.hideEverything => offset,
            YgHeaderBehavior.hideAppBar => lerpDouble(offset, topPadding, t)!,
          },
        );
      }
    }

    final double headerHeight = trailing?.offset.dy ?? appBar?.offset.dy ?? 0;
    if (headerHeight > 0) {
      context.canvas.drawRect(
        offset & Size(size.width, headerHeight),
        Paint()..color = headerColor,
      );
    }

    context.defaultPaint(appBar, offset);
    context.defaultPaint(trailing, offset);

    if (shadow != null) {
      shadow.offset = Offset(
        0,
        headerHeight,
      );

      context.defaultPaint(shadow, offset);
    }

    if (loading != null) {
      loading.offset = Offset(
        0,
        headerHeight - 1,
      );

      context.defaultPaint(loading, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  _Children _getChildren() {
    RenderBox? appBar;
    RenderBox? trailing;
    RenderBox? loading;
    RenderBox? shadow;
    RenderBox? content;

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      final YgLayoutSlot? slot = child.slot;

      switch (slot) {
        case YgLayoutSlot.appBar:
          assert(
            appBar == null,
            'Can not have more than one child widget with slot appBar',
          );
          appBar = child;
          break;
        case YgLayoutSlot.trailing:
          assert(
            trailing == null,
            'Can not have more than one child widget with slot trailing',
          );
          trailing = child;
          break;
        case YgLayoutSlot.loading:
          assert(
            loading == null,
            'Can not have more than one child widget with slot loading',
          );
          loading = child;
          break;
        case YgLayoutSlot.shadow:
          assert(
            shadow == null,
            'Can not have more than one child widget with slot shadow',
          );
          shadow = child;
          break;
        case YgLayoutSlot.content:
          assert(
            content == null,
            'Can not have more than one child widget with slot content',
          );
          content = child;
          break;
        default:
          // Ignore widgets without slot.
          break;
      }
    }

    return _Children(
      appBar: appBar,
      trailing: trailing,
      loading: loading,
      shadow: shadow,
      content: content,
    );
  }
}

class LayoutChildWidget extends ParentDataWidget<YgLayoutRendererParentData> {
  const LayoutChildWidget({
    super.key,
    required super.child,
    required this.slot,
  });

  final YgLayoutSlot slot;

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
  Type get debugTypicalAncestorWidgetClass => YgLayoutRenderWidget;
}

enum YgLayoutSlot {
  appBar,
  trailing,
  loading,
  shadow,
  content,
}

class _Children {
  const _Children({
    required this.appBar,
    required this.trailing,
    required this.loading,
    required this.shadow,
    required this.content,
  });

  final RenderBox? appBar;
  final RenderBox? trailing;
  final RenderBox? loading;
  final RenderBox? shadow;
  final RenderBox? content;
}

extension on PaintingContext {
  void defaultPaint(RenderBox? child, Offset offset) {
    if (child == null) {
      return;
    }

    paintChild(child, child.offset + offset);
  }
}

extension on RenderBox {
  YgLayoutSlot? get slot {
    return (parentData as YgLayoutRendererParentData).slot;
  }

  Offset get offset {
    return (parentData as YgLayoutRendererParentData).offset;
  }

  set offset(Offset offset) {
    (parentData as YgLayoutRendererParentData).offset = offset;
  }
}
