import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'properties/_properties.dart';
import 'widgets/_widgets.dart';

/// Text link button implementation.
class YgTextLink extends ButtonStyleButton with StatefulWidgetDebugMixin {
  YgTextLink({
    super.key,
    required String text,
    required super.onPressed,
    this.size = YgTextLinkSize.small,
    this.weight = YgTextLinkWeight.weak,
    this.external = false,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
  }) : super(
          child: YgTextLinkContent(
            external: external,
            text: text,
          ),
          style: null,
        );

  final YgTextLinkSize size;
  final YgTextLinkWeight weight;
  final bool external;

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
      padding: ButtonStyleButton.allOrNull(
        // These values are not the same as in the design, but due to some
        // differences in how flutter renders things compared to figma, these
        // values will create the desired look.
        const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
      ),
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
