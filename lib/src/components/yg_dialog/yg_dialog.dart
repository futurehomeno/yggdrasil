import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(bjhandeland): Icon can sometimes be a loading indicator.
// TODO(bjhandeland): Factories for variants, e.g. success, warning, etc.
class YgDialog extends StatelessWidget {
  const YgDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.ygButtonGroup,
  });

  final YgIcon icon;
  final String title;
  final String description;
  final YgButtonGroup ygButtonGroup;

  @override
  Widget build(BuildContext context) {
    final YgDialogTheme dialogTheme = context.dialogTheme;

    return Material(
      borderRadius: dialogTheme.outerBorderRadius,
      color: dialogTheme.backgroundColor,
      child: Padding(
        padding: dialogTheme.outerPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildIcon(dialogTheme),
            _buildTextSection(dialogTheme),
            ygButtonGroup,
          ],
        ),
      ),
    );
  }

  Container _buildIcon(YgDialogTheme dialogTheme) {
    return Container(
      padding: dialogTheme.iconPadding,
      decoration: BoxDecoration(
        color: dialogTheme.iconContainerColor,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }

  Padding _buildTextSection(YgDialogTheme dialogTheme) {
    return Padding(
      padding: dialogTheme.textSectionPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: dialogTheme.titleTextStyle,
          ),
          SizedBox(height: dialogTheme.titleDescriptionSpacing),
          Text(
            description,
            textAlign: TextAlign.center,
            style: dialogTheme.descriptionTextStyle,
          ),
        ],
      ),
    );
  }
}
