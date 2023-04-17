import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_button_size.dart';
import 'yg_button_variant.dart';

class YgButtonStyle {
  const YgButtonStyle({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.shape,
    required this.disabledShape,
    required this.padding,
  });

  factory YgButtonStyle.fromVariant({
    required BuildContext context,
    required ButtonVariant variant,
    ButtonSize size = ButtonSize.medium,
  }) {
    switch (variant) {
      case ButtonVariant.primary:
        return YgButtonStyle.primary(
          context: context,
          size: size,
        );
      case ButtonVariant.secondary:
        // TODO(bjhandeland): Make secondary.
        return YgButtonStyle.secondary(
          context: context,
          size: size,
        );
      case ButtonVariant.text:
        // TODO(bjhandeland): Make text.
        return YgButtonStyle.text(
          context: context,
          size: size,
        );
      case ButtonVariant.link:
        // TODO(bjhandeland): Make link.
        return YgButtonStyle.link(
          context: context,
          size: size,
        );
      case ButtonVariant.critical:
        // TODO(bjhandeland): Make critical.
        return YgButtonStyle.critical(
          context: context,
          size: size,
        );
    }
  }

  factory YgButtonStyle.primary({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.primaryButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.primaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.primaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.primaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.primaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.secondary({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.secondaryButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.secondaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.secondaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.secondaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.secondaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.text({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.textButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.textButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.textButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.textButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.textButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.link({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.linkButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.linkButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.linkButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.linkButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.linkButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.critical({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.criticalButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.criticalButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.criticalButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.criticalButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.criticalButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  ButtonStyle toButtonStyle() {
    return ButtonStyle(
      backgroundColor: ButtonStyleButton.allOrNull(backgroundColor),
      textStyle: _YgButtonTextStyleProperty(
        textStyle: textStyle,
        disabled: disabledTextStyle,
      ),
      shape: _YgButtonOutlinedBorderProperty(
        outlinedBorder: shape,
        disabled: disabledShape,
      ),
      padding: ButtonStyleButton.allOrNull(padding),
      minimumSize: ButtonStyleButton.allOrNull(const Size(80, 26)),
      maximumSize: ButtonStyleButton.allOrNull(Size.infinite),
      visualDensity: VisualDensity.standard,
      animationDuration: const Duration(milliseconds: 200),
      elevation: ButtonStyleButton.allOrNull(0.0),
      alignment: Alignment.center,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: _YgButtonMouseCursorProperty(
        mouseCursor: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final OutlinedBorder shape;
  final OutlinedBorder disabledShape;
  // final BorderSide side;
  // final BorderSide disabledSide;
  final EdgeInsets padding;
}

@immutable
class _YgButtonColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  _YgButtonColorProperty({
    required this.color,
    required this.disabled,
  });

  final Color? color;
  final Color? disabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return color;
  }
}

@immutable
class _YgButtonTextStyleProperty extends MaterialStateProperty<TextStyle?> with Diagnosticable {
  _YgButtonTextStyleProperty({
    required this.textStyle,
    required this.disabled,
  });

  final TextStyle? textStyle;
  final TextStyle? disabled;

  @override
  TextStyle? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return textStyle;
  }
}

@immutable
class _YgButtonOutlinedBorderProperty extends MaterialStateProperty<OutlinedBorder?> with Diagnosticable {
  _YgButtonOutlinedBorderProperty({
    required this.outlinedBorder,
    required this.disabled,
  });

  final OutlinedBorder? outlinedBorder;
  final OutlinedBorder? disabled;

  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return outlinedBorder;
  }
}

@immutable
class _YgButtonBorderSideProperty extends MaterialStateProperty<BorderSide?> with Diagnosticable {
  _YgButtonBorderSideProperty({
    required this.outlinedBorder,
    required this.disabled,
  });

  final BorderSide? outlinedBorder;
  final BorderSide? disabled;

  @override
  BorderSide? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return outlinedBorder;
  }
}

@immutable
class _YgButtonMouseCursorProperty extends MaterialStateProperty<MouseCursor?> with Diagnosticable {
  _YgButtonMouseCursorProperty({
    required this.mouseCursor,
    required this.disabled,
  });

  final MouseCursor? mouseCursor;
  final MouseCursor? disabled;

  @override
  MouseCursor? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return mouseCursor;
  }
}
