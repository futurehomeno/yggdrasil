part of buttons;

class _YgIconButtonStyle extends _YgButtonBaseStyle<_YgIconButtonState> {
  _YgIconButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor() {
    if (state.disabled.value) {
      return _variantTheme.disabledBackgroundColor;
    }

    return _variantTheme.backgroundColor;
  }

  @override
  BoxConstraints resolveConstraints() {
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
  double resolveIconSize() {
    switch (state.size.value) {
      case YgIconButtonSize.small:
        return _theme.iconSizeSmall;
      case YgIconButtonSize.medium:
        return _theme.iconSizeMedium;
    }
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return _variantTheme.disabledIconColor;
    }

    return _variantTheme.iconColor;
  }

  @override
  Color resolveSplashColor() {
    return _variantTheme.splashColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
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

  _YgIconButtonVariantTheme get _variantTheme {
    switch (state.variant.value) {
      case YgIconButtonVariant.filled:
        return _YgIconButtonVariantTheme.filled(_theme.filledIconButtonTheme);
      case YgIconButtonVariant.outlined:
        return _YgIconButtonVariantTheme.outlined(_theme.outlinedIconButtonTheme);
      case YgIconButtonVariant.standard:
        return _YgIconButtonVariantTheme.standard(_theme.standardIconButtonTheme);
      case YgIconButtonVariant.tonal:
        return _YgIconButtonVariantTheme.tonal(_theme.tonalIconButtonTheme);
    }
  }
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class _YgIconButtonVariantTheme {
  const _YgIconButtonVariantTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
    required this.splashColor,
  });

  factory _YgIconButtonVariantTheme.standard(YgStandardIconButtonTheme theme) => _YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory _YgIconButtonVariantTheme.filled(YgFilledIconButtonTheme theme) => _YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory _YgIconButtonVariantTheme.tonal(YgTonalIconButtonTheme theme) => _YgIconButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        disabledIconColor: theme.disabledIconColor,
        iconColor: theme.iconColor,
        splashColor: theme.splashColor,
      );

  factory _YgIconButtonVariantTheme.outlined(YgOutlinedIconButtonTheme theme) => _YgIconButtonVariantTheme(
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
