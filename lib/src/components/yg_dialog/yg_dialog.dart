import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(bjhandeland): Icon can sometimes be a loading indicator.
// TODO(bjhandeland): Factories for variants, e.g. success, warning, etc.
class YgDialog extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgDialog({
    super.key,
    required this.header,
    required this.title,
    required this.description,
    this.ygButtonGroup,
  });

  /// Content that is displayed above the title, typically an icon.
  ///
  /// The content is wrapped in a circular container with a background color.
  final Widget header;

  /// Title of the dialog.
  final String title;

  /// Description of the dialog.
  final String? description;

  /// Optional buttons that are displayed at the bottom of the dialog.
  ///
  /// For non-dismissible dialogs, with the exception of loading dialogs,
  /// the buttons are required and must allow the user to close the dialog.
  final YgButtonGroup? ygButtonGroup;

  @override
  Widget build(BuildContext context) {
    final YgDialogTheme dialogTheme = context.dialogTheme;
    final YgButtonGroup? ygButtonGroup = this.ygButtonGroup;

    return Material(
      borderRadius: dialogTheme.outerBorderRadius,
      color: dialogTheme.backgroundColor,
      child: Padding(
        padding: dialogTheme.outerPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildHeader(dialogTheme),
            _buildTextSection(dialogTheme),
            if (ygButtonGroup != null) ygButtonGroup,
          ].withVerticalSpacing(30.0),
        ),
      ),
    );
  }

  Widget _buildHeader(YgDialogTheme dialogTheme) {
    return Container(
      padding: dialogTheme.iconPadding,
      decoration: BoxDecoration(
        color: dialogTheme.iconContainerColor,
        shape: BoxShape.circle,
      ),
      child: header,
    );
  }

  Widget _buildTextSection(YgDialogTheme dialogTheme) {
    final String? description = this.description;

    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: dialogTheme.titleTextStyle,
        ),
        if (description != null)
          Text(
            description,
            textAlign: TextAlign.center,
            style: dialogTheme.descriptionTextStyle,
          ),
      ].withVerticalSpacing(dialogTheme.titleDescriptionSpacing),
    );
  }
}
