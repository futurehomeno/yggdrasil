import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_snackbar/mappers/_mappers.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSnackbar extends StatelessWidget {
  const YgSnackbar({
    required this.snackbarVariant,
    required this.message,
    required this.onClose,
    super.key,
  });

  final YgSnackbarVariant snackbarVariant;
  final String message;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final YgSnackbarThemes theme = context.snackbarThemes;

    return Material(
      color: theme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: theme.borderRadius),
      child: Padding(
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: YgSnackbarVariantMapper.getContainerIconColor(
                theme: theme,
                snackbarVariant: snackbarVariant,
              ),
              shape: const CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(theme.containerIconSpacing),
                child: YgSnackbarVariantMapper.getIcon(
                  theme: theme,
                  snackbarVariant: snackbarVariant,
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
            // TODO(emeban): `GestureDetector` -> `YgIcon` (when YgIcon gets merged)
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                color: theme.closeIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
