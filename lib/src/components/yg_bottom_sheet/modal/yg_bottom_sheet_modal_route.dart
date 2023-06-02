import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/bottom_sheet/_bottom_sheet.dart';
import 'package:yggdrasil/src/theme/theme.dart';

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
  Color? get barrierColor => _bottomSheetTheme.scrimColor;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

  @override
  Duration get transitionDuration => _bottomSheetTheme.movementAnimationDuration;

  @override
  Curve get barrierCurve => _bottomSheetTheme.movementAnimationCurve;

  YgBottomSheetThemes get _bottomSheetTheme => navigator!.context.bottomSheetTheme;

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
