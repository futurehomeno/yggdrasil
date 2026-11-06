import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_header.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(DEV-1919): find a way to allow slivers being used, in case of long lists.
class YgBottomSheet extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.footerButtons,
    this.variant = YgBottomSheetVariant.standard,
  });

  final String title;
  final Widget content;
  final Widget? footerButtons;

  /// Background variant of the bottom sheet.
  ///
  /// Use [YgBottomSheetVariant.weak] when the content consists of cards on a
  /// weak background, e.g. a YgSettingSection.
  final YgBottomSheetVariant variant;

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;
    final YgBottomSheetScrollPhysicsProvider? scrollPhysicsProvider = context
        .dependOnInheritedWidgetOfExactType<YgBottomSheetScrollPhysicsProvider>();

    return RepaintBoundary(
      child: Material(
        borderRadius: bottomSheetTheme.borderRadius,
        color: switch (variant) {
          YgBottomSheetVariant.standard => bottomSheetTheme.backgroundColor,
          YgBottomSheetVariant.weak => bottomSheetTheme.weakBackgroundColor,
        },
        clipBehavior: Clip.antiAlias,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: bottomSheetTheme.verticalOuterPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                YgBottomSheetHeader(
                  title: title,
                  variant: variant,
                ),
                Flexible(
                  child: YgScrollShadow(
                    child: SingleChildScrollView(
                      physics: scrollPhysicsProvider?.scrollPhysics,
                      child: content,
                    ),
                  ),
                ),
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
    );
  }
}
