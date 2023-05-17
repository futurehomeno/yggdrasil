// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/buttons/button_themes.dart';
import 'package:yggdrasil/src/theme/buttons/extensions/critical_button_theme.dart';

import '../../../utils/_utils.dart';
import '../enums/_enums.dart';
import '../properties/_properties.dart';

abstract class YgButton extends ButtonStyleButton {
  YgButton({
    super.key,
    this.size = ButtonSize.medium,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required Widget child,
    Widget? leftIcon,
    Widget? rightIcon,
  }) : super(
          child: _YgButtonWithIconsChild(
            leftIcon: leftIcon,
            rightIcon: rightIcon,
            child: child,
          ),
        );

  factory YgButton.critical({
    Key key,
    required VoidCallback onPressed,
    required Widget child,
    VoidCallback onLongPress,
    ButtonStyle style,
    FocusNode focusNode,
    void Function(bool value)? onFocusChange,
    void Function(bool value)? onHover,
    MaterialStatesController? statesController,
    bool autofocus,
    Clip clipBehavior,
    ButtonSize size,
    Widget? leftIcon,
    Widget? rightIcon,
  }) = YgCriticalButton;

  final ButtonSize size;

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // We do not use themes this way.
    return null;
  }

  ButtonStyle styleFrom({
    required Color backgroundColor,
    required TextStyle textStyle,
    required TextStyle disabledTextStyle,
    required OutlinedBorder shape,
    required OutlinedBorder disabledShape,
    required EdgeInsets padding,
  }) {
    return ButtonStyle(
      backgroundColor: ButtonStyleButton.allOrNull(backgroundColor),
      textStyle: YgButtonTextStyleProperty(
        textStyle: textStyle,
        disabled: disabledTextStyle,
      ),
      shape: YgButtonOutlinedBorderProperty(
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
      mouseCursor: YgButtonMouseCursorProperty(
        mouseCursor: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }
}

class _YgButtonWithIconsChild extends StatelessWidget {
  const _YgButtonWithIconsChild({
    required this.child,
    required this.leftIcon,
    required this.rightIcon,
  });

  final Widget child;
  final Widget? rightIcon;
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (leftIcon != null)
          Padding(
            padding: EdgeInsets.only(
              right: context.buttonThemes.iconSpacing,
            ),
            child: leftIcon,
          ),
        Flexible(child: child),
        if (rightIcon != null)
          Padding(
            padding: EdgeInsets.only(
              left: context.buttonThemes.iconSpacing,
            ),
            child: rightIcon,
          ),
      ],
    );
  }
}

@Deprecated('Use YgButton.critical instead')
class YgCriticalButton extends YgButton {
  YgCriticalButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.statesController,
    super.autofocus,
    super.clipBehavior,
    super.size,
    super.leftIcon,
    super.rightIcon,
  });

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final YgButtonThemes buttonThemes = context.buttonThemes;
    final CriticalButtonTheme criticalButtonTheme = buttonThemes.criticalButtonTheme;
    return styleFrom(
      backgroundColor: criticalButtonTheme.backgroundColor,
      textStyle: criticalButtonTheme.textStyle,
      disabledTextStyle: criticalButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: criticalButtonTheme.borderGradient,
        borderRadius: buttonThemes.borderRadius,
        width: buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: criticalButtonTheme.disabledBorderGradient,
        borderRadius: buttonThemes.borderRadius,
        width: buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YgButton.critical(
        onPressed: () {},
        child: const Text('test'),
      ),
    );
  }
}
