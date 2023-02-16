// import 'package:flutter/material.dart';
//
// class YgButtonBase extends StatelessWidget {
//   const YgButtonBase({
//     super.key,
//     required this.onTap,
//     required this.onLongPress,
//     required this.onHover,
//     required this.onFocusChange,
//     required this.focusNode,
//     required this.autofocus,
//     required this.child,
//     required this.buttonStyle,
//   });
//
//   final VoidCallback? onTap;
//   final VoidCallback? onLongPress;
//   final ValueChanged<bool>? onHover;
//   final ValueChanged<bool>? onFocusChange;
//   final FocusNode? focusNode;
//   final bool autofocus;
//   final Widget child;
//   final YgButtonStyle buttonStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       textStyle: buttonStyle.textStyle,
//       child: InkWell(
//         onTap: onTap,
//         onLongPress: onLongPress,
//         onHover: onHover,
//         onFocusChange: onFocusChange,
//         focusNode: focusNode,
//         autofocus: autofocus,
//         child: child,
//       ),
//     );
//   }
// }
