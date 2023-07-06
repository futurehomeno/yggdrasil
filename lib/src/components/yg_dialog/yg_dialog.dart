import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDialog extends StatelessWidget {
  YgDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.actions,
  }) : assert(actions.isNotEmpty, '"actions" should contain at least one button');

  final Widget icon;
  final String title;
  final String description;
  final List<YgButton> actions;

  @override
  Widget build(BuildContext context) {
    final YgDialogThemes dialogThemes = context.dialogThemes;

    final YgSpacingBuilder spacingBuilder = YgSpacingBuilder(
      horizontalSpacing: dialogThemes.buttonSpacing,
    );

    return Material(
      borderRadius: dialogThemes.outerBorderRadius,
      color: dialogThemes.backgroundColor,
      child: Padding(
        padding: dialogThemes.outerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildIcon(dialogThemes),
            _buildTextSection(dialogThemes),
            _buildActionsSection(spacingBuilder)
          ],
        ),
      ),
    );
  }

  Container _buildIcon(YgDialogThemes dialogTheme) {
    return Container(
      padding: dialogTheme.iconPadding,
      decoration: BoxDecoration(
        color: dialogTheme.iconContainerColor,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }

  Padding _buildTextSection(YgDialogThemes dialogTheme) {
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
          SizedBox(
            height: dialogTheme.titleDescriptionSpacing,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: dialogTheme.descriptionTextStyle,
          ),
        ],
      ),
    );
  }

  Column _buildActionsSection(YgSpacingBuilder spacingBuilder) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: spacingBuilder.buildWidgetWithSpacing(actions),
    );
  }
}
