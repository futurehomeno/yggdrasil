import 'dart:math';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

import 'yg_layout_header_slot.dart';

class YgLayoutHeaderRenderWidget extends MultiChildRenderObjectWidget {
  const YgLayoutHeaderRenderWidget({
    super.key,
    required super.children,
    required this.controller,
    required this.headerColor,
    required this.behavior,
    required this.padding,
  });

  final YgLayoutHeaderController controller;
  final Color headerColor;
  final YgHeaderBehavior behavior;
  final EdgeInsets padding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgLayoutHeaderRenderer(
      controller: controller,
      headerColor: headerColor,
      viewPadding: padding,
      headerBehavior: behavior,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgLayoutHeaderRenderer renderObject) {
    renderObject.controller = controller;
    renderObject.headerColor = headerColor;
    renderObject.headerBehavior = behavior;
    renderObject.viewPadding = padding;
  }
}

class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {
  YgLayoutHeaderSlot? slot;
}

class YgLayoutHeaderRenderer extends RenderBox with ContainerRenderObjectMixin<RenderBox, YgLayoutRendererParentData> {
  YgLayoutHeaderRenderer({
    required YgLayoutHeaderController controller,
    required EdgeInsets viewPadding,
    required Color headerColor,
    required YgHeaderBehavior headerBehavior,
  })  : _controller = controller,
        _viewPadding = viewPadding,
        _headerColor = headerColor,
        _headerBehavior = headerBehavior;

  // region Properties

  YgLayoutHeaderController _controller;
  YgLayoutHeaderController get controller => _controller;
  set controller(YgLayoutHeaderController controller) {
    if (_controller != controller) {
      _controller.removeListener(markNeedsPaint);
      _controller = controller;
      _controller.addListener(markNeedsPaint);
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
  bool get isRepaintBoundary => true;

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgLayoutRendererParentData();
  }

  @override
  void performLayout() {
    // Size is always the same.
    size = constraints.biggest;

    final _Children(
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
    _setPadding(
      EdgeInsets.only(
        top: headerExpandedHeight,
      ),
    );

    controller.setCollapsibleHeight(
      switch (headerBehavior) {
        YgHeaderBehavior.static => 0,
        YgHeaderBehavior.hideAppBar when trailing != null => appBarHeight,
        _ => headerExpandedHeight,
      },
    );
  }

  /// Set padding on parent padding provider.
  void _setPadding(EdgeInsets padding) {
    for (RenderObject? current = parent; current != null; current = current.parent) {
      if (current is YgInheritedRenderPaddingProviderMixin) {
        current.setPadding(padding);

        return;
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final _Children(
      :RenderBox? appBar,
      :RenderBox? loading,
      :RenderBox? shadow,
      :RenderBox? trailing,
    ) = _getChildren();

    final double t = controller.headerOffsetFraction.value;
    final double topPadding = viewPadding.top;

    // We set the offset of every child on the parent data rather than just
    // adding it to the paint offset when painting because we need the offsets
    // for the hit tests.

    if (appBar != null) {
      appBar.offset = Offset(
        0,
        switch (headerBehavior) {
          YgHeaderBehavior.static => topPadding,
          YgHeaderBehavior.hideAppBar || YgHeaderBehavior.hideEverything => lerpDouble(
              topPadding,
              -(appBar.size.height + (trailing?.size.height ?? 0)),
              t,
            )!,
        },
      );
    }

    if (trailing != null) {
      if (appBar == null) {
        // TODO: this is wrong
        trailing.offset = Offset(0, topPadding);
      } else {
        final double offset = appBar.size.height + appBar.offset.dy;

        trailing.offset = Offset(
          0,
          switch (headerBehavior) {
            YgHeaderBehavior.static || YgHeaderBehavior.hideEverything => offset,
            YgHeaderBehavior.hideAppBar => topPadding + lerpDouble(appBar.size.height, 0, t)!,
          },
        );
      }
    }

    final double headerHeight;
    if (trailing != null) {
      headerHeight = trailing.offset.dy + trailing.size.height;
    } else if (appBar != null) {
      headerHeight = appBar.offset.dy + appBar.size.height;
    } else {
      headerHeight = 0;
    }
    if (headerHeight > 0) {
      context.canvas.drawRect(
        offset & Size(size.width, headerHeight),
        Paint()..color = headerColor,
      );
    }

    appBar?.paintWithParentOffset(context, offset);
    trailing?.paintWithParentOffset(context, offset);

    if (shadow != null) {
      shadow.offset = Offset(
        0,
        headerHeight,
      );

      shadow.paintWithParentOffset(context, offset);
    }

    if (loading != null) {
      loading.offset = const Offset(
        0,
        0, //max(headerHeight - 1, 0),
      );

      loading.paintWithParentOffset(context, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final _Children(
      :RenderBox? appBar,
      :RenderBox? trailing,
    ) = _getChildren();

    if (trailing?.hitTestWithParentOffset(result, position: position) == true) {
      return true;
    }

    if (appBar?.hitTestWithParentOffset(result, position: position) == true) {
      return true;
    }

    return false;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _controller.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _controller.removeListener(markNeedsLayout);
    super.detach();
  }

  _Children _getChildren() {
    RenderBox? appBar;
    RenderBox? trailing;
    RenderBox? loading;
    RenderBox? shadow;

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      final YgLayoutHeaderSlot? slot = child.slot;

      switch (slot) {
        case YgLayoutHeaderSlot.appBar:
          assert(
            appBar == null,
            'Can not have more than one child widget with slot appBar',
          );
          appBar = child;
          break;
        case YgLayoutHeaderSlot.trailing:
          assert(
            trailing == null,
            'Can not have more than one child widget with slot trailing',
          );
          trailing = child;
          break;
        case YgLayoutHeaderSlot.loading:
          assert(
            loading == null,
            'Can not have more than one child widget with slot loading',
          );
          loading = child;
          break;
        case YgLayoutHeaderSlot.shadow:
          assert(
            shadow == null,
            'Can not have more than one child widget with slot shadow',
          );
          shadow = child;
          break;
        default:
          assert(
            false,
            'Any direct child of YgLayoutRenderWidget has to be a YgLayoutChildWidget',
          );
          // Ignore widgets without slot.
          break;
      }
    }

    return _Children(
      appBar: appBar,
      trailing: trailing,
      loading: loading,
      shadow: shadow,
    );
  }
}

class _Children {
  const _Children({
    required this.appBar,
    required this.trailing,
    required this.loading,
    required this.shadow,
  });

  final RenderBox? appBar;
  final RenderBox? trailing;
  final RenderBox? loading;
  final RenderBox? shadow;
}

// Internal extensions to make working with the child renderers easier.
extension on RenderBox {
  YgLayoutHeaderSlot? get slot {
    return (parentData as YgLayoutRendererParentData).slot;
  }

  Offset get offset {
    return (parentData as YgLayoutRendererParentData).offset;
  }

  set offset(Offset offset) {
    (parentData as YgLayoutRendererParentData).offset = offset;
  }

  void paintWithParentOffset(PaintingContext context, Offset offset) {
    context.paintChild(
      this,
      offset + this.offset,
    );
  }

  bool hitTestWithParentOffset(
    BoxHitTestResult result, {
    required Offset position,
  }) {
    return result.addWithPaintOffset(
      offset: offset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) {
        return hitTest(result, position: transformed);
      },
    );
  }
}
