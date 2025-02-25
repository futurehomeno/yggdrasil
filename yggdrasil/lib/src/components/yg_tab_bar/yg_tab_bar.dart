import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'tab/yg_tab.dart';

class YgTabBar extends StatelessWidget implements PreferredSizeWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
  });

  final TabController? controller;
  final List<YgTab> tabs;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: YgTabBarRenderWidget(
                  minWidth: constraints.maxWidth,
                  children: tabs,
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: theme.dividerHeight,
          child: ColoredBox(color: theme.dividerColor),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}

// ignore: prefer-single-widget-per-file
class YgTabBarRenderWidget extends MultiChildRenderObjectWidget {
  const YgTabBarRenderWidget({
    super.key,
    required super.children,
    // required this.controller,
    required this.minWidth,
  });

  // final TabController controller;
  final double minWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgTabBarRenderer(
      minWidth: minWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgTabBarRenderer renderObject) {
    renderObject.minWidth = minWidth;
  }
}

class YgTabBarRendererParentData extends ContainerBoxParentData<RenderBox> {
  Size? desiredSize;
  Size? givenSize;
}

class YgTabBarRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgTabBarRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgTabBarRendererParentData> {
  YgTabBarRenderer({
    required double minWidth,
  }) : _minWidth = minWidth;

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgTabBarRendererParentData();
  }

  double _minWidth;
  double get minWidth => _minWidth;
  set minWidth(double newValue) {
    if (_minWidth == newValue) {
      return;
    }

    _minWidth = newValue;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final List<RenderBox> children = getChildrenAsList();

    double totalMinWidth = 0;
    double totalWidth = 0;
    double totalHeight = 0;

    for (final RenderBox child in children) {
      final Size preferredSize = child.getDryLayout(
        constraints.copyWith(
          minWidth: 0,
          maxWidth: constraints.maxWidth - totalMinWidth,
        ),
      );

      child.desiredSize = preferredSize;
      totalMinWidth += preferredSize.width;

      if (preferredSize.height > totalHeight) {
        totalHeight = preferredSize.height;
      }
    }

    children.sort(
      (RenderBox a, RenderBox b) => b.desiredSize!.width.compareTo(
        a.desiredSize!.width,
      ),
    );

    for (int i = 0; i < childCount; i++) {
      final RenderBox child = children[i];
      final int remainingChildren = children.length - i;
      final Size preferredSize = child.desiredSize!;
      final double preferredWidth = (_minWidth - totalWidth) / remainingChildren;
      final double actualWidth = max(preferredWidth, preferredSize.width);
      final Size givenSize = Size(actualWidth, totalHeight);
      final BoxConstraints childConstraints = BoxConstraints.tight(givenSize);

      child.givenSize = givenSize;
      child.layout(childConstraints);
      totalWidth += actualWidth;
    }

    double currentXOffset = 0;

    // The children array is in the wrong order for layout so we loop over them
    // manually.
    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      child.offset = Offset(currentXOffset, 0);
      currentXOffset += child.givenSize!.width;
    }

    size = Size(
      totalWidth,
      totalHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
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

extension on RenderBox {
  Size? get desiredSize {
    return (parentData as YgTabBarRendererParentData).desiredSize;
  }

  set desiredSize(Size? value) {
    (parentData as YgTabBarRendererParentData).desiredSize = value;
  }

  Size? get givenSize {
    return (parentData as YgTabBarRendererParentData).givenSize;
  }

  set givenSize(Size? value) {
    (parentData as YgTabBarRendererParentData).givenSize = value;
  }

  set offset(Offset value) {
    (parentData as YgTabBarRendererParentData).offset = value;
  }
}
