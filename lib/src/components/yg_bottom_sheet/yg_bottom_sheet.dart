import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_header.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(bjhandeland): potentially expose the scroll controller.
// TODO(Tim): find a way to allow slivers being used, in case of long lists.
class YgBottomSheet extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footerButtons,
  });

  final String title;
  final Widget content;
  final YgButtonGroup? footerButtons;

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider =
        context.dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: bottomSheetTheme.borderRadius,
        color: bottomSheetTheme.backgroundColor,
        child: SafeArea(
          top: false,
          child: ClipRRect(
            borderRadius: bottomSheetTheme.borderRadius,
            child: Padding(
              padding: bottomSheetTheme.verticalOuterPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  YgBottomSheetHeader(title: title),
                  _buildContent(scrollPhysicsProvider),
                  if (footerButtons != null)
                    Padding(
                      padding: bottomSheetTheme.footerPadding,
                      child: footerButtons!,
                    ),
                ].withVerticalSpacing(bottomSheetTheme.contentSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider,
  ) {
    return Flexible(
      child: YgScrollShadow.builder(
        builder: (BuildContext context, ScrollController controller) {
          return SingleChildScrollView(
            controller: controller,
            physics: scrollPhysicsProvider?.scrollPhysics,
            child: content,
          );
        },
      ),
    );
  }
}
