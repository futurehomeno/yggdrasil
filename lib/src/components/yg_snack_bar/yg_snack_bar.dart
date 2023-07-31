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
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: YgSnackBarMapper.getContainerIconColor(
              theme: snackBarTheme,
              snackBarVariant: variant,
            ),
          ),
          child: Padding(
            padding: snackBarTheme.iconContainerPadding,
            child: YgSnackBarMapper.getIcon(
              theme: snackBarTheme,
              snackBarVariant: variant,
            ),
          ),
        ),
        Expanded(
          child: Text(
            message,
            style: snackBarTheme.messageTextStyle,
          ),
        ),
        YgIcon(
          YgIcons.cross,
          color: snackBarTheme.closeIconColor,
          size: YgIconSize.small,
          tapSize: YgIconTapSize.larger,
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ].withHorizontalSpacing(snackBarTheme.messageSpacing),
    );
  }
}
