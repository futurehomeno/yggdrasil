import 'package:fh_utils/fh_utils.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'properties/_properties.dart';

enum YgTextLinkSize {
  small,
  medium,
}

enum YgTextLinkWeight {
  weak,
  strong,
}

class YgTextLink extends ButtonStyleButton {
  YgTextLink(
      {super.key,
      required String text,
      required String url,
      Widget? icon,
      this.size = YgTextLinkSize.small,
      this.weight = YgTextLinkWeight.weak,
      VoidCallback? onPressed,
      super.autofocus = false,
      super.clipBehavior = Clip.none,
      bool disabled = false})
      : super(
          child: _YgTextLinkContent(
            text: text,
            icon: icon,
          ),
          onPressed: disabled
              ? null
              : () => _handlePress(
                    url: url,
                    onPressed: onPressed,
                  ),
          onLongPress: null,
          onHover: null,
          onFocusChange: null,
          style: null,
          focusNode: null,
        );

  static void _handlePress({
    required String url,
    VoidCallback? onPressed,
  }) {
    onPressed?.call();
    FhUrlLauncher().launchUrl(url);
  }

  final YgTextLinkSize size;
  final YgTextLinkWeight weight;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final YgTextLinkTheme theme = context.textLinkTheme;

    return ButtonStyle(
      backgroundColor: ButtonStyleButton.allOrNull(Colors.transparent),
      textStyle: YgTextLinkTextStyleProperty(
        size: size,
        theme: theme,
        weight: weight,
      ),
      shape: YgTextLinkOutlinedBorderProperty(
        focusColor: theme.focusColor,
      ),
      padding: ButtonStyleButton.allOrNull(const EdgeInsets.symmetric(horizontal: 3, vertical: 1)),
      minimumSize: ButtonStyleButton.allOrNull(Size.zero),
      maximumSize: ButtonStyleButton.allOrNull(Size.infinite),
      visualDensity: VisualDensity.standard,
      animationDuration: const Duration(milliseconds: 200),
      elevation: ButtonStyleButton.allOrNull(0.0),
      alignment: Alignment.center,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: YgTextLinkMouseCursorProperty(
        mouseCursor: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // We do not use themes this way.
    return null;
  }
}

class _YgTextLinkContent extends StatelessWidget {
  const _YgTextLinkContent({
    required this.text,
    required this.icon,
  });

  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(text),
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconTheme(
              data: IconThemeData(
                color: DefaultTextStyle.of(context).style.color,
                size: 16,
              ),
              child: icon!,
            ),
          ),
      ],
    );
  }
}
