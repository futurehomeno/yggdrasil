import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_app_bar/app_bar/yg_app_bar_slot.dart';

/// Internal widget used to position the widgets in the app bar.
class YgAppBarRenderWidget extends MultiChildRenderObjectWidget {
  const YgAppBarRenderWidget({
    super.key,
    super.children,
    required this.gap,
    required this.padding,
    required this.height,
    required this.centerTitle,
  });

  final double gap;
  final EdgeInsets padding;
  final double height;
  final bool centerTitle;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgAppBarRenderer(
      gap: gap,
      padding: padding,
      height: height,
      centerTitle: centerTitle,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgAppBarRenderer renderObject) {
    renderObject.gap = gap;
    renderObject.padding = padding;
    renderObject.height = height;
    renderObject.centerTitle = centerTitle;
  }
}

class YgAppBarRendererParentData extends ContainerBoxParentData<RenderBox> {
  YgAppBarSlot? slot;
}

class YgAppBarRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgAppBarRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgAppBarRendererParentData> {
  YgAppBarRenderer({
    required double gap,
    required EdgeInsets padding,
    required double height,
    required bool centerTitle,
  }) : _gap = gap,
       _padding = padding,
       _height = height,
       _centerTitle = centerTitle;

  // region Values

  double _gap;
  double get gap => _gap;
  set gap(double newValue) {
    if (_gap == newValue) {
      return;
    }
    _gap = newValue;
    markNeedsLayout();
  }

  EdgeInsets _padding;
  EdgeInsets get padding => _padding;
  set padding(EdgeInsets newValue) {
    if (_padding == newValue) {
      return;
    }
    _padding = newValue;
    markNeedsLayout();
  }

  double _height;
  double get height => _height;
  set height(double newValue) {
    if (_height == newValue) {
      return;
    }
    _height = newValue;
    markNeedsLayout();
  }

  bool _centerTitle;
  bool get centerTitle => _centerTitle;
  set centerTitle(bool newValue) {
    if (_centerTitle == newValue) {
      return;
    }
    _centerTitle = newValue;
    markNeedsLayout();
  }

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgAppBarRendererParentData();
  }

  @override
  void performLayout() {
    final _Children(
      :RenderBox? leading,
      :RenderBox? title,
      :RenderBox? trailing,
    ) = _getChildren();

    size = constraints.constrain(
      Size(
        constraints.maxWidth,
        _height + padding.vertical,
      ),
    );

    final double availableHeight = max(0, size.height - padding.vertical);

    BoxConstraints availableConstraints = BoxConstraints(
      maxHeight: availableHeight,
      maxWidth: max(0, constraints.maxWidth - padding.horizontal),
      minHeight: 0,
      minWidth: 0,
    );

    double leftTitlePadding = _padding.left;
    double rightTitlePadding = _padding.right;

    if (leading != null) {
      leading.layout(
        availableConstraints,
        parentUsesSize: true,
      );

      final double usedSpace = leading.size.width + _gap;

      leftTitlePadding += usedSpace;
      availableConstraints = availableConstraints.copyWith(
        maxWidth: availableConstraints.maxWidth - usedSpace,
      );

      leading.offset = Offset(
        _padding.left,
        ((availableHeight - leading.size.height) / 2) + _padding.top,
      );
    }

    if (trailing != null) {
      trailing.layout(
        availableConstraints,
        parentUsesSize: true,
      );

      final double usedSpace = trailing.size.width + _gap;

      rightTitlePadding += usedSpace;
      availableConstraints = availableConstraints.copyWith(
        maxWidth: max(0, availableConstraints.maxWidth - usedSpace),
      );

      trailing.offset = Offset(
        size.width - _padding.right - trailing.size.width,
        ((availableHeight - trailing.size.height) / 2) + _padding.top,
      );
    }

    if (title != null) {
      title.layout(
        availableConstraints,
        parentUsesSize: true,
      );

      final double titleYOffset = ((availableHeight - title.size.height) / 2) + _padding.top;
      if (centerTitle) {
        double titleXOffset = (size.width - title.size.width) / 2;
        if (titleXOffset + title.size.width > size.width - rightTitlePadding) {
          titleXOffset = size.width - rightTitlePadding - title.size.width;
        } else if (leftTitlePadding > titleXOffset) {
          titleXOffset = leftTitlePadding;
        }

        title.offset = Offset(
          titleXOffset,
          titleYOffset,
        );
      } else {
        title.offset = Offset(
          leftTitlePadding,
          titleYOffset,
        );
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(
      result,
      position: position,
    );
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  _Children _getChildren() {
    RenderBox? title;
    RenderBox? leading;
    RenderBox? trailing;

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      final YgAppBarSlot? slot = child.slot;

      switch (slot) {
        case YgAppBarSlot.leading:
          assert(
            leading == null,
            'Can not have more than one child widget with slot leading',
          );
          leading = child;
          break;

        case YgAppBarSlot.trailing:
          assert(
            trailing == null,
            'Can not have more than one child widget with slot trailing',
          );
          trailing = child;
          break;

        case YgAppBarSlot.title:
          assert(
            title == null,
            'Can not have more than one child widget with slot title',
          );
          title = child;
          break;

        default:
          assert(
            slot != null,
            'Any direct child of YgLayoutRenderWidget has to be a YgLayoutChildWidget',
          );
          // Ignore widgets without slot.
          break;
      }
    }

    return _Children(
      title: title,
      leading: leading,
      trailing: trailing,
    );
  }
}

extension on RenderBox {
  YgAppBarSlot? get slot {
    return (parentData as YgAppBarRendererParentData).slot;
  }

  set offset(Offset offset) {
    (parentData as YgAppBarRendererParentData).offset = offset;
  }
}

class _Children {
  const _Children({
    required this.title,
    required this.leading,
    required this.trailing,
  });

  final RenderBox? title;
  final RenderBox? leading;
  final RenderBox? trailing;
}
