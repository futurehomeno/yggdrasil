import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_button.dart';
import 'yg_button_style.dart';

class YgPrimaryButton extends YgButton {
  const YgPrimaryButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    required super.child,
  });

  @override
  YgButtonStyle defaultStyleOf(BuildContext context) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.primaryButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.primaryButtonTheme.textStyle,
      shape: YgRoundedRectangleGradientBorder(
        width: context.buttonThemes.primaryButtonTheme.borderWidth,
        gradient: context.buttonThemes.primaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.primaryButtonTheme.borderRadius,
      ),
      padding: context.buttonThemes.buttonPadding,
    );
  }
}
