import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppBar2 extends StatelessWidget {
  const YgAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    final YgAppBarTheme theme = context.appBarTheme;

    return Material(
      color: theme.backgroundColor,
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.appBarHorizontalPadding,
          ),
          child: SizedBox(
            height: theme.toolbarHeight,
            child: Row(
              children: <Widget>[
                YgIconButton(
                  icon: YgIcons.caretLeft,
                  onPressed: () => Navigator.maybePop(context),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Title',
                      style: theme.titleTextStyle,
                    ),
                  ),
                ),
              ].withHorizontalSpacing(theme.appBarHorizontalPadding),
            ),
          ),
        ),
      ),
    );
  }
}
