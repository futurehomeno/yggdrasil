import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import '_yg_tag.dart';
import 'yg_tag_state.dart';

/// Tag style for YgTags.
class YgTagStyle extends YgButtonBaseStyle<YgTagState> {
  YgTagStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, YgTagState state) {
    final YgTagVariantStyle variantTheme = _getVariantTheme(state.variant.value);

    switch (state.weight.value) {
      case YgTagWeight.strong:
        return variantTheme.strongBackgroundColor;
      case YgTagWeight.weak:
        return variantTheme.backgroundColor;
    }
  }

  @override
  MouseCursor resolveCursor(BuildContext context, YgTagState state) {
    return SystemMouseCursors.click;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, YgTagState state) {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.strongTextStyle;
      case YgTagWeight.weak:
        return _theme.textStyle;
    }
  }

  @override
  double resolveIconSize(BuildContext context, YgTagState state) {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor(BuildContext context, YgTagState state) {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.iconStrongColor;
      case YgTagWeight.weak:
        return _theme.iconWeakColor;
    }
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, YgTagState state) {
    return RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: _theme.borderRadius,
    );
  }

  @override
  EdgeInsets resolvePadding(BuildContext context, YgTagState state) {
    switch (state.size.value) {
      case YgTagSize.small:
        return _theme.paddingSmall;
      case YgTagSize.medium:
        return _theme.paddingMedium;
    }
  }

  @override
  Color resolveSplashColor(BuildContext context, YgTagState state) {
    switch (state.weight.value) {
      case YgTagWeight.strong:
        return _theme.splashStrongColor;
      case YgTagWeight.weak:
        return _theme.splashWeakColor;
    }
  }

  YgTagVariantStyle _getVariantTheme(YgTagVariant variant) {
    switch (variant) {
      case YgTagVariant.neutral:
        return YgTagVariantStyle.neutral(_theme.neutralTagTheme);
      case YgTagVariant.informative:
        return YgTagVariantStyle.informative(_theme.informativeTagTheme);
      case YgTagVariant.positive:
        return YgTagVariantStyle.positive(_theme.positiveTagTheme);
      case YgTagVariant.warning:
        return YgTagVariantStyle.warning(_theme.warningTagTheme);
      case YgTagVariant.negative:
        return YgTagVariantStyle.negative(_theme.negativeTagTheme);
    }
  }

  YgTagTheme get _theme => context.tagTheme;
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class YgTagVariantStyle {
  const YgTagVariantStyle({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  factory YgTagVariantStyle.neutral(YgNeutralTagTheme theme) => YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory YgTagVariantStyle.informative(YgInformativeTagTheme theme) => YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory YgTagVariantStyle.positive(YgPositiveTagTheme theme) => YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory YgTagVariantStyle.warning(YgWarningTagTheme theme) => YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  factory YgTagVariantStyle.negative(YgNegativeTagTheme theme) => YgTagVariantStyle(
        backgroundColor: theme.backgroundColor,
        disabledBackgroundColor: theme.disabledBackgroundColor,
        strongBackgroundColor: theme.strongBackgroundColor,
      );

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;
}
