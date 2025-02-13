// ignore_for_file: prefer-single-widget-per-file

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const YgAppBar2({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
  });

  /// The primary text displayed in the app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  final String? title;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// If set and [automaticallyImplyLeading] is true, then a [BackButton] will
  /// be shown instead of the [leading] widget when possible.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and even if [leading] is set, automatically try to deduce what the leading
  /// widget should be. If no leading widget can be automatically deduced, the
  /// [leading] will be shown.
  ///
  /// If false and [leading] is null, title will be centered.
  final bool automaticallyImplyLeading;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// These widgets are [YgIconButton]s representing common operations.
  final List<YgIconButton>? actions;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  final PreferredSizeWidget? bottom;

  /// Whether the title should be centered.
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;
    final Widget? title = _getTitle(context);
    final Widget? leading = _getLeading(context);
    final Widget? actions = _getActions();

    return Material(
      color: theme.backgroundColor,
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: YgAppBarRenderWidget(
          centerTitle: centerTitle || leading == null,
          gap: 5,
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: <Widget>[
            if (leading != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.leading,
                child: leading,
              ),
            if (title != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.title,
                child: title,
              ),
            if (actions != null)
              YgAppBarChildWidget(
                slot: YgAppBarSlot.trailing,
                child: actions,
              ),
          ],
        ),
      ),
    );
  }

  Widget? _getLeading(BuildContext context) {
    if (automaticallyImplyLeading) {
      // ignore: avoid-dynamic
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      if (parentRoute?.canPop == true || parentRoute?.impliesAppBarDismissal == true) {
        return YgIconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: YgIcons.caretLeft,
        );
      }
    }

    if (leading != null) {
      return leading;
    }

    return null;
  }

  Widget? _getTitle(BuildContext context) {
    final String? title = this.title;

    if (title != null) {
      return Semantics(
        namesRoute: true,
        header: true,
        child: Text(
          title,
          style: context.appBarTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return null;
  }

  Widget? _getActions() {
    final List<YgIconButton>? actions = this.actions;

    if (actions != null && actions.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: actions,
      );
    }

    return null;
  }

  // Only here for legacy usecases, is not actually used in layout.
  @override
  Size get preferredSize => const Size.fromHeight(64);
}

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

enum YgAppBarSlot {
  trailing,
  leading,
  title,
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
  })  : _gap = gap,
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
        maxWidth: availableConstraints.maxWidth - usedSpace,
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

  Offset get offset {
    return (parentData as YgAppBarRendererParentData).offset;
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
