import 'package:flutter/material.dart';

class YgButtonStyle {
  const YgButtonStyle({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.padding,
  });

  /// The style for a button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final MaterialStateProperty<TextStyle?>? textStyle;

  /// The button's background fill color.
  final MaterialStateProperty<Color?>? backgroundColor;

  /// The color for the button's [Text] and [Icon] widget descendants.
  ///
  /// This color is typically used instead of the color of the [textStyle]. All
  /// of the components that compute defaults from [ButtonStyle] values
  /// compute a default [foregroundColor] and use that instead of the
  /// [textStyle]'s color.
  final MaterialStateProperty<Color?>? foregroundColor;

  /// The highlight color that's typically used to indicate that
  /// the button is focused, hovered, or pressed.
  final MaterialStateProperty<Color?>? overlayColor;

  /// The padding between the button's boundary and its child.
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;

  static ButtonStyle styleFrom({
    required Color foregroundColor,
    required Color backgroundColor,
    required Color disabledForegroundColor,
    required Color disabledBackgroundColor,
    required TextStyle textStyle,
    required EdgeInsetsGeometry padding,
  }) {
    final MaterialStateProperty<Color> foregroundColorProp =
        _TextButtonDefaultColor(foregroundColor, disabledForegroundColor);
    final MaterialStateProperty<Color> backgroundColorProp =
        _TextButtonDefaultColor(backgroundColor, disabledBackgroundColor);
    final MaterialStateProperty<Color> overlayColor = _TextButtonDefaultOverlay(foregroundColor);
    final MaterialStateProperty<MouseCursor>? mouseCursor =
        _TextButtonDefaultMouseCursor(enabledMouseCursor!, disabledMouseCursor!);

    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      foregroundColor: foregroundColorProp,
      backgroundColor: backgroundColorProp,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      elevation: ButtonStyleButton.allOrNull<double>(elevation),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(maximumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: mouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }
}

@immutable
class _TextButtonDefaultColor extends MaterialStateProperty<Color> {
  _TextButtonDefaultColor(this.color, this.disabled);

  final Color color;
  final Color disabled;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return color;
  }
}

@immutable
class _TextButtonDefaultOverlay extends MaterialStateProperty<Color> {
  _TextButtonDefaultOverlay(this.primary);

  final Color primary;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return primary.withOpacity(0.04);
    }
    if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
      return primary.withOpacity(0.12);
    }
    return null;
  }
}
