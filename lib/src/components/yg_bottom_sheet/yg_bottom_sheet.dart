import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/bottom_sheet/bottom_sheet_themes.dart';

class YgBottomSheet extends StatelessWidget {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footer,
  });

  final String title;
  final Widget content;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetThemes theme = context.bottomSheetTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: theme.borderRadius,
        color: theme.backgroundColor,
      ),
      padding: theme.outerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Container(
              width: 48,
              height: 5,
              decoration: BoxDecoration(
                color: theme.handleBarColor,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              title,
              style: theme.titleStyle,
            ),
          ),
          content,
          if (footer != null)
            Padding(
              padding: theme.footerPadding,
              child: footer,
            )
        ],
      ),
    );
  }
}
