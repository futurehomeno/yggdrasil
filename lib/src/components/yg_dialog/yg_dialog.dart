import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_spacing_builder.dart';
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
    final YgDialogThemes dialogTheme = context.dialogTheme;

    final YgSpacingBuilder spacingBuilder = YgSpacingBuilder(
      horizontalSpacing: dialogTheme.buttonSpacing,
    );

    return Material(
      borderRadius: dialogTheme.outerBorderRadius,
      color: dialogTheme.backgroundColor,
      child: Padding(
        padding: dialogTheme.outerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: dialogTheme.iconPadding,
              decoration: BoxDecoration(
                color: dialogTheme.iconContainerColor,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            Padding(
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
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: spacingBuilder.buildWidgetWithSpacing(actions),
            )
          ],
        ),
      ),
    );
  }
}
