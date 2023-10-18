import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_field_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgFieldDecorationStyle extends YgStyle<YgFieldState> {
  YgFieldDecorationStyle({
    required super.controller,
    required super.vsync,
  });

  late final YgAnimatedEdgeInsetsProperty suffixPadding;
  late final YgAnimatedEdgeInsetsProperty childPadding;
  late final YgAnimatedBorderProperty border;
  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedBorderRadiusProperty borderRadius;
  late final YgDrivenNullableBorderRadiusProperty decorationBorderRadius;

  @override
  void init() {
    suffixPadding = animate(
      YgEdgeInsetsProperty<YgFieldState>.resolveWith(
        _resolveSuffixPadding,
      ),
      duration: duration,
      curve: curve,
    );
    childPadding = animate(
      YgEdgeInsetsProperty<YgFieldState>.resolveWith(
        _resolveChildPadding,
      ),
      duration: duration,
      curve: curve,
    );
    borderRadius = animate(
      YgBorderRadiusProperty<YgFieldState>.resolveWith(
        _resolveBorderRadius,
      ),
      duration: duration,
      curve: curve,
    );
    decorationBorderRadius = drive(
      YgNullableBorderRadiusProperty<YgFieldState>.resolveWith(
        _resolveDecorationBorderRadius,
      ),
    );
    border = animate(
      YgBorderProperty<YgFieldState>.resolveWith(
        _resolveBorder,
      ),
      duration: duration,
      curve: curve,
    );
    backgroundColor = animate(
      YgColorProperty<YgFieldState>.resolveWith(
        _resolveBackgroundColor,
      ),
      duration: duration,
      curve: curve,
    );
  }

  EdgeInsets _resolveSuffixPadding(BuildContext context, Set<YgFieldState> states) {
    if (states.contains(YgFieldState.outlined)) {
      return _theme.outlinedSuffixPadding;
    }

    return _theme.standardSuffixPadding;
  }

  EdgeInsets _resolveChildPadding(BuildContext context, Set<YgFieldState> states) {
    // TODO(DEV-1915): Have to find some better way to figure out the border
    // size to add to the padding.
    final EdgeInsets borderPadding = switch (variant) {
      YgFieldVariant.outlined => const EdgeInsets.all(
          2.0,
        ),
      YgFieldVariant.standard => const EdgeInsets.only(
          bottom: 2,
        ),
    };

    final EdgeInsets base = switch (variant) {
      YgFieldVariant.outlined => switch (size) {
          YgFieldSize.large => _theme.largeOutlinedContentPadding,
          YgFieldSize.medium => _theme.mediumOutlinedContentPadding,
        },
      YgFieldVariant.standard => switch (size) {
          YgFieldSize.large => _theme.largeStandardContentPadding,
          YgFieldSize.medium => _theme.mediumStandardContentPadding,
        },
    };

    if (suffix == null) return base + borderPadding;

    return base.copyWith(
          right: 0,
        ) +
        borderPadding;
  }

  BorderRadius _resolveBorderRadius(BuildContext context, Set<YgFieldState> states) {
    switch (variant) {
      case YgFieldVariant.outlined:
        return _theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return _theme.borderRadiusDefault;
    }
  }

  /// This method has to exist because a uneven border can not be applied when
  /// there is a border radius.
  BorderRadius? _resolveDecorationBorderRadius(BuildContext context, Set<YgFieldState> states) {
    switch (variant) {
      case YgFieldVariant.outlined:
        return _theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return null;
    }
    return null;
  }

  Border _resolveBorder(BuildContext context, Set<YgFieldState> states) {
    Border base = _theme.borderDefault;

    if (states.disabled) {
      base = _theme.borderDisabled;
    } else if (states.error) {
      base = _theme.borderError;
    } else if (states.focused || states.opened) {
      base = _theme.borderFocus;
    } else if (states.hovered) {
      base = _theme.borderHover;
    }

    if (variant == YgFieldVariant.outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color _resolveBackgroundColor(BuildContext context, Set<YgFieldState> states) {
    if (variant != YgFieldVariant.outlined) {
      return Colors.transparent;
    }

    if (states.disabled) {
      return _theme.backgroundDisabledColor;
    }
    if (states.error) {
      return _theme.backgroundErrorColor;
    }

    return _theme.backgroundDefaultColor;
  }

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldDecorationTheme get _theme => _fieldTheme.decorationTheme;

  @override
  Curve get curve => _fieldTheme.animationCurve;

  @override
  Duration get duration => _fieldTheme.animationDuration;
}
