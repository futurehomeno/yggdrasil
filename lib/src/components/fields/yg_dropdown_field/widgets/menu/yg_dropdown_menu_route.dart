import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_dropdown_menu.dart';
part 'yg_dropdown_menu_item.dart';
part 'yg_dropdown_menu_positioner.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
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

  @override
  RouteSettings get settings => const RouteSettings(name: 'DropdownMenu');

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Curve get barrierCurve => Curves.easeOut;

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
    return _YgDropdownMenuPositioner(
      rect: rect,
      animation: animation.drive(CurveTween(curve: Curves.easeOut)),
      screenPadding: MediaQuery.paddingOf(context),
      padding: 5.0,
      child: _YgDropdownMenu<T>(
        entries: entries,
        controller: dropdownController,
        onClose: onClose,
      ),
    );
  }
}
