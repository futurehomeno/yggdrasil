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
    final YgTextLink? textLink = this.textLink;
    final String? title = this.title;

    return Material(
      color: _getBackgroundColor(theme),
      shape: RoundedRectangleBorder(
        borderRadius: theme.borderRadius,
        side: BorderSide(
          color: _getBorderColor(theme),
        ),
      ),
      child: Padding(
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: title == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: theme.titleSpacing),
                      child: Text(
                        title,
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
                      child: textLink,
                    )
                ],
              ),
            ),
            SizedBox(width: theme.closeButtonSpacing),
            YgIcon(
              icon: 'icon',
              onTap: onClose,
              iconSize: YgIconSize.small,
              tapSize: YgIconTapSize.large,
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(YgCalloutThemes theme) {
    switch (calloutVariant) {
      case YgCalloutVariant.highlight:
        return theme.highlightCalloutTheme.backgroundColor;
      case YgCalloutVariant.success:
        return theme.successCalloutTheme.backgroundColor;
      case YgCalloutVariant.warning:
        return theme.warningCalloutTheme.backgroundColor;
      case YgCalloutVariant.critical:
        return theme.criticalCalloutTheme.backgroundColor;
    }
  }

  Color _getBorderColor(YgCalloutThemes theme) {
    switch (calloutVariant) {
      case YgCalloutVariant.highlight:
        return theme.highlightCalloutTheme.borderColor;
      case YgCalloutVariant.success:
        return theme.successCalloutTheme.borderColor;
      case YgCalloutVariant.warning:
        return theme.warningCalloutTheme.borderColor;
      case YgCalloutVariant.critical:
        return theme.criticalCalloutTheme.borderColor;
    }
  }
}
