// import 'package:fh_utils/fh_utils.dart';
import 'package:flutter/material.dart';

import '_yg_text_link.dart';

class YgTextLink extends StatelessWidget {
  const YgTextLink({
    super.key,
    required this.text,
    required this.url,
    this.onPressed,
    this.disabled = false,
    this.size = YgTextLinkSize.small,
    this.weight = YgTextLinkWeight.weak,
    this.icon,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  final String text;
  final String url;
  final VoidCallback? onPressed;
  final bool disabled;
  final YgTextLinkSize size;
  final YgTextLinkWeight weight;
  final Widget? icon;
  final bool autofocus;
  final Clip clipBehavior;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return YgTextLinkButton(
      text: text,
      onPressed: disabled ? null : _handlePress,
      size: size,
      weight: weight,
      icon: icon,
      clipBehavior: clipBehavior,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
    );
  }

  void _handlePress() {
    onPressed?.call();
    // FhUrlLauncher().launchUrl(url);
  }
}
