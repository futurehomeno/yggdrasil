import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/yg_icon_button/mappers/_mappers.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/icon_button/_icon_button.dart';

import 'enums/_enums.dart';
import 'properties/_properties.dart';

/// Button style for YgIconButtons.
///
/// Variation of the [ButtonStyle] to better fit YgIconButtons.
/// Use [toButtonStyle] to convert to material [ButtonStyle].
class YgIconButtonStyle {
  const YgIconButtonStyle({
    required this.backgroundColor,
    required this.pressedColor,
    required this.disabledBackgroundColor,
    required this.size,
    required this.iconSize,
    required this.iconColor,
    required this.iconDisabledColor,
    required this.shape,
    required this.disabledShape,
  });

  factory YgIconButtonStyle.fromVariant({
    required BuildContext context,
    required YgIconButtonVariant variant,
    required YgIconButtonSize size,
  }) {
    final YgIconButtonTheme iconButtonTheme = context.iconButtonTheme;

    switch (variant) {
      case YgIconButtonVariant.standard:
        final StandardIconButtonTheme theme = context.iconButtonTheme.standardIconButtonTheme;

        return YgIconButtonStyle(
          backgroundColor: theme.backgroundColor,
          disabledBackgroundColor: theme.disabledBackgroundColor,
          size: YgIconButtonMapper.buildSize(theme: iconButtonTheme, size: size),
          iconSize: YgIconButtonMapper.buildIconSize(theme: iconButtonTheme, size: size),
          iconColor: theme.iconColor,
          iconDisabledColor: theme.disabledIconColor,
          pressedColor: theme.pressedColor,
          shape: const CircleBorder(),
          disabledShape: const CircleBorder(),
        );

      case YgIconButtonVariant.filled:
        final FilledIconButtonTheme theme = context.iconButtonTheme.filledIconButtonTheme;

        return YgIconButtonStyle(
          backgroundColor: theme.backgroundColor,
          disabledBackgroundColor: theme.disabledBackgroundColor,
          size: YgIconButtonMapper.buildSize(theme: iconButtonTheme, size: size),
          iconSize: YgIconButtonMapper.buildIconSize(theme: iconButtonTheme, size: size),
          iconColor: theme.iconColor,
          iconDisabledColor: theme.disabledIconColor,
          pressedColor: theme.pressedColor,
          shape: const CircleBorder(),
          disabledShape: const CircleBorder(),
        );

      case YgIconButtonVariant.tonal:
        final TonalIconButtonTheme theme = context.iconButtonTheme.tonalIconButtonTheme;

        return YgIconButtonStyle(
          backgroundColor: theme.backgroundColor,
          disabledBackgroundColor: theme.disabledBackgroundColor,
          size: YgIconButtonMapper.buildSize(theme: iconButtonTheme, size: size),
          iconSize: YgIconButtonMapper.buildIconSize(theme: iconButtonTheme, size: size),
          iconColor: theme.iconColor,
          iconDisabledColor: theme.disabledIconColor,
          pressedColor: theme.pressedColor,
          shape: const CircleBorder(),
          disabledShape: const CircleBorder(),
        );

      case YgIconButtonVariant.outlined:
        final OutlinedIconButtonTheme theme = context.iconButtonTheme.outlinedIconButtonTheme;

        return YgIconButtonStyle(
          backgroundColor: theme.backgroundColor,
          disabledBackgroundColor: theme.disabledBackgroundColor,
          size: YgIconButtonMapper.buildSize(theme: iconButtonTheme, size: size),
          iconSize: YgIconButtonMapper.buildIconSize(theme: iconButtonTheme, size: size),
          iconColor: theme.iconColor,
          iconDisabledColor: theme.disabledIconColor,
          pressedColor: theme.pressedColor,
          shape: CircleBorder(side: BorderSide(width: 1.0, color: theme.borderColor)),
          disabledShape: CircleBorder(side: BorderSide(width: 1.0, color: theme.borderColor)),
        );
    }
  }

  ButtonStyle toButtonStyle() {
    return ButtonStyle(
      backgroundColor: YgIconButtonBackgroundColorProperty(
        color: backgroundColor,
        disabled: disabledBackgroundColor,
      ),
      shape: YgIconButtonOutlinedBorderProperty(
        outlinedBorder: shape,
        disabled: disabledShape,
      ),
      iconColor: YgIconButtonIconColorProperty(
        color: iconColor,
        disabled: iconDisabledColor,
      ),
      iconSize: ButtonStyleButton.allOrNull(iconSize),
      padding: ButtonStyleButton.allOrNull(EdgeInsets.zero),
      minimumSize: ButtonStyleButton.allOrNull(Size.square(size)),
      maximumSize: ButtonStyleButton.allOrNull(Size.square(size)),
      visualDensity: VisualDensity.standard,
      animationDuration: const Duration(milliseconds: 200),
      elevation: ButtonStyleButton.allOrNull(0.0),
      alignment: Alignment.center,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: InkRipple.splashFactory,
      mouseCursor: YgIconButtonMouseCursorProperty(
        mouseCursor: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final double size;
  final double iconSize;
  final Color iconColor;
  final Color iconDisabledColor;
  final OutlinedBorder shape;
  final OutlinedBorder disabledShape;

  // TODO(DEV-1922): We have to use this at some point to fix the pressed color,
  // now we are stuck on some issues regarding setting colors without creating
  // unintended effects.
  // ignore: unused-code
  final Color pressedColor;
}
