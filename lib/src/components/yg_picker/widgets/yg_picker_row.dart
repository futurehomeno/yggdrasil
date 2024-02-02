import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renders a list of widgets in a row.
///
/// This row keeps in mind the desired size of every widget and tries to equally
/// divide the available space between all [children] without giving a widget
/// more than its max intrinsic width and without leaving gaps between widgets.
class YgPickerRow extends MultiChildRenderObjectWidget {
  const YgPickerRow({
    super.key,
    required super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgRowRenderer();
  }
}

class YgRowRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgRowRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgRowRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgRowRendererParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgRowRendererParentData();
  }

  @override
  void performLayout() {
    final List<RenderBox> children = getChildrenAsList();
    final List<(RenderBox, double)> sizeObjectList = <(RenderBox, double)>[];

    for (final RenderBox child in children) {
      sizeObjectList.add((
        child,
        child.getMaxIntrinsicWidth(double.infinity),
      ));
    }

    sizeObjectList.sort(((RenderBox, double) a, (RenderBox, double) b) {
      return a.$2.compareTo(b.$2);
    });

    final Map<RenderBox, double> computedWidthMap = <RenderBox, double>{};

    double remainingMaxWidth = constraints.maxWidth;
    double totalChildWidth = 0;
    for (int i = 0; i < sizeObjectList.length; i++) {
      final (
        RenderBox child,
        double width,
      ) = sizeObjectList[i];

      final double currentAvailableWidth = remainingMaxWidth / (sizeObjectList.length - i);
      computedWidthMap[child] = min(currentAvailableWidth, width);
      remainingMaxWidth -= width;
      totalChildWidth += width;
    }

    final double remainingMinWidth = constraints.minWidth - totalChildWidth;
    if (remainingMinWidth > 0) {
      final double firstWidth = computedWidthMap[children.first] ?? 0;
      computedWidthMap[children.first] = firstWidth + (remainingMinWidth / 2);
      final double lastWidth = computedWidthMap[children.last] ?? 0;
      computedWidthMap[children.last] = lastWidth + (remainingMinWidth / 2);
    }

    for (final MapEntry<RenderBox, double>(key: RenderBox child, value: double width) in computedWidthMap.entries) {
      child.layout(
        constraints.copyWith(
          minHeight: 0,
          maxWidth: width,
          minWidth: width,
        ),
        parentUsesSize: true,
      );
    }

    double width = 0;
    double height = 0;
    for (final RenderBox child in children) {
      width += child.size.width;
      if (child.size.height > height) {
        height = child.size.height;
      }
    }

    double xOffset = (max(width, constraints.minWidth) - width) / 2;
    for (final RenderBox child in children) {
      final YgRowRendererParentData data = (child.parentData as YgRowRendererParentData);
      data.offset = Offset(
        xOffset,
        (height - child.size.height) / 2,
      );
      xOffset += child.size.width;
    }

    size = constraints.constrain(
      Size(
        width,
        height,
      ),
    );
  }

  double? computeDistanceToFirstActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(
      baseline,
    );
  }

  double? computeDistanceToHighestActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(
      baseline,
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

  @override
  void paint(PaintingContext context, Offset offset) {
    return defaultPaint(
      context,
      offset,
    );
  }
}
