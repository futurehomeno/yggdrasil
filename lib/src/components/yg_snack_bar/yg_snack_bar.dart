import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'mappers/_mappers.dart';

/// A custom widget for styled SnackBar.
class YgSnackBar extends SnackBar {
  YgSnackBar({
    super.key,
    required BuildContext context,
    required String message,
    YgSnackBarVariant variant = YgSnackBarVariant.highlight,
  }) : super(
          content: _buildSnackBarContent(message, variant, context),
          backgroundColor: context.snackBarTheme.backgroundColor,
          behavior: SnackBarBehavior.floating,
          margin: context.snackBarTheme.margin,
          padding: context.snackBarTheme.padding,
          shape: RoundedRectangleBorder(borderRadius: context.snackBarTheme.borderRadius),
        );

  static Widget _buildSnackBarContent(
    String message,
    YgSnackBarVariant variant,
    BuildContext context,
  ) {
    final YgSnackBarTheme theme = context.snackBarTheme;

    return Row(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: YgSnackBarMapper.getContainerIconColor(
              theme: theme,
              snackBarVariant: variant,
            ),
          ),
          child: Padding(
            padding: theme.iconContainerPadding,
            child: YgSnackBarMapper.getIcon(
              theme: theme,
              snackBarVariant: variant,
            ),
          ),
        ),
        Expanded(
          child: Text(
            message,
            style: theme.messageTextStyle,
          ),
        ),
        YgIcon(
          YgIcons.cross,
          color: context.defaults.invertedIconColor,
          size: YgIconSize.small,
          tapSize: YgIconTapSize.larger,
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ].withHorizontalSpacing(theme.messageSpacing),
    );
  }
}
