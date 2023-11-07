import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'mappers/_mappers.dart';

/// A custom widget for styled SnackBar.
class YgSnackBar extends SnackBar with StatefulWidgetDebugMixin {
  YgSnackBar({
    super.key,
    required BuildContext context,
    required String message,
    YgSnackBarVariant variant = YgSnackBarVariant.highlight,
    VoidCallback? onPressed,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  })  : assert(scaffoldMessengerKey == null || onPressed == null, 'Cannot use both onPressed and scaffoldMessengerKey'),
        super(
          content: _buildSnackBarContent(
            context: context,
            message: message,
            variant: variant,
            onPressed: onPressed,
            scaffoldMessengerKey: scaffoldMessengerKey,
          ),
          backgroundColor: context.snackBarTheme.backgroundColor,
          behavior: SnackBarBehavior.floating,
          margin: context.snackBarTheme.margin,
          padding: context.snackBarTheme.padding,
          shape: RoundedRectangleBorder(
            borderRadius: context.snackBarTheme.borderRadius,
          ),
        );

  static Widget _buildSnackBarContent({
    required BuildContext context,
    required String message,
    required YgSnackBarVariant variant,
    required VoidCallback? onPressed,
    required GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) {
    final YgSnackBarTheme snackBarTheme = context.snackBarTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildDecorationIcon(snackBarTheme, variant),
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: snackBarTheme.minTextHeight,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message,
                style: snackBarTheme.messageTextStyle,
              ),
            ),
          ),
        ),
        YgIconButton(
          size: YgIconButtonSize.small,
          onPressed: () => _onPressed(
            context: context,
            onPressed: onPressed,
            scaffoldMessengerKey: scaffoldMessengerKey,
          ),
          colorableIconData: YgIcons.cross,
        ),
      ].withHorizontalSpacing(snackBarTheme.messageSpacing),
    );
  }

  static Widget _buildDecorationIcon(YgSnackBarTheme snackBarTheme, YgSnackBarVariant variant) {
    return Container(
      height: snackBarTheme.iconContainerSize,
      width: snackBarTheme.iconContainerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: YgSnackBarMapper.getContainerIconColor(
          theme: snackBarTheme,
          snackBarVariant: variant,
        ),
      ),
      child: Center(
        child: YgSnackBarMapper.getIcon(
          theme: snackBarTheme,
          snackBarVariant: variant,
        ),
      ),
    );
  }

  static void _onPressed({
    required BuildContext context,
    VoidCallback? onPressed,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) {
    if (onPressed != null) {
      onPressed();
    } else if (scaffoldMessengerKey != null) {
      scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}
