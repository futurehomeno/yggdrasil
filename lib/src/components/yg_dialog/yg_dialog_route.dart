import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/dialog/_dialog.dart';
import 'package:yggdrasil/src/theme/theme.dart';

import '_yg_dialog.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
///
/// If the user should not be able to close the modal by pressing the scrim,
/// override the value [barrierDismissible] and set it to false.
abstract class YgDialogRoute extends PopupRoute<YgDialog> {
  late AnimationController _controller;

  YgDialogThemes get _dialogThemes => navigator!.context.dialogThemes;

  @override
  Color? get barrierColor => _dialogThemes.scrimColor;

  @override
  Duration get transitionDuration => _dialogThemes.movementAnimationDuration;

  @override
  Curve get barrierCurve => _dialogThemes.movementAnimationCurve;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismissible Dialog';

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
    final YgDialogThemes dialogThemes = context.dialogThemes;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Custom layout which applies a max width, padding and min width.
        // The padding gets discarded to preserve the min width, the min width
        // gets discarded when it's more than the total with of the screen.
        final double minWidth = min(dialogThemes.minWidth, constraints.maxWidth);
        final double maxWidth = min(dialogThemes.maxWidth, constraints.maxWidth);
        final double widthWithPadding = maxWidth - (dialogThemes.paddingToScreenEdge * 2);
        final double width = max(minWidth, widthWithPadding);

        return FadeTransition(
          opacity: animation,
          child: Center(
            child: SizedBox(
              width: width,
              child: buildDialog(context),
            ),
          ),
        );
      },
    );
  }

  /// Builds the [YgBottomSheet].
  YgDialog buildDialog(BuildContext context);
}
