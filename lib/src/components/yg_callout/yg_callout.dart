import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null) _buildTitle(theme, title),
                  _buildDescription(theme),
                  if (textLink != null) _buildTextLink(theme, textLink),
                ],
              ),
            ),
            if (onClose != null) _buildCloseButton(),
          ].withHorizontalSpacing(theme.closeButtonSpacing),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return YgIconButton(
      onPressed: onClose,
      size: YgIconButtonSize.small,
      icon: YgIcons.cross,
    );
  }

  Widget _buildTitle(YgCalloutTheme theme, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: theme.titleSpacing),
      child: Text(
        title,
        style: theme.titleTextStyle,
      ),
    );
  }

  Widget _buildTextLink(YgCalloutTheme theme, YgTextLink textLink) {
    return Padding(
      padding: EdgeInsets.only(top: theme.linkSpacing),
      child: textLink,
    );
  }

  Widget _buildDescription(YgCalloutTheme theme) {
    return Text(
      description,
      style: theme.descriptionTextStyle,
    );
  }
}
