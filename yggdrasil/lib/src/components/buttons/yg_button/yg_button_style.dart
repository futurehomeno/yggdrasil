part of buttons;

class _YgButtonStyle extends _YgButtonBaseStyle<_YgButtonState> {
  _YgButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Color resolveColor() {
    return variantTheme.backgroundColor;
  }

  @override
  double resolveIconSize() {
    return _theme.iconSize;
  }

  @override
  EdgeInsets resolvePadding() {
    switch (state.size.value) {
      case YgButtonSize.small:
        return _theme.paddingSmall;
      case YgButtonSize.medium:
        return _theme.paddingMedium;
      case YgButtonSize.large:
        return _theme.paddingLarge;
    }
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return variantTheme.iconDisabledColor;
    }

    return variantTheme.iconDefaultColor;
  }

  @override
  TextStyle resolveTextStyle() {
    if (state.disabled.value) {
      return variantTheme.disabledTextStyle;
    }

    return variantTheme.textStyle;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    if (state.disabled.value) {
      return YgRoundedRectangleGradientBorder(
        gradient: variantTheme.disabledBorderGradient,
        borderRadius: _theme.borderRadius,
        width: _theme.borderWidth,
      );
    }

    return YgRoundedRectangleGradientBorder(
      gradient: variantTheme.borderGradient,
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  _ButtonVariantTheme get variantTheme {
    switch (state.variant.value) {
      case YgButtonVariant.primary:
        return _ButtonVariantTheme.primary(_theme.primaryButtonTheme);
      case YgButtonVariant.secondary:
        return _ButtonVariantTheme.secondary(_theme.secondaryButtonTheme);
      case YgButtonVariant.text:
        return _ButtonVariantTheme.text(_theme.textButtonTheme);
      case YgButtonVariant.critical:
        return _ButtonVariantTheme.critical(_theme.criticalButtonTheme);
      case YgButtonVariant.link:
        return _ButtonVariantTheme.link(_theme.linkButtonTheme);
    }
  }

  YgButtonTheme get _theme => context.buttonTheme;

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class _ButtonVariantTheme {
  const _ButtonVariantTheme({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.borderGradient,
    required this.disabledBorderGradient,
    required this.iconDefaultColor,
    required this.iconDisabledColor,
  });

  factory _ButtonVariantTheme.primary(YgPrimaryButtonTheme theme) => _ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory _ButtonVariantTheme.secondary(YgSecondaryButtonTheme theme) => _ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory _ButtonVariantTheme.text(YgTextButtonTheme theme) => _ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory _ButtonVariantTheme.critical(YgCriticalButtonTheme theme) => _ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory _ButtonVariantTheme.link(YgLinkButtonTheme theme) => _ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final Color iconDefaultColor;
  final Color iconDisabledColor;
}
