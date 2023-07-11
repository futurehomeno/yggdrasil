import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCallout extends StatelessWidget {
  const YgCallout({
    required this.calloutVariant,
    required this.description,
    required this.onClose,
    this.title,
    this.textLink,
    super.key,
  });

  final YgCalloutVariant calloutVariant;
  final String description;
  final String? title;
  final YgTextLink? textLink;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final YgCalloutThemes theme = context.calloutThemes;

    return Material(
      color: calloutVariant.getBackgroundColor(theme),
      shape: RoundedRectangleBorder(
        borderRadius: theme.borderRadius,
        side: BorderSide(
          color: calloutVariant.getBorderColor(theme),
        ),
      ),
      child: Padding(
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: theme.titleSpacing),
                      child: Text(
                        title!,
                        style: theme.titleTextStyle,
                      ),
                    ),
                  Text(
                    description,
                    style: theme.descriptionTextStyle,
                  ),
                  if (textLink != null)
                    Padding(
                      padding: EdgeInsets.only(top: theme.linkSpacing),
                      child: textLink!,
                    )
                ],
              ),
            ),
            SizedBox(width: theme.closeButtonSpacing),
            // TODO(emeban): `IconButton` -> `YgIcon` (when YgIcon gets merged)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }
}
