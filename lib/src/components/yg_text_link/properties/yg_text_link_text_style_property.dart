import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

@immutable
class YgTextLinkTextStyleProperty extends MaterialStateProperty<TextStyle?> with Diagnosticable {
  YgTextLinkTextStyleProperty({
    required this.theme,
    required this.size,
    required this.weight,
  });

  final YgTextLinkTheme theme;
  final YgTextLinkSize size;
  final YgTextLinkWeight weight;

  @override
  TextStyle? resolve(Set<MaterialState> states) {
    return _getBaseTextStyle().copyWith(
      color: _resolveColor(states),
    );
  }

  Color _resolveColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return theme.disabledColor;
    } else if (states.contains(MaterialState.pressed)) {
      return theme.pressedColor;
    } else if (states.contains(MaterialState.hovered)) {
      return theme.hoverColor;
    } else if (states.contains(MaterialState.focused)) {
      return theme.focusColor;
    } else {
      return theme.defaultColor;
    }
  }

  TextStyle _getBaseTextStyle() {
    switch (size) {
      case YgTextLinkSize.small:
        switch (weight) {
          case YgTextLinkWeight.weak:
            return theme.smallWeakTextStyle;
          case YgTextLinkWeight.strong:
            return theme.smallStrongTextStyle;
        }
      case YgTextLinkSize.medium:
        switch (weight) {
          case YgTextLinkWeight.weak:
            return theme.mediumWeakTextStyle;
          case YgTextLinkWeight.strong:
            return theme.mediumStrongTextStyle;
        }
    }
  }
}
