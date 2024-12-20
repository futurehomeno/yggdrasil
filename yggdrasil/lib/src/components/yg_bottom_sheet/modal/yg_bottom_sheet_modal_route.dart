import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../yg_bottom_sheet_close_pressed_notification.dart';

part 'yg_bottom_sheet_modal.dart';

/// A route which should be extended to create a [YgBottomSheet] modal route.
///
/// Wraps the result from [buildBottomSheet] in a [YgBottomSheetModal] which
/// provides animations for opening ans closing the [YgBottomSheet] and a scrim.
abstract class YgBottomSheetModalRoute extends PopupRoute<Widget> {
  late AnimationController _controller;

  YgBottomSheetTheme get _bottomSheetTheme => context.bottomSheetTheme;

  BuildContext get context => navigator!.context;

  @override
  RouteSettings get settings => RouteSettings(name: name);

  @override
  Color get barrierColor => _bottomSheetTheme.scrimColor;

  @override
  Duration get transitionDuration => _bottomSheetTheme.movementAnimationDuration;

  @override
  Curve get barrierCurve => _bottomSheetTheme.movementAnimationCurve;

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  RoutePopDisposition get popDisposition => switch (barrierDismissible) {
        false => RoutePopDisposition.doNotPop,
        true => RoutePopDisposition.pop,
      };

  @override
  String get barrierLabel => 'Dismissible Dialog';

  /// The name of the dialog.
  ///
  /// Used to construct the route settings.
  String get name;

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
    return _YgBottomSheetModal(
      modalController: _controller,
      bottomSheet: buildBottomSheet(context),
    );
  }

  /// Builds the bottom sheet.
  Widget buildBottomSheet(BuildContext context);
}
