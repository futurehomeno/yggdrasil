part of buttons;

/// Tag style for YgTags.
class _YgTagStyle extends _YgButtonBaseStyle<_YgTagState> {
  _YgTagStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor() {
    final _YgTagVariantStyle variantTheme = _getVariantTheme(state.variant.value);

    switch (state.weight.value) {
      case YgTagWeight.strong:
        return variantTheme.strongBackgroundColor;
      case YgTagWeight.weak:
        return variantTheme.backgroundColor;
    }
  }

  @override
  TextStyle resolveTextStyle() {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.strongTextStyle;
      case YgTagWeight.weak:
        return _theme.textStyle;
    }
  }

  @override
  double resolveIconSize() {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor() {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.iconStrongColor;
      case YgTagWeight.weak:
        return _theme.iconWeakColor;
    }
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    return RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: _theme.borderRadius,
    );
  }

  @override
  EdgeInsets resolvePadding() {
    switch (state.size.value) {
      case YgTagSize.small:
        return _theme.paddingSmall;
      case YgTagSize.medium:
        return _theme.paddingMedium;
    }
  }

  @override
  Color resolveSplashColor() {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.splashStrongColor;
      case YgTagWeight.weak:
        return _theme.splashWeakColor;
    }
  }

  _YgTagVariantStyle _getVariantTheme(YgTagVariant variant) {
    switch (variant) {
      case YgTagVariant.neutral:
        return _YgTagVariantStyle.neutral(_theme.neutralTagTheme);
      case YgTagVariant.informative:
        return _YgTagVariantStyle.informative(_theme.informativeTagTheme);
      case YgTagVariant.positive:
        return _YgTagVariantStyle.positive(_theme.positiveTagTheme);
      case YgTagVariant.warning:
        return _YgTagVariantStyle.warning(_theme.warningTagTheme);
      case YgTagVariant.negative:
        return _YgTagVariantStyle.negative(_theme.negativeTagTheme);
    }
  }

  YgTagTheme get _theme => context.tagTheme;
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class _YgTagVariantStyle {
  const _YgTagVariantStyle({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  factory _YgTagVariantStyle.neutral(YgNeutralTagTheme theme) => _YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory _YgTagVariantStyle.informative(YgInformativeTagTheme theme) => _YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory _YgTagVariantStyle.positive(YgPositiveTagTheme theme) => _YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory _YgTagVariantStyle.warning(YgWarningTagTheme theme) => _YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory _YgTagVariantStyle.negative(YgNegativeTagTheme theme) => _YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;
}
