import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/bottom_sheet/_bottom_sheet.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../_components.dart';

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
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: theme.borderRadius,
        color: theme.backgroundColor,
        child: ClipRRect(
          borderRadius: theme.borderRadius,
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildHeader(theme),
                _buildContent(scrollPhysicsProvider, theme),
                if (footer != null) _buildFooter(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildFooter(YgBottomSheetThemes theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(
        top: theme.footerPadding.top,
      ),
      child: footer,
    );
  }

  Padding _buildHeader(YgBottomSheetThemes theme) {
    return Padding(
      padding: theme.outerPadding.copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: _buildDragHandle(theme),
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              title,
              style: theme.titleStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDragHandle(YgBottomSheetThemes theme) {
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: theme.handleBarColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }

  Flexible _buildContent(
    YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider,
    YgBottomSheetThemes theme,
  ) {
    return Flexible(
      child: YgScrollShadow(
        child: SingleChildScrollView(
          physics: scrollPhysicsProvider?.scrollPhysics,
          child: Padding(
            padding: theme.outerPadding.copyWith(
              top: 0,
              bottom: 0,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
