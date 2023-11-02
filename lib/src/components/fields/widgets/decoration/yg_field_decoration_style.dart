import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../../yg_field_state.dart';

class YgFieldDecorationStyle extends YgStyleWithDefaults<YgFieldState> {
  YgFieldDecorationStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedBorderProperty border;
  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedEdgeInsetsProperty childPadding;
  late final YgAnimatedEdgeInsetsProperty suffixPadding;
  late final YgAnimatedDecorationProperty boxDecoration;
  late final YgAnimatedBorderRadiusProperty borderRadius;

  @override
  void init() {
    border = animate(YgBorderProperty<YgFieldState>.resolveWith(_resolveBorder));
    childPadding = animate(YgEdgeInsetsProperty<YgFieldState>.resolveWith(_resolveChildPadding));
    borderRadius = animate(YgBorderRadiusProperty<YgFieldState>.resolveWith(_resolveBorderRadius));
    suffixPadding = animate(YgEdgeInsetsProperty<YgFieldState>.resolveWith(_resolveSuffixPadding));
    boxDecoration = animate(YgDecorationProperty<YgFieldState>.resolveWith(_resolveBoxDecoration));
    backgroundColor = animate(YgColorProperty<YgFieldState>.resolveWith(_resolveBackgroundColor));
  }

  EdgeInsets _resolveSuffixPadding(BuildContext context, YgFieldState state) {
    if (state.variant.value == YgFieldVariant.outlined) {
      return _theme.outlinedSuffixPadding;
    }

    return _theme.standardSuffixPadding;
  }

  EdgeInsets _resolveChildPadding(BuildContext context, YgFieldState state) {
    // TODO(DEV-1915): Have to find some better way to figure out the border
    // size to add to the padding.
    final YgFieldVariant variant = state.variant.value;
    final YgFieldSize size = state.size.value;

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

    if (state.suffix.value) {
      return base + borderPadding;
    }

    return base.copyWith(
          right: 0,
        ) +
        borderPadding;
  }

  BorderRadius _resolveBorderRadius(BuildContext context, YgFieldState state) {
    switch (state.variant.value) {
      case YgFieldVariant.outlined:
        return _theme.borderRadiusOutlined;
      case YgFieldVariant.standard:
        return _theme.borderRadiusDefault;
    }
  }

  Border _resolveBorder(BuildContext context, YgFieldState state) {
    Border base = _theme.borderDefault;

    if (state.disabled.value) {
      base = _theme.borderDisabled;
    } else if (state.error.value) {
      base = _theme.borderError;
    } else if (state.focused.value || state.opened.value) {
      base = _theme.borderFocus;
    } else if (state.hovered.value) {
      base = _theme.borderHover;
    }

    if (state.variant.value == YgFieldVariant.outlined) {
      return base;
    }

    return Border(
      bottom: base.bottom,
    );
  }

  Color _resolveBackgroundColor(BuildContext context, YgFieldState state) {
    if (state.variant.value == YgFieldVariant.standard) {
      return Colors.transparent;
    }

    if (state.disabled.value) {
      return _theme.backgroundDisabledColor;
    }
    if (state.error.value) {
      return _theme.backgroundErrorColor;
    }

    return _theme.backgroundDefaultColor;
  }

  BoxDecoration _resolveBoxDecoration(BuildContext context, YgFieldState state) {
    Border base = _theme.borderDefault;

    if (state.disabled.value) {
      base = _theme.borderDisabled;
    } else if (state.error.value) {
      base = _theme.borderError;
    } else if (state.focused.value || state.opened.value) {
      base = _theme.borderFocus;
    } else if (state.hovered.value) {
      base = _theme.borderHover;
    }

    return BoxDecoration(
      border: switch (state.variant.value) {
        YgFieldVariant.outlined => base,
        YgFieldVariant.standard => Border(bottom: base.bottom),
      },
      borderRadius: switch (state.variant.value) {
        YgFieldVariant.outlined => _theme.borderRadiusOutlined,
        YgFieldVariant.standard => null,
      },
    );
  }

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldDecorationTheme get _theme => _fieldTheme.decorationTheme;

  @override
  Curve get curve => _fieldTheme.animationCurve;

  @override
  Duration get duration => _fieldTheme.animationDuration;
}
