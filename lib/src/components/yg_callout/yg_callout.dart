import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCallout extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgCallout({
    super.key,
    required this.description,
    this.variant = YgCalloutVariant.highlight,
    this.title,
    this.textLink,
    this.onClose,
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
      color: YgCalloutMapper.getBackgroundColor(
        theme: theme,
        variant: variant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: theme.borderRadius,
        side: BorderSide(
          color: YgCalloutMapper.getBorderColor(
            theme: theme,
            variant: variant,
          ),
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
                    ),
                ],
              ),
            ),
            if (onClose != null)
              YgIconButton(
                onPressed: onClose,
                size: YgIconButtonSize.small,
                child: const YgIcon(YgIcons.cross),
              ),
          ].withHorizontalSpacing(theme.closeButtonSpacing),
        ),
      ),
    );
  }
}
