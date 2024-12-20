import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
///
/// If the user should not be able to close the modal by pressing the scrim,
/// override the value [barrierDismissible] and set it to false.
abstract class YgDialogRoute extends PopupRoute<YgDialog> {
  late AnimationController _controller;

  YgDialogTheme get _dialogThemes => navigator!.context.dialogTheme;

  @override
  RouteSettings get settings => RouteSettings(name: name);

  @override
  Color get barrierColor => _dialogThemes.scrimColor;

  @override
  Duration get transitionDuration => _dialogThemes.movementAnimationDuration;

  @override
  Curve get barrierCurve => _dialogThemes.movementAnimationCurve;

  @override
  bool get barrierDismissible => true;

  @override
  RoutePopDisposition get popDisposition => switch (barrierDismissible) {
        false => RoutePopDisposition.doNotPop,
        true => RoutePopDisposition.pop,
      };

  @override
  String get barrierLabel => 'Dismissible Dialog';

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

  /// The name of the dialog.
  ///
  /// Used to construct the route settings.
  String get name;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final YgDialogTheme dialogTheme = context.dialogTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Custom layout which applies a max width, padding and min width.
        // The padding gets discarded to preserve the min width, the min width
        // gets discarded when it's more than the total with of the screen.
        final double minWidth = min(dialogTheme.minWidth, constraints.maxWidth);
        final double maxWidth = min(dialogTheme.maxWidth, constraints.maxWidth);
        final double widthWithPadding = maxWidth - (dialogTheme.outerPadding * 2);
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
  Widget buildDialog(BuildContext context);
}
