import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import '_yg_tag.dart';

/// Tag style for YgTags.
///
/// Variation of the [ButtonStyle] to better fit [YgTags].
/// Use [toButtonStyle] to convert to material [ButtonStyle].
class YgTagStyle extends YgButtonBaseStyle<YgTagState> {
  YgTagStyle({
    required super.controller,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, Set<YgTagState> states) {
    final YgTagVariantStyle variantTheme = _getVariantTheme(states.variant);

    if (states.disabled) {
      print('${states.variant}: ${variantTheme.disabledBackgroundColor}');

      return variantTheme.disabledBackgroundColor;
    }

    switch (states.weight) {
      case YgTagWeight.strong:
        print('${states.variant}: ${variantTheme.strongBackgroundColor}');

        return variantTheme.strongBackgroundColor;
      case YgTagWeight.weak:
        print('${states.variant}: ${variantTheme.backgroundColor}');

        return variantTheme.backgroundColor;
    }
  }

  @override
  MouseCursor resolveCursor(BuildContext context, Set<YgTagState> states) {
    if (states.disabled) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, Set<YgTagState> states) {
    if (states.disabled) {
      switch (states.weight) {
        case YgTagWeight.strong:
          return _theme.disabledStrongTextStyle;
        case YgTagWeight.weak:
          return _theme.disabledTextStyle;
      }
    }

    switch (states.weight) {
      case YgTagWeight.strong:
        return _theme.strongTextStyle;
      case YgTagWeight.weak:
        return _theme.textStyle;
    }
  }

  @override
  double resolveIconSize(BuildContext context, Set<YgTagState> states) {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor(BuildContext context, Set<YgTagState> states) {
    if (states.disabled) {
      switch (states.weight) {
        case YgTagWeight.strong:
          return _theme.iconStrongDisabledColor;
        case YgTagWeight.weak:
          return _theme.iconWeakDisabledColor;
      }
    }

    switch (states.weight) {
      case YgTagWeight.strong:
        return _theme.iconStrongColor;
      case YgTagWeight.weak:
        return _theme.iconWeakColor;
    }
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, Set<YgTagState> states) {
    return RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: _theme.borderRadius,
    );
  }

  @override
  EdgeInsets resolvePadding(BuildContext context, Set<YgTagState> states) {
    switch (states.size) {
      case YgTagSize.small:
        return _theme.paddingSmall;
      case YgTagSize.medium:
        return _theme.paddingMedium;
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
