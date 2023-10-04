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
  }) : super(
          content: _buildSnackBarContent(
            context: context,
            message: message,
            variant: variant,
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
  }) {
    final YgSnackBarTheme snackBarTheme = context.snackBarTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildDecorationIcon(snackBarTheme, variant),
        Expanded(
          child: Text(
            message,
            style: snackBarTheme.messageTextStyle,
          ),
        ),
        YgIconButton(
          size: YgIconButtonSize.small,
          child: YgIcon(
            YgIcons.cross,
            color: context.snackBarTheme.closeIconColor,
          ),
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ].withHorizontalSpacing(snackBarTheme.messageSpacing),
    );
  }

  static Widget _buildDecorationIcon(YgSnackBarTheme snackBarTheme, YgSnackBarVariant variant) {
    return DecoratedBox(
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
}
