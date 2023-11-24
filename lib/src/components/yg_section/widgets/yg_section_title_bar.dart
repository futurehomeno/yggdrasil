import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YgSectionTitleBar extends MultiChildRenderObjectWidget {
  YgSectionTitleBar({
    super.key,
    required Widget title,
    Widget? tag,
    Widget? trailing,
    required this.gap,
    required this.minAvailableTagWidth,
  })  : tag = tag != null,
        trailing = trailing != null,
        super(
          children: <Widget>[
            title,
            if (tag != null) tag,
            if (trailing != null) trailing,
          ],
        );

  final bool tag;
  final bool trailing;
  final double gap;
  final double minAvailableTagWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSectionTitleBarRenderer(
      tag: tag,
      trailing: trailing,
      gap: gap,
      minAvailableTagWidth: minAvailableTagWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSectionTitleBarRenderer renderObject) {
    renderObject.tag = tag;
    renderObject.trailing = trailing;
    renderObject.minAvailableTagWidth = minAvailableTagWidth;
    renderObject.gap = gap;
  }
}

class YgSectionTitleBarParentData extends ContainerBoxParentData<RenderBox> {}

class YgSectionTitleBarRenderer extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, YgSectionTitleBarParentData> {
  YgSectionTitleBarRenderer({
    required bool tag,
    required bool trailing,
    required double minAvailableTagWidth,
    required double gap,
  })  : _trailing = trailing,
        _tag = tag,
        _minAvailableTagWidth = minAvailableTagWidth,
        _gap = gap;

  double _minAvailableTagWidth;
  double get minAvailableTagWidth => _minAvailableTagWidth;
  set minAvailableTagWidth(double newValue) {
    if (_minAvailableTagWidth != newValue) {
      _minAvailableTagWidth = newValue;
      markNeedsLayout();
    }
  }

  double _gap;
  double get gap => _gap;
  set gap(double newValue) {
    if (_gap != newValue) {
      _gap = newValue;
      markNeedsLayout();
    }
  }

  bool _tag;
  bool get tag => _tag;
  set tag(bool newValue) {
    if (_tag != newValue) {
      _tag = newValue;
      markNeedsLayout();
    }
  }

  bool _trailing;
  bool get trailing => _trailing;
  set trailing(bool newValue) {
    if (_trailing != newValue) {
      _trailing = newValue;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgSectionTitleBarParentData();
  }

  ({
    RenderBox? tag,
    RenderBox? title,
    RenderBox? trailing,
  }) _getChildren() {
    final RenderBox? title = firstChild;

    if (title == null) {
      return (
        title: null,
        tag: null,
        trailing: null,
      );
    }

    return (
      title: title,
      tag: tag ? childAfter(title) : null,
      trailing: trailing ? lastChild : null,
    );
  }

  @override
  void performLayout() {
    final (
      :RenderBox? tag,
      :RenderBox? title,
      :RenderBox? trailing,
    ) = _getChildren();

    if (title == null) {
      return;
    }

    final BoxConstraints childConstraints = constraints.copyWith(
      minWidth: 0,
    );

    double availableWidth = childConstraints.maxWidth;
    double height = 0;

    if (trailing != null) {
      trailing.layout(childConstraints, parentUsesSize: true);
      availableWidth -= trailing.size.width + _gap;
      if (trailing.size.height > height) {
        height = trailing.size.height;
      }
    }

    if (tag != null) {
      final Size preferredSize = tag.getDryLayout(
        childConstraints.copyWith(
          maxWidth: availableWidth,
        ),
      );

      final double minimumWidth = min(
        _minAvailableTagWidth,
        preferredSize.width,
      );

      availableWidth -= minimumWidth;
    }

    title.layout(
      childConstraints.copyWith(
        maxWidth: availableWidth,
      ),
      parentUsesSize: true,
    );

    if (title.size.height > height) {
      height = title.size.height;
    }

    if (tag != null) {
      double tagWidth = childConstraints.maxWidth - title.size.width - _gap;

      if (trailing != null) {
        tagWidth -= trailing.size.width + _gap;
      }

      tag.layout(
        childConstraints.copyWith(
          maxWidth: tagWidth,
        ),
        parentUsesSize: true,
      );

      if (tag.size.height > height) {
        height = tag.size.height;
      }
    }

    size = Size(
      constraints.maxWidth,
      height,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final (
      :RenderBox? tag,
      :RenderBox? title,
      :RenderBox? trailing,
    ) = _getChildren();

    if (title == null) {
      return;
    }

    title.paint(context, offset);

    if (trailing != null) {
      trailing.paint(
        context,
        Offset(
          (offset.dx + constraints.maxWidth) - trailing.size.width,
          offset.dy,
        ),
      );
    }

    if (tag != null) {
      double xOffset = offset.dx + constraints.maxWidth - tag.size.width;

      if (trailing != null) {
        xOffset -= trailing.size.width + _gap;
      }

      tag.paint(
        context,
        Offset(
          xOffset,
          offset.dy,
        ),
      );
    }
  }
}
