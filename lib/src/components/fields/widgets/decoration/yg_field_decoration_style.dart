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
  late final YgAnimatedDecorationProperty boxDecoration;

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
    boxDecoration = animate(
      YgDecorationProperty<YgFieldState>.resolveWith(
        _resolveBoxDecoration,
      ),
      curve: curve,
      duration: duration,
    );
  }

  EdgeInsets _resolveSuffixPadding(BuildContext context, Set<YgFieldState> states) {
    if (states.outlined) {
      return _theme.outlinedSuffixPadding;
    }

    return _theme.standardSuffixPadding;
  }

  EdgeInsets _resolveChildPadding(BuildContext context, Set<YgFieldState> states) {
    // TODO(DEV-1915): Have to find some better way to figure out the border
    // size to add to the padding.
    final YgFieldVariant variant = states.variant;
    final YgFieldSize size = states.size;

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

    if (states.suffix) {
      return base + borderPadding;
    }

    return base.copyWith(
          right: 0,
        ) +
        borderPadding;
  }

  BorderRadius _resolveBorderRadius(BuildContext context, Set<YgFieldState> states) {
    switch (states.variant) {
      case YgFieldVariant.outlined:
        return _theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return _theme.borderRadiusDefault;
    }
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

    if (states.variant == YgFieldVariant.outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color _resolveBackgroundColor(BuildContext context, Set<YgFieldState> states) {
    if (states.standard) {
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

  BoxDecoration _resolveBoxDecoration(BuildContext context, Set<YgFieldState> states) {
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

    return BoxDecoration(
      border: switch (states.variant) {
        YgFieldVariant.outlined => base,
        YgFieldVariant.standard => Border(
            bottom: base.bottom,
          ),
      },
      borderRadius: switch (states.variant) {
        YgFieldVariant.outlined => _theme.borderRadiusOutlined,
        YgFieldVariant.standard => null,
      },
    );
  }

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldDecorationTheme get _theme => _fieldTheme.decorationTheme;

  Curve get curve => _fieldTheme.animationCurve;

  Duration get duration => _fieldTheme.animationDuration;
}
