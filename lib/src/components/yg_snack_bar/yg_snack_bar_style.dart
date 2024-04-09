import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/snack_bar/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef YgSnackBarState = YgVariantState<YgSnackBarVariant>;

class YgSnackBarStyle extends YgStyle<YgSnackBarState> {
  YgSnackBarStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> iconColor = animate(_resolveIconColor);
  late final YgAnimatedProperty<Color> iconBackgroundColor = animate(_resolveIconBackgroundColor);
  late final YgDrivenProperty<YgIconData> icon = drive(_resolveIcon);

  Color _resolveIconColor() {
    return _variantTheme.iconColor;
  }

  Color _resolveIconBackgroundColor() {
    return _variantTheme.iconContainerColor;
  }

  YgIconData _resolveIcon() {
    return switch (state.variant.value) {
      YgSnackBarVariant.highlight => YgIcons.info,
      YgSnackBarVariant.success => YgIcons.check,
      YgSnackBarVariant.critical => YgIcons.error,
    };
  }

  YgSnackBarVariantTheme get _variantTheme {
    return switch (state.variant.value) {
      YgSnackBarVariant.highlight => YgSnackBarVariantTheme.highlight(_theme.highlightSnackBarTheme),
      YgSnackBarVariant.success => YgSnackBarVariantTheme.success(_theme.successSnackBarTheme),
      YgSnackBarVariant.critical => YgSnackBarVariantTheme.critical(_theme.criticalSnackBarTheme),
    };
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSnackBarTheme get _theme => context.snackBarTheme;
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class YgSnackBarVariantTheme {
  const YgSnackBarVariantTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  factory YgSnackBarVariantTheme.critical(CriticalSnackBarTheme theme) => YgSnackBarVariantTheme(
        iconColor: theme.iconColor,
        iconContainerColor: theme.iconContainerColor,
      );

  factory YgSnackBarVariantTheme.highlight(HighlightSnackBarTheme theme) => YgSnackBarVariantTheme(
        iconColor: theme.iconColor,
        iconContainerColor: theme.iconContainerColor,
      );

  factory YgSnackBarVariantTheme.success(SuccessSnackBarTheme theme) => YgSnackBarVariantTheme(
        iconColor: theme.iconColor,
        iconContainerColor: theme.iconContainerColor,
      );

  final Color iconContainerColor;
  final Color iconColor;
}
