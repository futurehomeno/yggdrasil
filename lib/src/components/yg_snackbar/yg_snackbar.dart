import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_snackbar/mappers/_mappers.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSnackbar extends StatelessWidget {
  const YgSnackbar({
    required this.variant,
    required this.message,
    required this.onClose,
    super.key,
  });

  final YgSnackbarVariant variant;
  final String message;
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
                color: YgSnackbarVariantMapper.getContainerIconColor(
                  theme: theme,
                  snackbarVariant: variant,
                ),
              ),
              child: Padding(
                padding: theme.iconContainerPadding,
                child: YgSnackbarVariantMapper.getIcon(
                  theme: theme,
                  snackbarVariant: variant,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.messageSpacing),
                child: Text(
                  message,
                  style: theme.messageTextStyle,
                ),
              ),
            ),
            YgIcon(
              SharedIcons.cross,
              color: context.defaults.invertedIconColor,
              onTap: onClose,
              size: YgIconSize.small,
              tapSize: YgIconTapSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
