import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_dropdown_menu.dart';
part 'yg_dropdown_menu_item.dart';
part 'yg_dropdown_menu_positioner.dart';

/// A route for the dropdown menu.
///
/// Should currently not be used outside of the dropdown.
class YgDropdownMenuRoute<T extends Object> extends PopupRoute<Widget> {
  YgDropdownMenuRoute({
    required this.entries,
    required this.dropdownController,
    required this.onClose,
    required this.rect,
  });

  final YgDynamicDropdownController<T> dropdownController;
  final List<YgDropdownEntry<T>> entries;
  final VoidCallback onClose;
  final Rect rect;

  BuildContext get context => navigator!.context;

  YgDropdownFieldTheme get theme => context.fieldTheme.dropdownTheme;

  @override
  RouteSettings get settings => const RouteSettings(name: 'DropdownMenu');

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Duration get transitionDuration => theme.menuAnimationDuration;

  @override
  Curve get barrierCurve => theme.menuAnimationCurve;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'Dropdown Menu';

  @override
  Future<RoutePopDisposition> willPop() {
    onClose();

    return super.willPop();
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return _YgDropdownMenuPositioner(
      rect: rect,
      animation: animation.drive(CurveTween(curve: theme.menuAnimationCurve)),
      padding: theme.menuToFieldPadding,
      // TODO(DEV-1918): Find out what black magic is going on here and fix it, for
      // now though, yes, we need 2 of them, otherwise the scroll shadow doesn't
      // repaint don't ask me how or why.
      child: RepaintBoundary(
        child: RepaintBoundary(
          child: _YgDropdownMenu<T>(
            entries: entries,
            controller: dropdownController,
          ),
        ),
      ),
    );
  }
}
