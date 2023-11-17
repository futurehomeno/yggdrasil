import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStepperButtonStyle extends YgButtonBaseStyle<YgButtonBaseState> {
  YgStepperButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, YgButtonBaseState state) {
    return Colors.transparent;
  }

  @override
  MouseCursor resolveCursor(BuildContext context, YgButtonBaseState state) {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  BoxConstraints resolveConstraints(BuildContext context, YgButtonBaseState state) {
    final double iconSize = _theme.iconSize;
    final Offset iconSizeOffset = Offset(iconSize, iconSize);
    final Size paddingSize = _theme.padding.collapsedSize;

    return BoxConstraints.tight(
      paddingSize + iconSizeOffset,
    );
  }

  @override
  double resolveIconSize(BuildContext context, YgButtonBaseState state) {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor(BuildContext context, YgButtonBaseState state) {
    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.iconColor;
  }

  @override
  Color resolveSplashColor(BuildContext context, YgButtonBaseState state) {
    return _theme.splashColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgButtonBaseState state) {
    if (state.disabled.value) {
      return YgRoundedRectangleGradientBorder(
        gradient: _theme.disabledBorderGradient,
        borderRadius: _theme.borderRadius,
        width: _theme.borderWidth,
      );
    }

    return YgRoundedRectangleGradientBorder(
      gradient: _theme.borderGradient,
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  YgStepperButtonTheme get _theme => context.stepperTheme.buttonTheme;
}
