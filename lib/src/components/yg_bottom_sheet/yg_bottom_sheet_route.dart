import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/_yg_bottom_sheet.dart';

import 'yg_model_bottom_sheet.dart';

abstract class YgModalBottomSheetRoute extends PopupRoute<YgModalBottomSheet> {
  late AnimationController _controller;

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Curve get barrierCurve => Curves.easeOut;

  @override
  AnimationController createAnimationController() {
    _controller = AnimationController(
      duration: transitionDuration,
      reverseDuration: transitionDuration,
      vsync: navigator!,
      value: 0,
    );
    return _controller;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return YgModalBottomSheet(
      modalController: _controller,
      bottomSheet: buildBottomSheet(context),
    );
  }

  YgBottomSheet buildBottomSheet(BuildContext context);
}
