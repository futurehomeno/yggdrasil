import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/dialog/_dialog.dart';
import 'package:yggdrasil/src/theme/theme.dart';

import '_yg_dialog.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
abstract class YgDialogRoute extends PopupRoute<YgDialog> {
  late AnimationController _controller;

  YgDialogThemes get _dialogTheme => navigator!.context.dialogTheme;

  @override
  Color? get barrierColor => _dialogTheme.scrimColor;

  @override
  Duration get transitionDuration => _dialogTheme.movementAnimationDuration;

  @override
  Curve get barrierCurve => _dialogTheme.movementAnimationCurve;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
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
    return Center(
      child: Padding(
        // TODO(Tim): This should not be hardcoded here, but for now the design
        // does not make sense (fixed width for the dialog), so suggested a max
        // width and padding to edge of screen instead. Until feedback from
        // design this should be good enough.
        padding: const EdgeInsets.all(30),
        child: buildDialog(context),
      ),
    );
  }

  /// Builds the [YgBottomSheet].
  YgDialog buildDialog(BuildContext context);
}
