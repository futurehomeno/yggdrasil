import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/widgets/yg_buttons/yg_button_style.dart';

class YgButtonText extends ButtonStyleButton {
  YgButtonText({
    super.key,
    required String text,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
  }) : super(child: (Text(text)));

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgButtonStyle(
      foregroundColor: context.buttonThemes.textButtonTheme.textColor,
      disabledForegroundColor: context.buttonThemes.textButtonTheme.textColor,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent,
      textStyle: context.buttonThemes.textButtonTheme.textStyle,
      padding: context.buttonThemes.buttonPadding,
    );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return TextButtonTheme.of(context).style;
  }
}

// class _YgButtonText extends StatelessWidget {
//   const _YgButtonText(
//     this.text,
//   );
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: context.buttonThemes.buttonPadding,
//       child: Text(
//         style: context.buttonThemes.textButtonTheme.textStyle
//             .copyWith(color: context.buttonThemes.textButtonTheme.textColor),
//         text,
//       ),
//     );
//   }
// }
