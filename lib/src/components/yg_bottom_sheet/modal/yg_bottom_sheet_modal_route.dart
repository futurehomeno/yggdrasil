import 'package:flutter/material.dart';

import '../_yg_bottom_sheet.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
abstract class YgBottomSheetModalRoute extends PopupRoute<YgBottomSheetModal> {
  late AnimationController _controller;

  // This is set to transparent so we can use our theming with a fake scrim
  // elsewhere.
  @override
  Color? get barrierColor => Colors.transparent;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 225);

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
    return YgBottomSheetModal(
      modalController: _controller,
      bottomSheet: buildBottomSheet(context),
    );
  }

  /// Builds the [YgBottomSheet].
  YgBottomSheet buildBottomSheet(BuildContext context);
}
