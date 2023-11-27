import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Lays out the title, tag and trailing for the section header.
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

  /// Whether there is a tag.
  final bool tag;

  /// Whether there is a trailing.
  final bool trailing;

  /// The gap between the widgets.
  final double gap;

  /// The minimum width that the tag should be allowed to use.
  ///
  /// This is not the minimum width of the tag, if the tag needs less space than
  /// this it will use less space. If the title does not take up all the
  /// available space the tag is allowed to expand beyond this amount. Only when
  /// both the title and tag take up more than the available width will this
  /// number dictate the width of the tag.
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

  // region Values

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

  // endregion

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

    // Trailing will always be the last child if it exists, tag will always be
    // after the title if it exists.
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

    // If there's no title, there's nothing to layout.
    if (title == null) {
      return;
    }

    // Copy the constraints of the parent widget, except allow the child widgets
    // to have a width as small as they want.
    final BoxConstraints childConstraints = constraints.copyWith(
      minWidth: 0,
    );

    double availableWidth = childConstraints.maxWidth;
    double height = 0;

    // If there's a trailing widget, lay it out and subtract its width from the.
    // available width.
    if (trailing != null) {
      trailing.layout(childConstraints, parentUsesSize: true);
      availableWidth -= trailing.size.width + _gap;

      // Update the height if the trailing widget is taller than the current height.
      if (trailing.size.height > height) {
        height = trailing.size.height;
      }
    }

    // If there's a tag, get its preferred size and subtract its width from the
    // available width.
    if (tag != null) {
      // We have another gap between the title and tag.
      availableWidth -= _gap;

      final Size preferredSize = tag.getDryLayout(
        childConstraints.copyWith(
          maxWidth: availableWidth,
        ),
      );

      // Use the min width, except if the min width is more than half of the
      // total section width.
      final double minimumWidth = min(
        min(
          _minAvailableTagWidth,
          preferredSize.width,
        ),
        availableWidth * 0.5,
      );

      availableWidth -= minimumWidth;
    }

    // Layout the title with the remaining width.
    title.layout(
      childConstraints.copyWith(
        maxWidth: availableWidth,
      ),
      parentUsesSize: true,
    );

    // Update the height if the title is taller than the current height.
    if (title.size.height > height) {
      height = title.size.height;
    }

    // If there's a tag, lay it out with the remaining width after subtracting
    // the title and trailing widths.
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

      // Update the height if the tag is taller than the current height
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

    // If there's no title, there's nothing to paint.
    if (title == null) {
      return;
    }

    // Paint the title at the top left.
    title.paint(context, offset);

    // If there's a trailing widget, paint it at the right edge.
    if (trailing != null) {
      trailing.paint(
        context,
        Offset(
          (offset.dx + constraints.maxWidth) - trailing.size.width,
          offset.dy,
        ),
      );
    }

    // If there's a tag, paint it to the left of the trailing widget (or at the
    // right edge if there's no trailing widget).
    if (tag != null) {
      double xOffset = offset.dx + constraints.maxWidth - tag.size.width;

      // If there's a trailing widget, adjust the xOffset for the tag
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
