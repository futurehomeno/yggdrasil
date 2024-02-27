import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/snack_bar/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef YgSnackBarState = YgVariantState<YgSnackBarVariant>;

class YgSnackBarStyle extends YgStyleWithDefaults<YgSnackBarState> {
  YgSnackBarStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty iconBackgroundColor;
  late final YgAnimatedColorProperty iconColor;
  late final YgDrivenProperty<YgIconData> icon;

  @override
  void init() {
    iconColor = animate(YgColorProperty<YgSnackBarState>.resolveWith(_resolveIconColor));
    iconBackgroundColor = animate(YgColorProperty<YgSnackBarState>.resolveWith(_resolveIconBackgroundColor));
    icon = drive(YgProperty<YgSnackBarState, YgIconData>.resolveWith(_resolveIcon));
  }

  Color _resolveIconColor(BuildContext context, YgSnackBarState state) {
    return _getVariantTheme(state).iconColor;
  }

  Color _resolveIconBackgroundColor(BuildContext context, YgSnackBarState state) {
    return _getVariantTheme(state).iconContainerColor;
  }

  YgIconData _resolveIcon(BuildContext context, YgSnackBarState state) {
    return switch (state.variant.value) {
      YgSnackBarVariant.highlight => YgIcons.info,
      YgSnackBarVariant.success => YgIcons.check,
      YgSnackBarVariant.critical => YgIcons.error,
    };
  }

  YgSnackBarVariantTheme _getVariantTheme(YgSnackBarState state) {
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
