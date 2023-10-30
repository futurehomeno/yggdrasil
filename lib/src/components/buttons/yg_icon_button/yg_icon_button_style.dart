import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/icon_button/_icon_button.dart';

import 'enums/_enums.dart';

class YgIconButtonStyle extends YgButtonBaseStyle<YgIconButtonState> {
  YgIconButtonStyle({
    required super.controller,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, Set<YgIconButtonState> states) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(states);

    if (states.disabled) {
      return variantTheme.disabledBackgroundColor;
    }

    return variantTheme.backgroundColor;
  }

  @override
  MouseCursor resolveCursor(BuildContext context, Set<YgIconButtonState> states) {
    if (states.disabled) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  BoxConstraints resolveConstraints(BuildContext context, Set<YgIconButtonState> states) {
    final double size = switch (states.size) {
      YgIconButtonSize.small => _theme.sizeSmall,
      YgIconButtonSize.medium => _theme.sizeMedium,
    };

    return BoxConstraints.expand(
      height: size,
      width: size,
    );
  }

  @override
  double resolveIconSize(BuildContext context, Set<YgIconButtonState> states) {
    switch (states.size) {
      case YgIconButtonSize.small:
        return _theme.iconSizeSmall;
      case YgIconButtonSize.medium:
        return _theme.iconSizeMedium;
    }
  }

  @override
  Color resolveIconColor(BuildContext context, Set<YgIconButtonState> states) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(states);

    if (states.disabled) {
      return variantTheme.disabledIconColor;
    }

    return variantTheme.iconColor;
  }

  @override
  Color resolveSplashColor(BuildContext context, Set<YgIconButtonState> states) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(states);

    return variantTheme.pressedColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, Set<YgIconButtonState> states) {
    return const CircleBorder();
  }

  YgIconButtonTheme get _theme => context.iconButtonTheme;

  YgIconButtonVariantTheme _getVariantTheme(Set<YgIconButtonState> states) {
    switch (states.variant) {
      case YgIconButtonVariant.filled:
        return YgIconButtonVariantTheme.filled(_theme.filledIconButtonTheme);
      case YgIconButtonVariant.outlined:
        return YgIconButtonVariantTheme.outlined(_theme.outlinedIconButtonTheme);
      case YgIconButtonVariant.standard:
        return YgIconButtonVariantTheme.standard(_theme.standardIconButtonTheme);
      case YgIconButtonVariant.tonal:
        return YgIconButtonVariantTheme.tonal(_theme.tonalIconButtonTheme);
    }
  }
}

class YgIconButtonVariantTheme {
  const YgIconButtonVariantTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
    required this.pressedColor,
  });

  factory YgIconButtonVariantTheme.standard(YgStandardIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        pressedColor: theme.pressedColor,
      );

  factory YgIconButtonVariantTheme.filled(YgFilledIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        pressedColor: theme.pressedColor,
      );

  factory YgIconButtonVariantTheme.tonal(YgTonalIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        pressedColor: theme.pressedColor,
      );

  factory YgIconButtonVariantTheme.outlined(YgOutlinedIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        pressedColor: theme.pressedColor,
      );

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;
  final Color pressedColor;
}
