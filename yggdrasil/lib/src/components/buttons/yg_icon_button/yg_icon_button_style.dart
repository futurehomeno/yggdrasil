import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'enums/_enums.dart';
import 'yg_icon_button_state.dart';

class YgIconButtonStyle extends YgButtonBaseStyle<YgIconButtonState> {
  YgIconButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, YgIconButtonState state) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(state);

    if (state.disabled.value) {
      return variantTheme.disabledBackgroundColor;
    }

    return variantTheme.backgroundColor;
  }

  @override
  BoxConstraints resolveConstraints(BuildContext context, YgIconButtonState state) {
    final double size = switch (state.size.value) {
      YgIconButtonSize.small => _theme.sizeSmall,
      YgIconButtonSize.medium => _theme.sizeMedium,
    };

    return BoxConstraints.expand(
      height: size,
      width: size,
    );
  }

  @override
  double resolveIconSize(BuildContext context, YgIconButtonState state) {
    switch (state.size.value) {
      case YgIconButtonSize.small:
        return _theme.iconSizeSmall;
      case YgIconButtonSize.medium:
        return _theme.iconSizeMedium;
    }
  }

  @override
  Color resolveIconColor(BuildContext context, YgIconButtonState state) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(state);

    if (state.disabled.value) {
      return variantTheme.disabledIconColor;
    }

    return variantTheme.iconColor;
  }

  @override
  Color resolveSplashColor(BuildContext context, YgIconButtonState state) {
    final YgIconButtonVariantTheme variantTheme = _getVariantTheme(state);

    return variantTheme.splashColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgIconButtonState state) {
    final YgOutlinedIconButtonTheme theme = _theme.outlinedIconButtonTheme;

    if (state.variant.value == YgIconButtonVariant.outlined) {
      return CircleBorder(
        side: BorderSide(
          color: state.disabled.value ? theme.disabledBorderColor : theme.borderColor,
          width: 1,
        ),
      );
    }

    return const CircleBorder();
  }

  YgIconButtonTheme get _theme => context.iconButtonTheme;

  YgIconButtonVariantTheme _getVariantTheme(YgIconButtonState state) {
    switch (state.variant.value) {
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

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class YgIconButtonVariantTheme {
  const YgIconButtonVariantTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
    required this.splashColor,
  });

  factory YgIconButtonVariantTheme.standard(YgStandardIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory YgIconButtonVariantTheme.filled(YgFilledIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory YgIconButtonVariantTheme.tonal(YgTonalIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory YgIconButtonVariantTheme.outlined(YgOutlinedIconButtonTheme theme) => YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;
  final Color splashColor;
}
