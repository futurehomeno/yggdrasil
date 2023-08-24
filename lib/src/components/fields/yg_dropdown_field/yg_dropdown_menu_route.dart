import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/fields/extensions/dropdown_field/dropdown_field_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
class YgDropdownMenuRoute<T extends Object> extends PopupRoute<Widget> {
  YgDropdownMenuRoute({
    required this.allowDeselect,
    required this.currentValue,
    required this.entries,
    required this.onChange,
    required this.onClose,
    required this.rect,
  });

  final List<YgDropdownEntry<T>> entries;
  final ValueChanged<T?> onChange;
  final VoidCallback onClose;
  final T? currentValue;
  final bool allowDeselect;
  final Rect rect;

  BuildContext get context => navigator!.context;

  @override
  RouteSettings get settings => const RouteSettings(name: 'DropdownMenu');

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 225);

  @override
  Curve get barrierCurve => Curves.easeOut;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dropdown Menu';

  @override
  Future<RoutePopDisposition> willPop() {
    onClose();

    return super.willPop();
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return RepaintBoundary(
      child: RepaintBoundary(
        child: YgDropdownMenuPositioner(
          rect: rect,
          animation: animation.drive(CurveTween(curve: Curves.easeOut)),
          padding: MediaQuery.of(context).padding,
          // TODO(Tim): Find a different fix for whatever the hell is going on here
          child: RepaintBoundary(
            child: RepaintBoundary(
              child: YgDropdownMenu<T>(
                allowDeselect: allowDeselect,
                entries: entries,
                onChange: onChange,
                onClose: onClose,
                currentValue: currentValue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YgDropdownMenuPositioner extends SingleChildRenderObjectWidget {
  const YgDropdownMenuPositioner({
    super.key,
    required super.child,
    required this.rect,
    required this.animation,
    required this.padding,
  });

  final Animation<double> animation;
  final Rect rect;
  final EdgeInsets padding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgDropdownMenuPositionerRenderObject(
      rect: rect,
      animation: animation,
      padding: padding,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant YgDropdownMenuPositionerRenderObject renderObject,
  ) {
    renderObject.rect = rect;
    renderObject.animation = animation;
    renderObject.padding = padding;
  }
}

class YgDropdownMenuPositionerRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  YgDropdownMenuPositionerRenderObject({
    required Rect rect,
    required Animation<double> animation,
    required EdgeInsets padding,
  })  : _parentRect = rect,
        _animation = animation,
        _padding = padding;

  late Offset _offset;

  EdgeInsets _padding;
  EdgeInsets get padding => _padding;
  set padding(EdgeInsets padding) {
    if (_padding != padding) {
      _padding = padding;
      markNeedsLayout();
    }
  }

  Rect _parentRect;
  Rect get rect => _parentRect;
  set rect(Rect value) {
    if (_parentRect != value) {
      _parentRect = value;
      markNeedsLayout();
    }
  }

  Animation<double> _animation;
  Animation<double> get animation => _animation;
  set animation(Animation<double> animation) {
    if (_animation != animation) {
      _animation.removeListener(markNeedsLayout);
      _animation = animation;
      _animation.addListener(markNeedsLayout);
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void performLayout() {
    // TODO(Tim): add safe area padding
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    final double spaceToScreenBottom = constraints.maxHeight - _parentRect.bottom - padding.bottom;
    final double spaceToScreenTop = _parentRect.top - padding.top;
    final double maxHeight = max(spaceToScreenTop, spaceToScreenBottom);

    final Size targetSize = child.getDryLayout(
      BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: _parentRect.width,
        minWidth: _parentRect.width,
      ),
    );

    child.layout(
      BoxConstraints(
        maxHeight: targetSize.height * animation.value,
        maxWidth: _parentRect.width,
        minWidth: _parentRect.width,
      ),
      parentUsesSize: true,
    );

    // Since the child is constrained to either the top of bottom, if it's more
    // than bottom, it has to be top.
    _offset = Offset(
      _parentRect.left,
      targetSize.height > spaceToScreenBottom ? _parentRect.top - child.size.height : _parentRect.bottom,
    );

    size = Size(
      constraints.maxWidth,
      constraints.maxHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    child.paint(context, _offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;

    if (child == null) {
      return false;
    }

    return child.hitTest(
      result,
      position: position - _offset,
    );
  }
}

class YgDropdownMenu<T extends Object> extends StatefulWidget {
  const YgDropdownMenu({
    super.key,
    required this.entries,
    required this.onChange,
    required this.onClose,
    required this.currentValue,
    required this.allowDeselect,
  });

  final List<YgDropdownEntry<T>> entries;
  final ValueChanged<T?> onChange;
  final VoidCallback onClose;
  final T? currentValue;
  final bool allowDeselect;

  @override
  State<YgDropdownMenu<T>> createState() => _YgDropdownMenuState<T>();
}

class _YgDropdownMenuState<T extends Object> extends State<YgDropdownMenu<T>> {
  late final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return Material(
      elevation: 5,
      color: theme.menuItemBackground,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: YgScrollShadow(
          controller: _controller,
          child: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(5.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final YgDropdownEntry<T> entry = widget.entries[index];

                      final bool selected = widget.currentValue == entry.value;

                      return DropdownMenuItem(
                        icon: entry.icon,
                        selected: entry.value == widget.currentValue,
                        subtitle: entry.subtitle,
                        title: entry.title,
                        onPressed: () => _handleNewValue(
                          context,
                          selected ? null : entry.value,
                        ),
                      );
                    },
                    childCount: widget.entries.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNewValue(BuildContext context, T? value) {
    widget.onClose();
    widget.onChange(value);
    Navigator.of(context).pop();
  }
}

class DropdownMenuItem extends StatelessWidget {
  const DropdownMenuItem({
    super.key,
    required this.title,
    required this.selected,
    required this.icon,
    required this.subtitle,
    required this.onPressed,
  });

  final bool selected;
  final Widget? icon;
  final String title;
  final String? subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;
    final Widget? icon = this.icon;
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return Material(
      color: theme.menuItemBackground,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        onTap: onPressed,
        child: Padding(
          padding: theme.menuItemPadding,
          child: Row(
            children: <Widget>[
              if (icon != null)
                Padding(
                  padding: theme.menuItemPrefixPadding,
                  child: icon,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: theme.menuItemTitleStyle,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: theme.menuItemSubtitleStyle,
                      ),
                  ],
                ),
              ),
              if (selected)
                Padding(
                  padding: theme.menuItemSuffixPadding,
                  child: const YgIcon(
                    YgIcons.check,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
