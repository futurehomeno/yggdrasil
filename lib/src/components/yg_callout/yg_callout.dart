import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCallout extends StatelessWidget {
  const YgCallout({
    required this.description,
    this.variant = YgCalloutVariant.highlight,
    this.title,
    this.textLink,
    this.onClose,
    super.key,
  });

  final String description;
  final YgCalloutVariant variant;
  final String? title;
  final YgTextLink? textLink;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final YgCalloutTheme theme = context.calloutTheme;
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
            if (onClose != null)
              Padding(
                padding: EdgeInsets.only(left: theme.closeButtonSpacing),
                child: YgIcon(
                  icon: SharedIcons.cross,
                  onTap: onClose,
                  size: YgIconSize.small,
                  tapSize: YgIconTapSize.large,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(YgCalloutTheme theme) {
    switch (variant) {
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

  Color _getBorderColor(YgCalloutTheme theme) {
    switch (variant) {
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
