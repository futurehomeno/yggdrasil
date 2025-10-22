import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/dialog/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/yg_dialog_variant.dart';

typedef YgDialogState = YgVariantState<YgDialogVariant>;

class YgDialogStyle extends YgStyle<YgDialogState> {
  YgDialogStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> iconBackground = animate(_resolveIconBackground);
  late final YgAnimatedProperty<Color> iconColor = animate(_resolveIconColor);
  late final YgAnimatedProperty<EdgeInsets> iconPadding = animate(_resolveIconPadding);

  Color _resolveIconBackground() {
    return _variantTheme.iconBackground;
  }

  Color _resolveIconColor() {
    return _variantTheme.iconColor;
  }

  EdgeInsets _resolveIconPadding() {
    return _variantTheme.iconPadding;
  }

  @override
  Curve get curve => _theme.movementAnimationCurve;

  @override
  Duration get duration => _theme.movementAnimationDuration;

  YgDialogTheme get _theme => context.dialogTheme;

  YgDialogVariantTheme get _variantTheme {
    return switch (state.variant.value) {
      YgDialogVariant.highlight => YgDialogVariantTheme.highlight(_theme.highlightDialogTheme),
      YgDialogVariant.success => YgDialogVariantTheme.success(_theme.successDialogTheme),
      YgDialogVariant.critical => YgDialogVariantTheme.critical(_theme.criticalDialogTheme),
      YgDialogVariant.loading => YgDialogVariantTheme.loading(_theme.loadingDialogTheme),
      YgDialogVariant.confirm => YgDialogVariantTheme.confirm(_theme.confirmDialogTheme),
    };
  }
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class YgDialogVariantTheme {
  const YgDialogVariantTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  factory YgDialogVariantTheme.loading(LoadingDialogTheme theme) => YgDialogVariantTheme(
    iconBackground: theme.iconBackground,
    iconColor: theme.iconColor,
    iconPadding: theme.iconPadding,
  );

  factory YgDialogVariantTheme.confirm(ConfirmDialogTheme theme) => YgDialogVariantTheme(
    iconBackground: theme.iconBackground,
    iconColor: theme.iconColor,
    iconPadding: theme.iconPadding,
  );

  factory YgDialogVariantTheme.critical(CriticalDialogTheme theme) => YgDialogVariantTheme(
    iconBackground: theme.iconBackground,
    iconColor: theme.iconColor,
    iconPadding: theme.iconPadding,
  );

  factory YgDialogVariantTheme.highlight(HighlightDialogTheme theme) => YgDialogVariantTheme(
    iconBackground: theme.iconBackground,
    iconColor: theme.iconColor,
    iconPadding: theme.iconPadding,
  );

  factory YgDialogVariantTheme.success(SuccessDialogTheme theme) => YgDialogVariantTheme(
    iconBackground: theme.iconBackground,
    iconColor: theme.iconColor,
    iconPadding: theme.iconPadding,
  );

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;
}
