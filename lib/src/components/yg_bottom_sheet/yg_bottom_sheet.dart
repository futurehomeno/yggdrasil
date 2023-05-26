import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/scroll_physics/yg_bottom_sheet_scroll_physics_provider.dart';
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
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return Material(
      borderRadius: theme.borderRadius,
      color: theme.backgroundColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: theme.outerPadding.copyWith(bottom: 0),
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
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  physics: scrollPhysicsProvider?.scrollPhysics,
                  child: Padding(
                    padding: theme.outerPadding.copyWith(top: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        content,
                        if (footer != null)
                          Padding(
                            padding: theme.footerPadding,
                            child: footer,
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
