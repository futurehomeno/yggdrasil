import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_toggle_button/_yg_toggle_button.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/toggle_button/extensions/_extensions.dart';

import 'yg_toggle_button_state.dart';

class YgToggleButtonStyle extends YgButtonBaseStyle<YgToggleButtonState> {
  YgToggleButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Color resolveColor() {
    if (state.disabled.value) {
      if (state.toggled.value) {
        return _theme.backgroundToggledDisabledColor;
      }

      return _theme.backgroundColor;
    }

    if (state.toggled.value) {
      return _theme.backgroundToggledColor;
    }

    if (state.focused.value || state.hovered.value) {
      return _theme.backgroundHoveredFocusedColor;
    }

    return _theme.backgroundColor;
  }

  @override
  double resolveIconSize() {
    if (state.variant.value == YgToggleButtonVariant.iconOnly && state.size.value == YgToggleButtonSize.large) {
      return _theme.iconLargeIconOnlySize;
    }

    return _theme.iconDefaultSize;
  }

  @override
  EdgeInsets resolvePadding() {
    switch (state.size.value) {
      case YgToggleButtonSize.small:
        return _variantTheme.paddingSmall;
      case YgToggleButtonSize.medium:
        return _variantTheme.paddingMedium;
      case YgToggleButtonSize.large:
        return _variantTheme.paddingLarge;
    }
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return _theme.iconDisabledColor;
    }

    if (state.toggled.value) {
      return _theme.iconToggledColor;
    }

    return _theme.iconDefaultColor;
  }

  @override
  TextStyle resolveTextStyle() {
    final TextStyle baseStyle = switch (state.size.value) {
      YgToggleButtonSize.small => _theme.textStyleSmall,
      YgToggleButtonSize.medium => _theme.textStyleMedium,
      YgToggleButtonSize.large => _theme.textStyleLarge,
    };

    return baseStyle.copyWith(
      color: _resolveTextColor(state),
    );
  }

  Color _resolveTextColor(YgToggleButtonState state) {
    if (state.disabled.value) {
      return _theme.textDisabledColor;
    }

    if (state.toggled.value) {
      return _theme.textToggledColor;
    }

    return _theme.textDefaultColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    final BorderSide borderSide = BorderSide(
      color: _resolveBorderColor(state),
      width: 1,
    );

    if (state.variant.value == YgToggleButtonVariant.iconOnly) {
      return CircleBorder(
        side: borderSide,
      );
    }

    return RoundedRectangleBorder(
      side: borderSide,
      borderRadius: _theme.borderRadius,
    );
  }

  Color _resolveBorderColor(YgToggleButtonState state) {
    if (state.toggled.value) {
      if (state.disabled.value) {
        return _theme.borderToggledDisabledColor;
      }

      return _theme.borderToggledColor;
    }

    if (state.disabled.value) {
      return _theme.borderDefaultColor;
    }

    if (state.focused.value || state.hovered.value) {
      return _theme.borderHoveredFocusedColor;
    }

    return _theme.borderDefaultColor;
  }

  YgToggleButtonVariantTheme get _variantTheme {
    switch (state.variant.value) {
      case YgToggleButtonVariant.iconOnly:
        return YgToggleButtonVariantTheme.icon(_theme.toggleIconButtonTheme);
      case YgToggleButtonVariant.leadingIcon:
        return YgToggleButtonVariantTheme.iconText(_theme.toggleIconTextButtonTheme);
      case YgToggleButtonVariant.text:
        return YgToggleButtonVariantTheme.text(_theme.toggleTextButtonTheme);
    }
  }

  YgToggleButtonTheme get _theme => context.toggleButtonTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class YgToggleButtonVariantTheme {
  const YgToggleButtonVariantTheme({
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
  });

  factory YgToggleButtonVariantTheme.icon(ToggleIconButtonTheme theme) {
    return YgToggleButtonVariantTheme(
      paddingLarge: theme.paddingLarge,
      paddingMedium: theme.paddingMedium,
      paddingSmall: theme.paddingSmall,
    );
  }

  factory YgToggleButtonVariantTheme.text(ToggleTextButtonTheme theme) {
    return YgToggleButtonVariantTheme(
      paddingLarge: theme.paddingLarge,
      paddingMedium: theme.paddingMedium,
      paddingSmall: theme.paddingSmall,
    );
  }

  factory YgToggleButtonVariantTheme.iconText(ToggleIconTextButtonTheme theme) {
    return YgToggleButtonVariantTheme(
      paddingLarge: theme.paddingLarge,
      paddingMedium: theme.paddingMedium,
      paddingSmall: theme.paddingSmall,
    );
  }

  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;
}
