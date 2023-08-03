import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_snackbar/mappers/_mappers.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A custom widget for styled Snackbar.
class YgSnackbar extends StatelessWidget {
  const YgSnackbar({
    super.key,
    required this.variant,
    required this.message,
    required this.onClose,
  });

  /// Style variant of the Snackbar.
  final YgSnackbarVariant variant;

  /// Main content of the Snackbar.
  final String message;

  /// Callback triggered on Snackbar close.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final YgSnackbarTheme theme = context.snackbarTheme;

    return Material(
      color: theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: theme.borderRadius,
      ),
      child: Padding(
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: YgSnackbarMapper.getContainerIconColor(
                  theme: theme,
                  snackbarVariant: variant,
                ),
              ),
              child: Padding(
                padding: theme.iconContainerPadding,
                child: YgSnackbarMapper.getIcon(
                  theme: theme,
                  snackbarVariant: variant,
                ),
              ),
            ),
            Expanded(
              child: Text(
                message,
                style: theme.messageTextStyle,
              ),
            ),
            YgIconButton(
              onPressed: onClose,
              size: YgIconButtonSize.small,
              child: YgIcon(
                YgIcons.cross,
                color: theme.closeIconColor,
              ),
            ),
          ].withHorizontalSpacing(theme.messageSpacing),
        ),
      ),
    );
  }
}
