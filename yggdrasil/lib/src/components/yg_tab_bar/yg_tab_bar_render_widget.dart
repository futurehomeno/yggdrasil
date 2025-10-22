import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Internal widget responsible for positioning and sizing Tabs. Also paints indicator.
class YgTabBarRenderWidget extends MultiChildRenderObjectWidget {
  const YgTabBarRenderWidget({
    super.key,
    required super.children,
    required this.controller,
    required this.minWidth,
    required this.indicatorStyle,
  });

  final TabController controller;
  final double minWidth;
  final YgTabIndicatorStyle indicatorStyle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgTabBarRenderer(
      minWidth: minWidth,
      controller: controller,
      indicatorStyle: indicatorStyle,
      imageConfiguration: createLocalImageConfiguration(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgTabBarRenderer renderObject) {
    renderObject.minWidth = minWidth;
    renderObject.controller = controller;
    renderObject.indicatorStyle = indicatorStyle;
    renderObject.imageConfiguration = createLocalImageConfiguration(context);
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
    required TabController controller,
    required YgTabIndicatorStyle indicatorStyle,
    required ImageConfiguration imageConfiguration,
  }) : _minWidth = minWidth,
       _controller = controller,
       _indicatorStyle = indicatorStyle,
       _imageConfiguration = imageConfiguration;

  // region Values

  double _minWidth;
  double get minWidth => _minWidth;
  set minWidth(double newValue) {
    if (_minWidth == newValue) {
      return;
    }

    _minWidth = newValue;
    markNeedsLayout();
  }

  TabController _controller;
  TabController get controller => _controller;
  set controller(TabController newValue) {
    if (_controller == newValue) {
      return;
    }

    _controller.animation?.removeListener(markNeedsPaint);
    _controller = newValue;
    _controller.animation?.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  BoxPainter? _painter;

  YgTabIndicatorStyle _indicatorStyle;
  YgTabIndicatorStyle get indicatorStyle => _indicatorStyle;
  set indicatorStyle(YgTabIndicatorStyle newValue) {
    if (_indicatorStyle == newValue) {
      return;
    }

    if (_indicatorStyle.decoration != newValue.decoration) {
      _painter?.dispose();
      _painter = null;
    }

    _indicatorStyle = newValue;
    markNeedsPaint();
  }

  ImageConfiguration _imageConfiguration;
  ImageConfiguration get imageConfiguration => _imageConfiguration;
  set imageConfiguration(ImageConfiguration newValue) {
    if (_imageConfiguration == newValue) {
      return;
    }

    _imageConfiguration = newValue;
    markNeedsPaint();
  }

  // endregion

  @override
  bool get isRepaintBoundary => true;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _controller.animation?.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _painter?.dispose();
    _painter = null;
    _controller.animation?.removeListener(markNeedsPaint);

    super.detach();
    markNeedsPaint();
  }

  @override
  void dispose() {
    _painter?.dispose();
    super.dispose();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgTabBarRendererParentData();
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

    _paintIndicator(
      context,
      offset,
    );
  }

  void _paintIndicator(
    PaintingContext context,
    Offset offset,
  ) {
    double start = 0;
    double width = 0;
    int index = 0;

    final double position = controller.animation?.value ?? 0;
    for (RenderBox? child = firstChild; child != null; child = childAfter(child), index++) {
      final double desiredWidth = child.desiredSize!.width;
      final double childWidth = child.givenSize!.width;
      final double offset = (position - index);

      if (offset > -1 && offset < 1) {
        final double multiplier = (1 - offset.abs());

        width += desiredWidth * multiplier;
        start += (childWidth - desiredWidth) / 2 * multiplier;
      }

      if (offset > 1) {
        start += childWidth;
      } else if (offset > 0) {
        start += childWidth * offset;
      } else {
        // No further children will be processed after this point.
        break;
      }
    }

    final double height = min(size.height, indicatorStyle.height);
    final Rect rect = indicatorStyle.padding.deflateRect(
      Rect.fromLTWH(
        offset.dx + start,
        offset.dy + size.height - height,
        width,
        height,
      ),
    );

    final BoxPainter painter = _painter ??= indicatorStyle.decoration.createBoxPainter(
      markNeedsPaint,
    );

    painter.paint(
      context.canvas,
      rect.topLeft,
      imageConfiguration.copyWith(
        size: rect.size,
      ),
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

/// Internal style for the tab indicator.
class YgTabIndicatorStyle {
  const YgTabIndicatorStyle({
    required this.padding,
    required this.height,
    required this.decoration,
  });

  final BoxDecoration decoration;
  final EdgeInsets padding;
  final double height;

  @override
  bool operator ==(Object other) {
    return other is YgTabIndicatorStyle &&
        other.padding == padding &&
        other.height == height &&
        other.decoration == decoration;
  }

  @override
  int get hashCode {
    return Object.hash(
      padding,
      height,
      decoration,
    );
  }
}
