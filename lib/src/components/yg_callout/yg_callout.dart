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
    final YgCalloutThemes theme = context.calloutTheme;

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
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null)
                    Text(
                      title!,
                      style: theme.titleTextStyle,
                    ),
                  if (title != null) SizedBox(height: theme.spacing),
                  Text(
                    description,
                    style: theme.descriptionTextStyle,
                  ),
                  if (textLink != null) SizedBox(height: theme.spacing),
                  if (textLink != null) textLink!
                ],
              ),
            ),
            SizedBox(width: theme.spacing),
            IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
